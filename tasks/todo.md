# Add km/miles Toggle Switch

## Context
Add a toggle switch to allow users to switch between kilometers and miles for distance display. Currently, both units are always shown (kilometers as main, miles as secondary). The toggle will let users choose their preferred unit.

## Plan

### Tasks
- [x] Add toggle button UI (similar to graph view toggle)
- [x] Add JavaScript state to track selected unit (default: km)
- [x] Update distance display logic to show only selected unit
- [x] Add toggle button click handler to switch units
- [x] Save preference to localStorage

---

## Implementation Details

### Files to Update
1. **website/index.html** - Add CSS for unit toggle buttons
2. **website/index.html** - Add HTML for toggle UI
3. **website/index.html** - Add JavaScript to handle unit switching

### Design Approach
- Follow the existing toggle button pattern used for graph view (24 Hours/1 Year)
- Place toggle near the distance display
- Simple and clean design matching current UI
- No changes to calculation logic, only display

### Keeping It Simple
- Use existing CSS classes (toggle-btn, active) for consistency
- Minimal JavaScript changes
- No backend or API changes needed
- Store preference in localStorage for persistence

---

## Review

### Implementation Complete ✅

All tasks for the km/miles toggle switch have been successfully completed.

### Changes Made

**website/index.html**:

1. **HTML Structure (lines 531-540)**:
   - Added toggle buttons for Kilometers/Miles using existing toggle-btn CSS class
   - Changed distance display to use single `distanceValue` element instead of separate km/miles
   - Made unit label dynamic with `distanceUnitLabel` element
   - Placed toggle buttons at the top of the distance display section

2. **JavaScript State (line 664)**:
   - Added `currentUnit` variable to track selected unit (defaults to 'km')

3. **Display Logic (lines 1098-1110)**:
   - Updated `updateDistance()` function to display only the selected unit
   - Conditionally formats display value and unit label based on `currentUnit`

4. **Toggle Function (lines 1034-1053)**:
   - Added `setUnit(unit)` function to handle unit switching
   - Updates button active states
   - Saves preference to localStorage
   - Immediately updates display when unit changes

5. **localStorage Persistence (lines 792-796 & line 1059)**:
   - Loads saved unit preference on page load
   - Saves preference when user changes unit
   - Preference persists across browser sessions

6. **Graph Unit Conversion (lines 900-901, 931-936, 956-957, 978, 1006, 1065-1067)**:
   - Updated `drawGraph()` to convert all distances to miles when needed
   - Updated Y-axis labels to show "M mi" or "M km" based on selected unit
   - Updated curve plotting to use converted values
   - Updated current position marker to use converted values
   - Graph redraws automatically when unit changes

### Features

- Clean toggle UI matching existing design patterns
- Instant switching between kilometers and miles
- Remembers user preference using localStorage
- No impact on calculation accuracy - only display formatting changes
- Fully integrated with existing real-time updates
- **Graph displays in selected unit** - both Y-axis labels and plotted data update to show km or miles

### Impact

- Users can now choose their preferred distance unit
- Cleaner display showing only one unit at a time
- Preference is remembered for future visits
- Zero changes to calculation logic or data accuracy
- Maintains consistency with existing UI patterns
- **Graph now fully respects unit selection** - all distance visualizations use the selected unit

### Files Modified
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/website/index.html`
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/tasks/todo.md` (this file)

---
