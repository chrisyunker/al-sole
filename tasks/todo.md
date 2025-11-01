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

# Add Solar Elevation Angle Graph

## Overview
Add a new graph that displays the angle of the sun with respect to the surface of the earth at the user's location (solar elevation/altitude angle).

## Context
- The app currently has two graphs: 24-hour distance graph and yearly distance graph
- Both use custom canvas-based rendering (no external libraries)
- The app already calculates solar hour angle and has user location data
- We need to add a third graph option for solar elevation angle

## Todo Items

### 1. Add Solar Declination Calculation Function
- [ ] Create `calculateSolarDeclination(date)` function
- [ ] Uses formula based on day of year
- [ ] Returns declination angle in degrees

### 2. Add Solar Elevation Angle Calculation Function
- [ ] Create `calculateSolarElevation(lat, lon, date)` function
- [ ] Uses formula: sin(α) = sin(φ) × sin(δ) + cos(φ) × cos(δ) × cos(H)
- [ ] Accounts for latitude, solar declination, and solar hour angle
- [ ] Returns elevation angle in degrees

### 3. Update Graph Toggle UI
- [ ] Modify the graph toggle buttons to include a third option: "Elevation"
- [ ] Keep existing "24 Hours" and "Yearly" buttons
- [ ] Add styling for three-button layout

### 4. Create Elevation Angle Data Generator
- [ ] Create function to generate 24-hour elevation angle data
- [ ] Similar to existing `generateDailyData()` but for angles
- [ ] Support multiple locations for comparison

### 5. Update Graph Rendering Function
- [ ] Modify `drawGraph()` to handle elevation angle data
- [ ] Add appropriate Y-axis labels (degrees, from -90° to +90°)
- [ ] Add horizontal line at 0° to show horizon
- [ ] Handle negative values (sun below horizon)

### 6. Wire Up Graph Toggle Logic
- [ ] Add state management for graph view type
- [ ] Update toggle button click handlers
- [ ] Trigger graph redraw when switching views

### 7. Test the Implementation
- [ ] Verify graph displays correctly at different times of day
- [ ] Check that negative angles (nighttime) render properly
- [ ] Test with comparison locations at different latitudes
- [ ] Verify smooth transitions between graph types

## Technical Notes

**Solar Declination Formula:**
```
δ = 23.45° × sin(360° × (284 + N) / 365)
```
Where N is the day of year.

**Solar Elevation Formula:**
```
sin(α) = sin(φ) × sin(δ) + cos(φ) × cos(δ) × cos(H)
```
Where:
- α = solar elevation angle
- φ = observer's latitude
- δ = solar declination
- H = solar hour angle

**Key Design Decisions:**
- Keep the implementation simple and consistent with existing code
- Use the same canvas-based rendering approach
- Support multi-location comparison like the 24-hour distance graph
- Display angles in degrees (easier to understand than radians)

## Review Section

### Implementation Complete ✅

All tasks for the solar elevation angle graph have been successfully completed.

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
