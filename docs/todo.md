# Update Specification to Reflect Current State

## Context
The specification.md file is outdated and doesn't reflect several major features that have been implemented. This task will update the specification to accurately document the current state of the application.

## Features to Add to Specification

### 1. Multi-Location Comparison
- **What**: Users can add multiple locations to compare distances and solar angles
- **Where in spec**: Add new section under "Features > Core Features"
- **Details to include**:
  - Pre-populated city dropdown with worldwide locations
  - Add/remove comparison locations
  - Color-coded legends on graphs
  - All graphs show data for all active locations

### 2. Solar Elevation Angle Calculations
- **What**: App calculates the sun's angle above/below the horizon
- **Where in spec**: Add new section under "Technical Approach > Astronomical Calculations"
- **Details to include**:
  - Solar declination calculation
  - Solar elevation angle formula
  - Day/night determination based on angle
  - Horizon reference (0°)

### 3. Dual-Axis Graph Display
- **What**: Single graph shows both distance (left Y-axis) and elevation angle (right Y-axis)
- **Where in spec**: Update "Display Elements" and "User Interface Design" sections
- **Details to include**:
  - Left Y-axis: Distance (km or miles)
  - Right Y-axis: Elevation angle (degrees)
  - Solid lines = distance, dashed lines = elevation
  - Color-coded for multiple locations
  - Current time vertical line marker

### 4. Unit Toggle (km/miles)
- **What**: Users can toggle between kilometers and miles
- **Where in spec**: Update "Display Elements > User Controls"
- **Details to include**:
  - Toggle buttons for km/miles
  - Affects main distance display and graph Y-axis
  - Saved to localStorage for persistence

### 5. Graph View Toggle (24 Hours / 1 Year)
- **What**: Users can switch between daily and yearly views
- **Where in spec**: Update "Display Elements" and add to "User Controls"
- **Details to include**:
  - 24 Hours view: Hourly data for current day
  - 1 Year view: Monthly data showing orbital variation
  - Both views show distance + elevation
  - Yearly elevation shows max sun angle at solar noon

### 6. Current Time Visualization
- **What**: Vertical line and markers show current moment on graphs
- **Where in spec**: Add to "Display Elements" and "Visual Design"
- **Details to include**:
  - Semi-transparent vertical line at current time
  - Yellow dots on each curve at current position
  - Updates every 100ms in real-time

### 7. UI Changes
- **What**: Various UI improvements
- **Where in spec**: Update "Display Elements" and "User Interface Design"
- **Details to include**:
  - Removed "Update Location" button (auto-loads on page load)
  - Cleaner distance display with unit toggle
  - Graph titles and legends

## Sections to Update

### 1. Features Section
- [x] Add "Multi-Location Comparison" subsection
- [x] Add "Solar Elevation Angle Visualization" subsection
- [x] Update "User Controls" to include unit toggle and graph view toggle
- [x] Update "Display Elements" for dual-axis graph

### 2. Technical Approach Section
- [x] Add solar declination calculation formulas
- [x] Add solar elevation angle calculation formulas
- [x] Update graph rendering approach for dual-axis display
- [x] Document localStorage usage for unit preference

### 3. User Interface Design Section
- [x] Update layout structure diagram
- [x] Add graph visual examples
- [x] Document color-coding for multi-location comparison
- [x] Update controls list

### 4. File Structure Section
- [x] Update to reflect current file organization (docs/ folder, etc.)

### 5. Future Enhancements Section
- [x] Remove items that have been implemented (comparison, graphs, etc.)
- [x] Keep relevant future ideas

## Plan

1. **Create detailed outline** of all changes needed
2. **Update Features section** with new subsections
3. **Update Technical Approach** with new calculations
4. **Update User Interface Design** with new layout and controls
5. **Update File Structure** to match current organization
6. **Review and refine** for clarity and completeness
7. **Add to changelog** when complete

## Simplicity Approach
- Make targeted updates to each section
- Add new subsections rather than rewriting entire sections
- Use clear headings for new features
- Keep existing good documentation intact
