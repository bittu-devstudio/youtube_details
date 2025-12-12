# Changelog
## 1.1.1 — Code Formatting Improvements 🧹
- Ran `dart format` across project.
- Cleaned up unused imports.

## 1.1.0
- Improved package structure.
- Added new models and updates to `youtube_scraper`.
- Updated example and documentation.
- Minor fixes and optimizations.

## 1.0.5 — Code Formatting & Stability Improvements 🧹⚙️
- Bug fixes.
- General formatting improvements.

## 1.0.4 — Crash Fix & Data Parsing Improvements 🧩
### 🐛 Fixed
- Resolved crash in **Fetch Search Video Shorts Details**  
  Error message: type 'String' is not a subtype of type 'int'
- Some API fields (like thumbnail width/height) returned `String` instead of `int`.  
Updated parsing using `int.tryParse()` to prevent type mismatches.

### 🔧 Improvements
- Updated JSON parsing for `SearchVideoModel` and `SearchShortModel`.
- Ensured compatibility for both numeric and string values returned by YouTube.
- Improved stability for fetching video and shorts details.

## 1.0.3 — YouTube Search Query Support 🔍
- Added `fetchSearch(String query)` in `YouTubeDetails`  
Fetch videos & shorts using any YouTube search query.
- Returns a `SearchResponse` containing:
- `videos` → List of `SearchVideoModel`
- `shorts` → List of `SearchShortModel`
- Introduced:
- `SearchResponse`
- `SearchVideoModel`
- `SearchShortModel`
- Implemented YouTube `ytInitialData` parsing via `YouTubeScraper`.
- Updated example project with search functionality.
- Fixed undefined method issues for search.

## 1.0.2 — Code Formatting Improvements 🧹
- Ran `dart format` across project.
- Cleaned up unused imports.
- Removed redundant exports.
- Improved overall code structure and formatting consistency.

## 1.0.1 — Minor Fixes & Updates 🔧
- Fixed string quote consistency.
- Improved error handling in fetch methods.
- Minor performance optimizations.

## 1.0.0 — Initial Release 🚀
- Introduced `youtube_details` package.
- Fetch YouTube Channel Details.
- Fetch All Videos.
- Fetch Shorts.
- Fetch Posts / Community Tab.
- Fetch Single Video Details (via oEmbed).
- Works **without YouTube API Key** (no quota, no auth required).
- Supports Dart & Flutter.

### What's Next?
- Pagination for videos & shorts.
- Fetch comments.
- Download thumbnails in HD & 4K.
