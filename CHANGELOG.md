## 1.0.3 — YouTube Search Query Support 🔍

- Added `fetchSearch(String query)` method in `YouTubeDetails`
  - Fetch videos and shorts using any YouTube search query
  - Returns a `SearchResponse` object containing:
    - `videos` → List of `SearchVideoModel`
    - `shorts` → List of `SearchShortModel`
- Introduced `SearchResponse`, `SearchVideoModel`, and `SearchShortModel` classes
- Integrated `YouTubeScraper` for parsing `ytInitialData` from search results
- Updated example project to demonstrate fetching videos & shorts by search query
- Fixed undefined method issue for search functionality

## 1.0.2 — Code Formatting Improvements 🧹

- Applied `dart format` across the entire project
- Cleaned up unused imports and improved code style
- Removed redundant exports and optimized library structure
- Improved consistency in indentation and spacing

## 1.0.1 — Minor Fixes & Updates 🔧

- Fixed string quote consistency in model classes and `YouTubeDetails`
- Improved error handling in fetch methods
- Minor performance improvements

## 1.0.0 — Initial Release 🚀

- Introduced `youtube_details` package
- Fetch YouTube Channel Details
- Fetch All Videos
- Fetch Shorts
- Fetch Posts / Community Tab
- Fetch Single Video Details using oEmbed
- Works without YouTube API Key (no quota limit / no authentication)
- Supports Dart & Flutter

### What's Next?
- Pagination for videos & shorts
- Fetch comments
- Download thumbnails in HD & 4K
