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
      thumbWidth: int.tryParse(json['thumb_width']?.toString() ?? '0') ?? 0,
      thumbHeight: int.tryParse(json['thumb_height']?.toString() ?? '0') ?? 0,
      views: json['views'] ?? '',
      published: json['published'] ?? '',
      channel: json['channel'] ?? '',
      channelThumb: json['channel_thumb'] ?? '',
      duration: json['duration'] ?? '',
    );
  }
}

/// Represents a single YouTube Short in a search result.
class SearchShortModel {
  /// Unique YouTube video ID.
  final String videoId;

  /// Relative URL for the short (e.g., `/shorts/VIDEO_ID`).
  final String shortUrl;

  /// Title of the Short.
  final String title;

  /// View count of the Short as a formatted string (e.g., "500K views").
  final String views;

  /// URL of the Short's thumbnail.
  final String thumbnailUrl;

  /// Width of the thumbnail in pixels.
  final int thumbnailWidth;

  /// Height of the thumbnail in pixels.
  final int thumbnailHeight;

  /// Creates a new `SearchShortModel` instance.
  SearchShortModel({
    required this.videoId,
    required this.shortUrl,
    required this.title,
    required this.views,
    required this.thumbnailUrl,
    required this.thumbnailWidth,
    required this.thumbnailHeight,
  });

  /// Creates a `SearchShortModel` from JSON data.
  factory SearchShortModel.fromJson(Map<String, dynamic> json) {
    return SearchShortModel(
      videoId: json['videoId'] ?? '',
      shortUrl: json['shortUrl'] ?? '',
      title: json['title'] ?? '',
      views: json['views'] ?? '',
      thumbnailUrl: json['thumbnail_url'] ?? '',
      thumbnailWidth:
          int.tryParse(json['thumbnail_width']?.toString() ?? '0') ?? 0,
      thumbnailHeight:
          int.tryParse(json['thumbnail_height']?.toString() ?? '0') ?? 0,
    );
  }
}
