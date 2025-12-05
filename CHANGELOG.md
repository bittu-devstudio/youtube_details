1.0.4 — Code Formatting & Stability Improvements 🧹⚙️
✅ Fixed: Crash in “Fetch Search Video Shorts Details”

An issue was resolved where the app crashed with the error:

type 'String' is not a subtype of type 'int'

This occurred because some API fields (e.g., thumbnail width/height) were returned as String, while the model expected int.
The parsing logic has been updated to safely convert these values using int.tryParse() to prevent type mismatches.

🔧 Improvements

Updated JSON parsing for SearchVideoModel and SearchShortModel

Ensured compatibility with both numeric and string values from the API

Enhanced overall stability of video/shorts detail fetching

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
