/// Represents the result of a YouTube search for a channel.
///
/// Contains both standard videos and YouTube Shorts.
class SearchResponse {
  /// List of standard YouTube videos.
  final List<SearchVideoModel> videos;

  /// List of YouTube Shorts.
  final List<SearchShortModel> shorts;

  /// Creates a new `SearchResponse` instance.
  SearchResponse({
    required this.videos,
    required this.shorts,
  });
}

/// Represents a single standard YouTube video in a search result.
class SearchVideoModel {
  /// Unique YouTube video ID.
  final String videoId;

  /// Title of the video.
  final String title;

  /// Description of the video.
  final String description;

  /// URL of the video thumbnail.
  final String thumbnail;

  /// Width of the thumbnail in pixels.
  final int thumbWidth;

  /// Height of the thumbnail in pixels.
  final int thumbHeight;

  /// View count of the video as a formatted string (e.g., "1.2M views").
  final String views;

  /// Time since video was published (e.g., "2 weeks ago").
  final String published;

  /// Name of the channel that uploaded the video.
  final String channel;

  /// URL of the channel's profile image.
  final String channelThumb;

  /// Duration of the video (e.g., "12:34").
  final String duration;

  /// Creates a new `SearchVideoModel` instance.
  SearchVideoModel({
    required this.videoId,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.thumbWidth,
    required this.thumbHeight,
    required this.views,
    required this.published,
    required this.channel,
    required this.channelThumb,
    required this.duration,
  });

  /// Creates a `SearchVideoModel` from JSON data.
  factory SearchVideoModel.fromJson(Map<String, dynamic> json) {
    return SearchVideoModel(
      videoId: json['videoId'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      thumbWidth: int.tryParse(json['thumb_width']?.toString() ?? '360') ?? 360,
      thumbHeight:
          int.tryParse(json['thumb_height']?.toString() ?? '202') ?? 202,
      views: json['views'] ?? '',
      published: json['published'] ?? '',
      channel: json['channel'] ?? '',
      channelThumb: json['channel_thumb'] ?? '',
      duration: json['duration'] ?? '',
    );
  }
}
/// Full Shorts data model (supports complete YouTube Shorts metadata)
/// 
class SearchShortModel {
  /// Basic Info
  final String videoId;
  final String shortUrl;
  final String title;
  final String views;

  /// Main Thumbnail
  final String thumbnailUrl;
  final int thumbnailWidth;
  final int thumbnailHeight;

  /// All thumbnails list
  final List<Map<String, dynamic>> thumbnails;

  /// Reel Watch Endpoint
  final Map<String, dynamic> reelWatchEndpoint;

  /// Inline Watch Endpoint
  final Map<String, dynamic> inlineWatch;

  /// Menu actions
  final Map<String, dynamic>? menu;

  /// Metadata
  final Map<String, dynamic>? overlayMetadata;

  /// Logging
  final Map<String, dynamic>? loggingDirectives;

  /// Position in list
  final int? indexInCollection;

  /// Extra raw block
  final Map<String, dynamic>? extra;

  SearchShortModel({
    required this.videoId,
    required this.shortUrl,
    required this.title,
    required this.views,
    required this.thumbnailUrl,
    required this.thumbnailWidth,
    required this.thumbnailHeight,
    required this.thumbnails,
    required this.reelWatchEndpoint,
    required this.inlineWatch,
    required this.menu,
    required this.overlayMetadata,
    required this.loggingDirectives,
    required this.indexInCollection,
    this.extra,
  });

  /// -------- JSON PARSER --------
  factory SearchShortModel.fromJson(Map<String, dynamic> json) {
    // Read thumbnails safely
    final List thumbs =
        (json["thumbnails"] is List) ? json["thumbnails"] : [];

    final thumb = thumbs.isNotEmpty ? thumbs[0] : null;

    return SearchShortModel(
      videoId: json['videoId']?.toString() ?? '',
      shortUrl: json['shortUrl']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      views: json['views']?.toString() ?? '',

      /// Main thumbnail
      thumbnailUrl: thumb?['url'] ?? '',
      thumbnailWidth: (thumb?['width'] is int)
          ? thumb['width']
          : int.tryParse(thumb?['width']?.toString() ?? '0') ?? 0,
      thumbnailHeight: (thumb?['height'] is int)
          ? thumb['height']
          : int.tryParse(thumb?['height']?.toString() ?? '0') ?? 0,

      /// Full list of thumbnails
      thumbnails: List<Map<String, dynamic>>.from(thumbs),

      /// Endpoints
      reelWatchEndpoint: Map<String, dynamic>.from(
          json["reelWatchEndpoint"] ?? {}),

      inlineWatch:
          Map<String, dynamic>.from(json["inlineWatch"] ?? {}),

      /// Extras
      menu: (json["menu"] is Map)
          ? Map<String, dynamic>.from(json["menu"])
          : null,
      overlayMetadata: (json["overlayMetadata"] is Map)
          ? Map<String, dynamic>.from(json["overlayMetadata"])
          : null,
      loggingDirectives: (json["loggingDirectives"] is Map)
          ? Map<String, dynamic>.from(json["loggingDirectives"])
          : null,

      indexInCollection: json["indexInCollection"] is int
          ? json["indexInCollection"]
          : int.tryParse(json["indexInCollection"]?.toString() ?? ""), 

      extra: (json["extra"] is Map)
          ? Map<String, dynamic>.from(json["extra"])
          : null,
    );
  }

  /// -------- JSON EXPORT --------
  Map<String, dynamic> toJson() {
    return {
      "videoId": videoId,
      "shortUrl": shortUrl,
      "title": title,
      "views": views,
      "thumbnailUrl": thumbnailUrl,
      "thumbnailWidth": thumbnailWidth,
      "thumbnailHeight": thumbnailHeight,
      "thumbnails": thumbnails,
      "reelWatchEndpoint": reelWatchEndpoint,
      "inlineWatch": inlineWatch,
      "menu": menu,
      "overlayMetadata": overlayMetadata,
      "loggingDirectives": loggingDirectives,
      "indexInCollection": indexInCollection,
      "extra": extra,
    };
  }
}
