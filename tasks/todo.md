# Change Website Name to "Al Sole"

## Context
Update the website branding to use "Al Sole" as the primary name. Currently the title includes "Distance to the Sun" prefix.

## Plan

### Tasks
- [x] Update the HTML `<title>` tag from "Distance to the Sun - Al Sole" to "Al Sole"
- [x] Update the main H1 heading (currently "🌍 Distance to the Sun ☀️") to "Al Sole"

---

## Implementation Details

### Files to Update
1. **website/index.html** - Line 6: Update title tag
2. **website/index.html** - Line 500: Update H1 heading

### User Decision
- H1 heading changed to "Al Sole" (simple text, no emojis)

### Keeping It Simple
- Simple text replacements in the HTML file
- Minimal changes to maintain functionality
- Clean branding update

---

## Review

### Implementation Complete ✅

All website name changes have been successfully applied.

### Changes Made

**website/index.html** (line 6):
- Changed: `<title>Distance to the Sun - Al Sole</title>`
- To: `<title>Al Sole</title>`

**website/index.html** (line 500):
- Changed: `<h1>🌍 Distance to the Sun ☀️</h1>`
- To: `<h1>Al Sole</h1>`

### Impact

- Website now displays "Al Sole" as the primary branding
- Browser tab title shows "Al Sole"
- Main heading simplified to clean text without emojis
- No functional changes, only branding/naming updates

### Files Modified
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/website/index.html`
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/tasks/todo.md` (this file)

---

# Fix Terraform aws_s3_object.index_html Bug

## Context
The aws_s3_object.index_html resource in terraform/main.tf was not properly uploading the index.html file to S3. It was using `content` attribute with a file path string instead of file contents, and using `md5()` instead of `filemd5()`.

## Plan

### Tasks
- [x] Fix aws_s3_object.index_html to use `source` instead of `content`
- [x] Fix etag to use `filemd5()` instead of `md5()`

---

## Review

### Implementation Complete ✅

The terraform configuration has been fixed to properly upload index.html to S3.

### Changes Made

**terraform/main.tf** (lines 165-174):
- Changed: `content = "${path.root}/../website/index.html"` (was setting content to path string)
- To: `source = "${path.root}/../website/index.html"` (now properly reads file)

- Changed: `etag = md5("${path.root}/../website/index.html")` (was hashing path string)
- To: `etag = filemd5("${path.root}/../website/index.html")` (now properly hashes file contents)

### Impact

- The index.html file will now be properly uploaded to S3 with correct content
- The etag will correctly track file changes for cache invalidation
- Terraform will properly detect when the file has changed and needs re-uploading

### Files Modified
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/terraform/main.tf`
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/tasks/todo.md` (this file)

---
