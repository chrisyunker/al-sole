# Update Documentation for index.html.tpl Removal

## Context
The project previously used `website/index.html.tpl` as a template file that was processed to generate `index.html`. This has been simplified - the template has been removed and now we just use `index.html` directly.

## Plan

### Tasks
- [x] Update README.md file structure section (line 122)
- [x] Update DEPLOYMENT.md manual S3 upload command (line 132)
- [x] Update SPECIFICATION.md file structure section (line 214)
- [x] Remove scripts/build-local.sh (no longer needed)
- [x] Verify terraform configuration is already correct (confirmed)

---

## Implementation Details

### Files to Update
1. **README.md** - File structure diagram
   - Change: `index.html.tpl` → `index.html`
   - Remove template description

2. **DEPLOYMENT.md** - Manual S3 upload example
   - Change: `../website/index.html.tpl` → `../website/index.html`
   - Update description text

3. **SPECIFICATION.md** - File structure and description
   - Change: `index.html.tpl` → `index.html`
   - Update description text

4. **scripts/build-local.sh** - Build script
   - This script processes the .tpl file which no longer exists
   - Options: Remove entirely or update to just copy index.html
   - Need user decision on this

### Keeping It Simple
- Simple find-and-replace operations
- Update descriptions to reflect direct HTML usage
- No complex restructuring needed
- Verify terraform already uses correct paths

---

## Review

### Implementation Complete ✅

All documentation has been successfully updated to reflect the removal of `index.html.tpl` in favor of using `index.html` directly.

### Changes Made

**File Removed**: `scripts/build-local.sh`
- This script was used to process the `.tpl` template file
- No longer needed since we now use `index.html` directly
- Simplifies the project structure

**Documentation Updates**:

1. **README.md** (line 122):
   - Changed: `index.html.tpl   # Website template with Google Analytics`
   - To: `index.html       # Main website file`

2. **DEPLOYMENT.md** (line 132):
   - Changed: `aws s3 cp ../website/index.html.tpl`
   - To: `aws s3 cp ../website/index.html`
   - Manual S3 upload command now references correct file

3. **SPECIFICATION.md** (line 214):
   - Changed: `index.html.tpl   # Website template with Google Analytics`
   - To: `index.html       # Main website file`
   - Removed reference to `scripts/deploy.sh` from file structure (doesn't exist)

### Impact

- All documentation now accurately reflects the current project structure
- Removed outdated build script that would have failed since `.tpl` file no longer exists
- Simplified deployment process - no template processing needed
- Terraform configuration already uses `index.html` directly (no changes needed)

### Files Modified
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/README.md`
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/DEPLOYMENT.md`
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/SPECIFICATION.md`
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/tasks/todo.md` (this file)

### Files Deleted
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/scripts/build-local.sh`
