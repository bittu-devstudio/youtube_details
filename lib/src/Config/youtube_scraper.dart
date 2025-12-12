class YouTubeScraper {
  /// Extract ytInitialData JSON from HTML
  String? extractYtInitialData(String html) {
    final patterns = [
      RegExp(r'var ytInitialData\s*=\s*(\{.*?\});', dotAll: true),
      RegExp(r'window\["ytInitialData"\]\s*=\s*(\{.*?\});', dotAll: true),
      RegExp(r'ytInitialData"\s*:\s*(\{.*?\})\s*[,}]', dotAll: true),
    ];

    for (final pattern in patterns) {
      final match = pattern.firstMatch(html);
      if (match != null) {
        return match.group(1);
      }
    }
    return null;
  }

  /// Extract videos & shorts from tabs
  Map<String, dynamic> extractVideosAndShorts(List tabs) {
    final List<Map<String, dynamic>> videos = [];
    final List<dynamic> shorts = [];

    for (final item in tabs) {
      /// Normal videos
      if (item["videoRenderer"] != null) {
        final v = item["videoRenderer"];
        final thumb =
            (v["thumbnail"]?["thumbnails"] as List?)?.isNotEmpty == true
                ? v["thumbnail"]["thumbnails"][0]
                : null;

        videos.add({
          "videoId": v["videoId"] ?? "",
          "title": v["title"]?["runs"]?[0]?["text"] ?? "",
          "description": v["descriptionSnippet"]?["runs"]?[0]?["text"] ?? "",
          "thumbnail": thumb?["url"] ?? "",
          "thumb_width": thumb?["width"] ?? "",
          "thumb_height": thumb?["height"] ?? "",
          "views": v["viewCountText"]?["simpleText"] ??
              v["shortViewCountText"]?["simpleText"] ??
              "",
          "published": v["publishedTimeText"]?["simpleText"] ?? "",
          "channel": v["ownerText"]?["runs"]?[0]?["text"] ?? "",
          "channel_thumb": v["channelThumbnailSupportedRenderers"]
                      ?["channelThumbnailWithLinkRenderer"]?["thumbnail"]
                  ?["thumbnails"]?[0]?["url"] ??
              "",
          "duration": v["lengthText"]?["simpleText"] ?? "",
        });
      }

      /// Shorts gridShelf
      if (item["gridShelfViewModel"] != null) {
        shorts.add(item["gridShelfViewModel"]);
      }
    }

    return {
      "videos": videos,
      "shorts": shorts,
    };
  }

 /// Extract COMPLETE Shorts data from any depth (improved + full data)
List<Map<String, dynamic>> extractShortsRecursive(dynamic data) {
  final List<Map<String, dynamic>> shortsList = [];

  if (data is! List && data is! Map) return [];

  if (data is List) {
    for (final item in data) {
      shortsList.addAll(extractShortsRecursive(item));
    }
  }

  if (data is Map) {
    /// FULL SHORT ITEM FOUND
    if (data["shortsLockupViewModel"] != null) {
      final s = data["shortsLockupViewModel"];

      final reelWatch =
          s["onTap"]?["innertubeCommand"]?["reelWatchEndpoint"] ?? {};

      final inlineWatch = s["inlinePlayerData"]?["onVisible"]
              ?["innertubeCommand"]?["watchEndpoint"] ??
          {};

      final thumbList =
          (s["thumbnail"]?["sources"] as List?)?.map((t) => t).toList() ?? [];

      shortsList.add({
        /// BASIC
        "videoId": reelWatch["videoId"] ?? "",
        "shortUrl": "/shorts/${reelWatch["videoId"]}",
        "title": s["overlayMetadata"]?["primaryText"]?["content"] ?? "",
        "views": s["overlayMetadata"]?["secondaryText"]?["content"] ?? "",

        /// THUMBNAILS (full list)
        "thumbnails": thumbList,

        /// REEL WATCH ENDPOINT
        "reelWatchEndpoint": {
          "videoId": reelWatch["videoId"],
          "playerParams": reelWatch["playerParams"],
          "thumbnail": reelWatch["thumbnail"],
          "overlay": reelWatch["overlay"],
          "params": reelWatch["params"],
          "sequenceProvider": reelWatch["sequenceProvider"],
          "sequenceParams": reelWatch["sequenceParams"],
          "loggingContext": reelWatch["loggingContext"],
        },

        /// INLINE WATCH ENDPOINT
        "inlineWatch": {
          "videoId": inlineWatch["videoId"],
          "playerParams": inlineWatch["playerParams"],
          "extraParams": inlineWatch["playerExtraUrlParams"],
          "supportedConfig":
              inlineWatch["watchEndpointSupportedOnesieConfig"],
        },

        /// MENU ACTIONS (e.g. Add to Queue, Feedback)
        "menu": s["menuOnTap"]?["innertubeCommand"]?["showSheetCommand"],

        /// OVERLAY + METADATA
        "overlayMetadata": s["overlayMetadata"],
        "indexInCollection": s["indexInCollection"],
        "loggingDirectives": s["loggingDirectives"],
        "stackedFrameData": s["stackedFrameData"],
      });
    }

    /// Recursive search in contents
    if (data["contents"] != null) {
      shortsList.addAll(extractShortsRecursive(data["contents"]));
    }

    /// Deep scan entire map
    for (final k in data.keys) {
      shortsList.addAll(extractShortsRecursive(data[k]));
    }
  }

  return shortsList;
}



}
