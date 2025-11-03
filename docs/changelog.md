# Improve Y-Axis Distance Labels to Show Variation as Offset

## Overview
Changed the distance graph's Y-axis labels from showing absolute distances (e.g., "148.36M km", "148.37M km") to showing relative offset from the baseline (e.g., "+5,000 km", "-3,000 km"), making the variation much clearer and easier to understand.

## Context
The previous Y-axis labels showed absolute distances with 2 decimal places in millions. Since daily distance variation is only ~12,000 km out of ~149 million km (about 0.008%), most labels looked nearly identical (e.g., "148.36M km" to "148.37M km"), making it difficult to see the actual variation in the graph.

## Implementation Complete ✅

All tasks completed successfully.

### Changes Made

**website/index.html**:

1. **Updated Y-Axis Label Calculation (lines 1100-1127)**:
   - Calculate average distance as baseline: `avgDistance = (minDistance + maxDistance) / 2`
   - Show offset from average instead of absolute values
   - Format with sign: "+5,000 km" or "-3,000 km" instead of "148.36M km"
   - Use `.toFixed(0)` for whole numbers (no decimals needed for offsets)
   - Changed unit suffix from "M km" / "M mi" to "km" / "mi"

2. **Added Baseline Indicator Label (lines 1120-1127)**:
   - Shows baseline distance above the graph (e.g., "Baseline: 148.36M km")
   - Centered, smaller font (10px)
   - Slightly transparent (0.6 opacity) to be non-intrusive
   - Provides context for what the offsets are relative to
   - Works with both km and miles units

### Features

- **Clear variation visibility**: Offset labels make the ~12,000 km daily variation obvious
- **Signed numbers**: "+" and "-" prefixes clearly show above/below baseline
- **Contextual baseline**: Small label shows the absolute baseline distance
- **Unit agnostic**: Works correctly with both kilometers and miles
- **View agnostic**: Works in both daily (24-hour) and yearly views
- **Simple formatting**: Whole numbers without unnecessary decimals

### Benefits

1. **Better data visualization**: The actual variation is now clearly visible in the labels
2. **Educational value**: Shows how much your distance changes relative to average
3. **Easier interpretation**: "±5,000 km" is more meaningful than "148.36M vs 148.37M"
4. **Maintains context**: Baseline label shows the absolute distance for reference

### Example Before and After

**Before:**
```
148.37M km  ← top
148.36M km
148.36M km
148.36M km  ← labels look very similar
148.36M km
148.36M km  ← bottom
```

**After:**
```
Baseline: 148.36M km
+6,000 km   ← top
+3,600 km
+1,200 km
-1,200 km   ← variation is clear
-3,600 km
-6,000 km   ← bottom
```

### Files Modified
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/website/index.html`
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/docs/changelog.md` (this file)
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/docs/todo.md`

---

# Change Color Scheme from Green to Blue

## Overview
Changed the entire color scheme from green shades to blue shades throughout the application for a fresh new look while maintaining all functionality.

## Context
The previous color scheme used green (#4ade80 / rgba(74, 222, 128, ...)) as the primary accent color. The new scheme uses blue (#60a5fa / rgba(96, 165, 250, ...)) which provides a different aesthetic while maintaining visual consistency.

## Implementation Complete ✅

### Changes Made

**website/index.html**:

1. **CSS Color Updates**:
   - Line 83-84: Toggle button active state - changed to blue background and border
   - Line 217: Update indicator dot - changed to blue
   - Line 312: Formula border-left - changed to blue
   - Line 316: Formula title color - changed to blue
   - Line 408-409: Add location button - changed to blue background and border
   - Line 419: Add location button hover - changed to blue background
   - Line 628: Link color in About modal - changed to blue

2. **JavaScript Color Updates**:
   - Line 765: Color palette array - changed first color from green (#4ade80) to blue (#60a5fa)

### Affected UI Elements

All of these now display in blue instead of green:
- Toggle buttons (active state) for graph views and units
- Blinking update indicator
- Formula blocks in About modal (border and title)
- Add Location button
- Link to developer's website
- Primary color in location comparison graphs

### Features

- **Consistent blue theme**: All accent colors updated uniformly
- **Maintained visual hierarchy**: Blue provides same level of contrast as green
- **Same functionality**: No behavioral changes, only visual
- **Professional appearance**: Blue is a common choice for data visualization

### Benefits

1. **Fresh look**: New color scheme gives the app a refreshed appearance
2. **No functional impact**: All features continue to work exactly as before
3. **Simple change**: Straightforward color replacement across the codebase
4. **Maintains accessibility**: Blue shades provide good contrast against dark background

### Files Modified
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/website/index.html`
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/docs/changelog.md` (this file)
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/docs/todo.md`

---

# Update About Pop-up Screen

## Overview
Updated the About modal to better organize content with website attribution at the top, followed by a clear "Formulas" section, and added the Solar Elevation Angle formula.

## Context
The About modal (previously "Distance Calculation Formulas") needed restructuring to:
1. Properly credit the website developer
2. Separate attribution from technical content
3. Include the Solar Elevation Angle formula that was missing

## Implementation Complete ✅

### Changes Made

**website/index.html**:

1. **Changed Modal Title (line 623)**:
   - Changed from "📐 Distance Calculation Formulas" to "About Al Sole"
   - Simpler, more appropriate title for an About section

2. **Added Website Attribution Section (lines 625-629)**:
   - New "Website" subsection at the top
   - Text: "Website by Chris Yunker"
   - Link to https://yunker.dev in green with no underline
   - Center-aligned for visual emphasis

3. **Added Formulas Section Header (line 631)**:
   - Large, centered heading "Formulas"
   - Separates attribution from technical content
   - 30px top margin for spacing

4. **Added Solar Elevation Angle Formula (lines 714-743)**:
   - New section "5. Solar Elevation Angle"
   - Includes Solar Declination formula with explanation
   - Includes Solar Elevation Angle formula with all variables defined
   - Explains positive values (daytime), negative values (nighttime), and 0° (sunrise/sunset)
   - Matches existing formula styling with color-coded variables

### Features

- **Clear attribution**: Developer credit prominently displayed at top
- **Better organization**: Two distinct sections (attribution and formulas)
- **Complete documentation**: All calculations now have formulas shown
- **Consistent styling**: New formula matches existing formula block design
- **Educational**: Helps users understand how elevation angle is calculated

### Benefits

1. **Professional**: Proper attribution for the website developer
2. **Educational**: Complete formula documentation helps users learn
3. **Organized**: Clear separation between who made it and how it works
4. **Complete**: All astronomical calculations now documented

### Files Modified
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/website/index.html`
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/docs/changelog.md` (this file)
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/docs/todo.md`

---

# Change 'View Formulas' Button to 'About'

## Overview
Changed the "View Formulas" button to "About" and made it smaller and left-aligned instead of spanning the full width of the section.

## Context
The previous button was labeled "📐 View Formulas" and spanned the full width of its container with `width: 100%` styling. The new design is more compact and left-aligned.

## Implementation Complete ✅

### Changes Made

**website/index.html**:

1. **Updated Button Text and Styling (line 615)**:
   - Changed text from "📐 View Formulas" to "About"
   - Removed `width: 100%` from inline styles
   - Button now sizes naturally to its content
   - Left-aligned by default (no center alignment on parent)

### Features

- **Compact design**: Button is now smaller and doesn't span full width
- **Left-aligned**: Button aligns to the left side of the container
- **Simpler text**: Changed from "📐 View Formulas" to just "About"
- **Same functionality**: Button still opens the modal when clicked

### Benefits

1. **Less visual weight**: Smaller button is less prominent but still accessible
2. **Better layout**: Left alignment groups it naturally with other content
3. **Clearer purpose**: "About" is more intuitive than "View Formulas"

### Files Modified
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/website/index.html`
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/docs/changelog.md` (this file)
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/docs/todo.md`

---

# Fix Kilometers/Miles Toggle Bug

## Overview
Fixed a critical bug where the kilometers/miles toggle buttons did not properly update the distance display after the first change.

## Context
The toggle buttons would update the first time, but subsequent toggles would fail silently. The issue was caused by the `distanceValue` element ID being dynamically recreated without the ID attribute, causing subsequent DOM lookups to fail.

## Implementation Complete ✅

### Problem Identified

**Root Cause**: In the `updateDistance()` function (line 1435-1437):
1. Line 1435 updates element with id="distanceValue"
2. Lines 1436-1437 replace innerHTML with a new span
3. The new span was missing the id="distanceValue" attribute
4. Future updates fail because getElementById('distanceValue') returns null

### Changes Made

**website/index.html**:

1. **Fixed innerHTML Template (line 1437)**:
   - Added missing `id="distanceValue"` attribute to the dynamically generated span
   - Changed from: `<span class="distance-value" style="display: inline; font-size: 1em; margin: 0;">`
   - Changed to: `<span class="distance-value" id="distanceValue" style="display: inline; font-size: 1em; margin: 0;">`

### Features

- **Toggle now works consistently**: Can switch between km and miles unlimited times
- **Graph updates correctly**: Y-axis labels change between "M km" and "M mi"
- **Text updates correctly**: Main distance display updates between kilometers and miles
- **Preference persists**: localStorage still saves the selected unit across sessions

### Test Results

All tests passed successfully:
- ✓ Initial page load shows correct unit (km by default, or saved preference)
- ✓ Clicking "Miles" converts distance correctly (148M km → 92M mi)
- ✓ Graph Y-axis updates correctly (M km → M mi)
- ✓ Clicking "Kilometers" converts back correctly (92M mi → 148M km)
- ✓ Multiple toggles work without errors
- ✓ No JavaScript errors in console

### Benefits

1. **Restored functionality**: Users can now freely switch between units as intended
2. **Simple fix**: One-line change resolved the issue
3. **No side effects**: All other functionality remains unchanged
4. **Prevention**: Ensures DOM elements maintain their IDs after updates

### Files Modified
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/website/index.html`
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/docs/changelog.md` (this file)

---

# Add Favicon to Title Heading

## Overview
Added the favicon image to the left of the "Al Sole" title heading, making the header more visually appealing and reinforcing the sun theme.

## Implementation Complete ✅

### Changes Made

**website/index.html**:

1. **Updated h1 CSS Styling (lines 37-50)**:
   - Changed from `text-align: center` to flexbox layout
   - Added `display: flex`, `align-items: center`, `justify-content: center`
   - Created new `h1 img` CSS rule for favicon styling
   - Favicon height set to `1em` (matches text size)
   - Added `0.3em` right margin for spacing between image and text

2. **Added Favicon Image to h1 Tag (line 543)**:
   - Inserted `<img src="favicon.png" alt="Sun icon">` before "Al Sole" text
   - Image scales proportionally with heading size
   - Includes descriptive alt text for accessibility

### Features

- **Consistent branding**: Favicon appears in both browser tab and page heading
- **Responsive sizing**: Image scales with text using `1em` height
- **Proper spacing**: Clean gap between icon and text
- **Accessible**: Includes alt text for screen readers
- **Centered layout**: Flexbox ensures proper alignment

### Benefits

1. **Visual appeal**: Icon adds visual interest to the header
2. **Theme reinforcement**: Sun icon reinforces the solar theme of the app
3. **Professional appearance**: Icon + text is a common and polished design pattern
4. **Simple implementation**: Minimal CSS changes, no complex positioning

### Files Modified
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/website/index.html`
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/docs/changelog.md` (this file)
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/docs/todo.md`

---

# Reorganize Layout: Move Distance Display and Unit Buttons

## Overview
Reorganized the page layout to improve information hierarchy by moving the distance display to the top and relocating the unit toggle buttons below the graph.

## Context
The previous layout had the unit buttons (Kilometers/Miles) at the top of the distance display, which was visually cluttered. Moving the distance text to the top emphasizes the primary information, and placing the unit buttons below the graph groups them with the visualization controls.

## Implementation Complete ✅

### Changes Made

**website/index.html**:

1. **Moved Distance Display to Top (lines 559-566)**:
   - Removed unit buttons from distance-display div
   - Distance text "You are X from the Sun" now appears immediately after location table
   - Keeps the update indicator (green blinking dot)
   - More prominent placement for primary information

2. **Moved Unit Buttons Below Graph (lines 576-579)**:
   - Added unit toggle buttons after the canvas element
   - Buttons now appear below the graph visualization
   - Same styling maintained (flexbox, centered, 10px gap)
   - Changed margin from `margin-bottom: 15px` to `margin-top: 15px`

### New Layout Order

1. Location table (Local Time, Solar Noon Offset, Location)
2. **Distance from Sun** (large text with update indicator)
3. Graph title and view toggles (24 Hours / 1 Year)
4. Graph legend and canvas
5. **Unit buttons** (Kilometers / Miles)
6. Compare Locations section

### Benefits

1. **Better information hierarchy**: Most important info (your distance) appears first
2. **Cleaner top section**: Distance display is uncluttered without buttons
3. **Grouped controls**: Unit buttons are now near the graph, which they affect
4. **Logical flow**: Info flows from general (where you are) to specific (exact distance) to visual (graph)

### Files Modified
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/website/index.html`
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/docs/changelog.md` (this file)
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/docs/todo.md`

---

# Move Location Information to Top in Table Format

## Overview
Reorganized the user interface to display Local Time, Solar Noon Offset, and Location coordinates at the top of the page in a clean table format with labels on the left and values on the right.

## Context
Previously, this information was displayed at the bottom of the page using separate UI components (info-grid cards for time/solar noon, and a separate div for coordinates). Moving it to the top makes the location information immediately visible and more prominent.

## Implementation Complete ✅

### Changes Made

**website/index.html**:

1. **Added Table CSS Styles (lines 135-168)**:
   - Created `.info-table-container` - container with background and rounded corners
   - Created `.info-table` - full-width table with collapsed borders
   - Created `.info-table-label` - left-aligned labels (50% width, 0.8 opacity)
   - Created `.info-table-value` - right-aligned values (bold, larger font)
   - Added row separators with subtle border-bottom styling

2. **Added Table HTML Structure (lines 542-557)**:
   - Moved location info to top of `mainContent` section (before distance display)
   - Created 3-row table:
     - Row 1: Local Time | [value]
     - Row 2: Solar Noon Offset | [value]
     - Row 3: Location | [coordinates]
   - All using existing element IDs (localTime, solarNoon, coordinates)

3. **Removed Old UI Components (lines ~555-568, removed)**:
   - Removed `.info-grid` div with two `.info-card` components
   - Removed `.location-info` div
   - Reduced UI redundancy

4. **Updated JavaScript (line 1410)**:
   - Removed emoji (📍) from coordinates display
   - Now shows just "40.7128°, -74.0060°" format

### Features

- **Top placement**: Information is immediately visible when page loads
- **Clean table layout**: Professional appearance with consistent spacing
- **Left/right alignment**: Labels on left, values on right for easy scanning
- **Consistent styling**: Matches overall glassmorphism theme
- **Responsive**: Table adapts to container width
- **Simplified**: Removed redundant location emoji

### Benefits

1. **Better UX**: Most important info (where you are, what time it is) shown first
2. **Cleaner design**: Table format is more organized than scattered cards
3. **Less scrolling**: Users don't need to scroll to bottom to find their location
4. **Professional look**: Table format is conventional and familiar

### Files Modified
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/website/index.html`
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/docs/changelog.md` (this file)
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/docs/todo.md`

---

# Updated Specification to Reflect Current State

## Overview
Comprehensively updated the specification.md to document all features that have been implemented since the initial version.

## Context
The specification was significantly outdated and didn't reflect major features like multi-location comparison, solar elevation angle visualization, dual-axis graphs, and various UI improvements.

## Implementation Complete ✅

### Changes Made to docs/specification.md

**1. Features Section**:
- Added "Multi-Location Comparison" feature (worldwide city dropdown, color-coded graphs)
- Added "Solar Elevation Angle Visualization" feature (dual-axis graphs, horizon reference)
- Updated Display Elements to reflect unit toggle and dual-axis graph design
- Updated User Controls to include km/miles toggle, graph view toggle, and location comparison controls
- Updated Formula Modal numbering

**2. Technical Approach Section**:
- Added Solar Declination calculation formulas (section 4)
- Added Solar Elevation Angle calculation formulas (section 5)
- Updated Update Strategy to include graph redraws
- Added new "Graph Rendering Strategy" section documenting canvas-based dual-axis rendering
- Added new "Data Persistence" section documenting localStorage usage

**3. User Interface Design Section**:
- Completely updated Layout Structure diagram to show:
  - Unit toggle buttons
  - Dual-axis graph with legend
  - Location comparison interface
  - Current time markers
- Updated Visual Design section to document:
  - Color coding system for locations
  - Graph styling details (vertical line, position markers, dual axes)
  - Real-time graph animations

**4. File Structure Section**:
- Updated to reflect current organization (docs/ folder structure)
- Added al-sole.code-workspace
- Added scripts/ directory
- Moved specification.md path to docs/
- Added changelog.md and updated file paths

**5. Future Enhancements Section**:
- Removed implemented features (graphs, unit options were partially done)
- Added new ideas (3D visualization, CSV export, azimuth angle, dark mode, i18n)
- Kept relevant ideas from original list

**6. Validation Criteria Section**:
- Added criteria for new features:
  - User-selected unit display
  - Solar elevation angle calculations
  - Dual-axis graphs
  - Multi-location comparison
  - View toggles
  - Current time indicators
  - localStorage persistence

### Summary of Documentation Updates

The specification now accurately reflects:
- **7 major features** documented (up from 4)
- **5 calculation types** documented (added 2 new astronomical calculations)
- **Complete graph system** documentation (rendering, dual axes, real-time updates)
- **Updated UI layout** showing all current controls and displays
- **Current file structure** with docs/ organization
- **14 validation criteria** (up from 8)

### Files Modified
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/docs/specification.md`
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/docs/changelog.md` (this file)
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/docs/todo.md`

---

### Changes Made

**website/index.html**:

1. **Solar Calculation Functions (lines 1273-1309)**:
   - Added `calculateSolarDeclination(date)` - calculates sun's declination angle (-23.45° to +23.45°)
   - Added `calculateSolarElevation(lat, lon, date)` - calculates sun's elevation above horizon
   - Uses proper astronomical formulas accounting for latitude, declination, and solar hour angle

2. **Elevation Data Generator (lines 885-913)**:
   - Added `generateElevationData()` function to create 24-hour elevation angle data
   - Supports multi-location comparison like the distance graphs
   - Generates hourly data points showing sun angle throughout the day

3. **Graph Toggle UI (line 526)**:
   - Added third button: "Elevation" alongside existing "24 Hours" and "1 Year"
   - Maintains consistent styling with existing toggle buttons

4. **Graph Rendering Updates (lines 916-1044)**:
   - Modified `drawGraph()` to detect elevation view mode
   - Y-axis labels show degrees (°) instead of km/miles for elevation view
   - Added horizontal dashed line at 0° labeled "Horizon (0°)"
   - Properly handles negative values (sun below horizon at night)
   - Automatic scaling based on min/max elevation values

5. **Toggle Logic (lines 1094-1115, 1493-1503)**:
   - Updated `setGraphView()` to handle 'elevation' mode
   - Updated `updateGraphData()` to regenerate elevation data when locations change
   - Button states update correctly when switching views

6. **Current Position Marker (lines 1046-1092)**:
   - Updated to work with elevation view
   - Shows real-time sun angle as yellow dot on graph

### Features

- **Accurate solar calculations**: Uses standard astronomical formulas for declination and elevation
- **Multi-location comparison**: Shows how sun angle differs at various latitudes
- **Horizon visualization**: Clear 0° line shows sunrise/sunset threshold
- **Negative angles**: Properly displays sun below horizon during nighttime
- **Real-time updates**: Current position marker moves as time progresses
- **Seamless integration**: Works with existing unit toggle and location comparison features
- **Consistent design**: Matches existing graph styling and behavior

### Test Results

All tests passed successfully:
- ✓ Elevation graph displays with degree labels
- ✓ Horizon line appears at 0°
- ✓ Negative values render correctly (nighttime)
- ✓ Multi-location comparison works (tested with San Francisco, Addis Ababa, Quito)
- ✓ Graph switching between all three views works smoothly
- ✓ Current position marker displays correctly
- ✓ Real-time updates continue to work
- ✓ No JavaScript errors in console

### Educational Value

The elevation graph helps users understand:
- When the sun rises and sets (angle crosses 0°)
- Maximum sun height at solar noon
- How latitude affects sun angle (comparison locations)
- Why different locations have different daylight patterns

### Files Modified
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/website/index.html`
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/tasks/todo.md` (this file)

---

# Separate Elevation Graph Below Distance Graph

## Overview
Changed the elevation graph from a toggle option to a separate, always-visible graph displayed below the distance graph.

## Context
- Originally, elevation was a third toggle option alongside "24 Hours" and "1 Year"
- Better UX to show both graphs simultaneously so users can compare distance and elevation at the same time
- Each graph now operates independently with its own canvas

## Implementation Complete ✅

All tasks completed successfully.

### Changes Made

**website/index.html**:

1. **HTML Structure (lines 522-536)**:
   - Added title "Distance from Sun" above first graph
   - Removed "Elevation" toggle button (back to just "24 Hours" / "1 Year")
   - Added second graph container below the first
   - Added title "Solar Elevation Angle" above second graph
   - Created separate canvas element `elevationGraph` with its own legend `elevationLegend`

2. **JavaScript Variables (lines 669-680)**:
   - Added `elevationData` array for elevation graph data
   - Added `elevationCanvas` and `elevationCtx` for second canvas context

3. **Canvas Initialization (lines 824-839)**:
   - Updated `initGraph()` to initialize both canvases
   - Both canvases set to 600x340 dimensions

4. **Separate Elevation Graph Function (lines 1108-1272)**:
   - Created `drawElevationGraph()` - complete standalone function for elevation rendering
   - Created `drawElevationCurrentMarker()` - current position marker for elevation
   - Created `updateElevationLegend()` - separate legend management for elevation graph
   - All use elevation-specific canvas/context and data

5. **Simplified Distance Graph (lines 929-1106)**:
   - Removed all elevation-specific logic from `drawGraph()`
   - No more `isElevationView` checks
   - Clean separation of concerns

6. **Updated Toggle Logic (lines 1274-1293)**:
   - Removed elevation from `setGraphView()` function
   - Only handles 'daily' and 'yearly' views now
   - Button management simplified

7. **Initialization Updates (lines 1303-1322)**:
   - `onLocationSuccess()` now generates both `graphData` and `elevationData`
   - Calls both `drawGraph()` and `drawElevationGraph()`

8. **Real-time Updates (lines 1381-1388)**:
   - `updateDistance()` redraws both graphs on each update cycle
   - Both graphs update their current position markers every 100ms

9. **Location Comparison (lines 1641-1651)**:
   - `updateGraphData()` regenerates elevation data when locations change
   - Both graphs update when comparison locations are added/removed

### Features

- **Always visible**: Both graphs display at all times
- **Independent operation**: Distance graph can toggle between 24hr/yearly while elevation always shows 24hr
- **Synchronized legends**: Each graph has its own legend showing the same color-coded locations
- **Synchronized updates**: Both graphs update together with real-time current position markers
- **Consistent design**: Second graph matches styling and behavior of first graph
- **Better UX**: Users can see relationship between distance and sun angle simultaneously

### Benefits

1. **Educational**: Easier to understand how distance and elevation relate
2. **Comparison**: Can see both metrics across multiple locations at once
3. **Simpler UI**: No need to toggle back and forth to see different data
4. **Cleaner code**: Separation of concerns with dedicated functions for each graph

### Files Modified
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/website/index.html`
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/tasks/todo.md` (this file)

---

# Add Elevation to Yearly Graph

## Overview
Extended the dual-axis graph to show solar elevation angle in the yearly view as well, showing how the maximum sun angle varies throughout the year.

## Context
- Initially, elevation was only shown in the 24-hour (daily) view
- The yearly view should also show elevation to demonstrate seasonal variation
- Yearly elevation shows the sun's angle at solar noon for each month

## Implementation Complete ✅

All tasks completed successfully.

### Changes Made

**website/index.html**:

1. **Yearly Elevation Data Generator (lines 914-944)**:
   - Created `generateYearlyElevationData()` function
   - Calculates solar elevation at solar noon (12:00) for mid-month of each month
   - Shows seasonal variation in maximum sun angle throughout the year
   - Supports multi-location comparison

2. **Updated Graph Rendering (lines 978-1111)**:
   - Removed `currentGraphView === 'daily'` condition from elevation drawing
   - Right Y-axis now appears in both daily and yearly views
   - Elevation curves (dashed lines) render in both views
   - Horizon line only shows in daily view (where it's relevant)

3. **Updated View Switching (lines 1196-1215)**:
   - `setGraphView()` generates yearly elevation data when switching to yearly view
   - Both `elevationData` types regenerated on view change

4. **Updated Data Refresh (lines 1602-1612)**:
   - `updateGraphData()` generates appropriate elevation data for each view
   - Yearly elevation regenerates when comparison locations change

5. **Updated Legend (lines 1503-1528)**:
   - Shows "Solid = Distance | Dashed = Elevation" note in both views
   - Condition changed from `currentGraphView === 'daily'` to `elevationData.length > 0`

6. **Updated Current Position Markers (lines 1169-1194)**:
   - Elevation markers now work in both views
   - Shows current position on both distance and elevation curves

### Features

**Yearly View Now Shows:**
- **Distance curve** (solid): Earth's orbital distance variation (perihelion to aphelion)
- **Elevation curve** (dashed): Maximum sun angle at solar noon for each month
- **Dual Y-axes**: Left = distance (km/mi), Right = elevation (degrees)
- **Seasonal patterns**: How sun angle changes with Earth's axial tilt throughout the year

**Educational Value:**
- Shows relationship between Earth's orbit and seasonal sun angles
- Demonstrates that seasons are caused by axial tilt (elevation changes), not distance
- At equator: sun reaches 90° twice per year (equinoxes)
- At higher latitudes: clear seasonal variation in maximum sun angle

### Files Modified
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/website/index.html`
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/tasks/todo.md` (this file)

---

# Remove "Update Location" Button

## Overview
Remove the "Update Location" button from the application. The location is already requested automatically on page load, so a manual update button is not necessary.

## Context
- The button is located at line 561 in website/index.html
- Button code: `<button class="button" onclick="requestLocation()">🔄 Update Location</button>`
- The `requestLocation()` function is called automatically on page load (line 802)
- Removing this button simplifies the UI without affecting functionality

## Todo Items

### 1. Remove the Button HTML
- [x] Remove line 561: `<button class="button" onclick="requestLocation()">🔄 Update Location</button>`

## Technical Notes

**Simple Change:**
- Single line deletion
- No JavaScript logic changes needed
- `requestLocation()` function can remain as it's still called on page load
- No impact on other functionality

## Review

### Implementation Complete ✅

The "Update Location" button has been successfully removed from the application.

### Changes Made

**website/index.html**:

1. **Removed Button (line 561)**:
   - Deleted: `<button class="button" onclick="requestLocation()">🔄 Update Location</button>`
   - The "View Formulas" button remains and is now the only button in that section

### Impact

- **Cleaner UI**: One less button simplifies the interface
- **No functionality lost**: Location is still automatically requested on page load
- **requestLocation() function preserved**: Still available for automatic initialization
- **Minimal change**: Single line deletion with no side effects

### Files Modified
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/website/index.html`
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/tasks/todo.md` (this file)

---

# Add Current Time Vertical Line to Graphs

## Overview
Add a vertical line that represents the current time and intersects both the distance and elevation graphs, making it easier to see the current moment across both visualizations.

## Context
- Currently, both graphs show current position markers as yellow dots on each data curve
- A vertical line spanning the full height of the graph would make the current time more visually obvious
- The line should appear on both graphs and update in real-time
- Should work in both daily (24 hours) and yearly (1 year) views

## Todo Items

### 1. Add Vertical Line Drawing to Distance Graph
- [x] In `drawGraph()` function, add code to draw a vertical line at current time position
- [x] Calculate the x-coordinate based on current time (same logic as current position markers)
- [x] Draw line from top to bottom of graph area (paddingTop to canvas.height - paddingBottom)
- [x] Use semi-transparent styling to avoid obscuring data

### 2. Style the Vertical Line
- [x] Choose appropriate color (e.g., semi-transparent yellow/orange to match current position markers)
- [x] Set appropriate line width (thin but visible)
- [x] Use solid line with transparency

### 3. Test the Implementation
- [x] Verify line appears at correct position in daily view
- [x] Verify line appears at correct position in yearly view
- [x] Check that line updates smoothly with real-time updates (every 100ms)
- [x] Ensure line doesn't obscure important data
- [x] Code review confirms correct implementation

## Technical Notes

**Implementation Details:**
- The current position calculation logic is already in `drawCurrentPositionMarker()` function
- Same x-coordinate calculation can be reused for the vertical line
- Line should be drawn after grid lines but before or after data curves (experiment with layering)
- For daily view: x position based on current hour
- For yearly view: x position based on current month/day

**Visual Design:**
- Suggested styling: semi-transparent orange/yellow vertical line
- Line width: 2-3 pixels
- Consider adding slight glow effect or making it dashed for better visibility
- Should be visually distinct but not overwhelming

**Code Location:**
- Distance graph: `drawGraph()` function (around line 945-1120)
- Elevation graph: Similar location in elevation drawing code
- Can create a helper function `drawCurrentTimeLine()` to avoid code duplication

## Files to Update
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/website/index.html`

## Review

### Implementation Complete ✅

All tasks for adding the current time vertical line to the graphs have been successfully completed.

### Changes Made

**website/index.html**:

1. **Added Vertical Line Drawing (lines 1070-1097)**:
   - Added code in `drawGraph()` function to draw a vertical line at current time position
   - Line spans from `paddingTop` to `canvas.height - paddingBottom` (full height of graph)
   - Uses same time calculation logic as current position markers
   - Works correctly in both daily (24-hour) and yearly (12-month) views

2. **Visual Styling**:
   - Color: `rgba(251, 191, 36, 0.4)` - semi-transparent orange/yellow to match current position markers
   - Line width: 2 pixels - thin but clearly visible
   - Solid line (no dashing) for clean appearance
   - Semi-transparency ensures data curves remain visible

3. **Time Position Calculation**:
   - Daily view: Based on current hour + minutes (e.g., 14:30 = 14.5 hours)
   - Yearly view: Based on current month + day (e.g., March 15 ≈ 2.5 months)
   - Uses same calculation as existing current position markers for consistency

### Features

- **Real-time updates**: Line moves smoothly as time progresses (updates every 100ms with graph)
- **Dual view support**: Works in both 24-hour and 1-year graph views
- **Visual clarity**: Semi-transparent styling doesn't obscure data curves
- **Consistent design**: Matches the yellow/orange color of current position markers
- **Synchronized**: Uses identical time calculation as the position markers

### Benefits

1. **Improved visibility**: The vertical line makes the current time much more obvious than just the dots
2. **Cross-graph alignment**: Shows exact current time position spanning both distance and elevation data
3. **Educational**: Helps users understand exactly where "now" is on the timeline
4. **Non-intrusive**: Semi-transparency ensures existing data remains clearly visible

### Files Modified
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/website/index.html`
- `/Users/cyunker/git/github.com/chrisyunker/al-sole/tasks/todo.md` (this file)

---
