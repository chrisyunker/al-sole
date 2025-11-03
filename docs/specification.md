# Al Sole - Distance to the Sun
## Project Specification

### Overview
A real-time web application that calculates and displays the user's distance from the Sun based on their geographic coordinates. The distance updates continuously as Earth rotates and orbits the Sun.

### Project Goals
- Display the user's current distance from the Sun in real-time
- Use geolocation to determine the user's position on Earth
- Account for Earth's rotation and orbital position
- Provide an intuitive, visually appealing interface
- Update calculations continuously (sub-second intervals)

---

## Features

### Core Features
1. **Geolocation Detection**
   - Request user's coordinates via browser Geolocation API
   - Handle permission denials gracefully
   - Allow manual location refresh

2. **Distance Calculation**
   - Calculate Earth-Sun distance based on current date (orbital position)
   - Calculate user's additional distance based on:
     - Latitude (distance from equator)
     - Longitude (rotation position)
     - Current time (Earth's rotation)
   - Account for Earth's elliptical orbit

3. **Real-Time Updates**
   - Update distance every 100ms
   - Show live clock
   - Indicate update status visually

4. **Multi-Location Comparison**
   - Compare distances and solar angles across multiple locations simultaneously
   - Pre-populated dropdown with cities worldwide
   - Add/remove comparison locations dynamically
   - Color-coded visualization in graphs
   - All locations update in real-time

5. **Solar Elevation Angle Visualization**
   - Calculate and display sun's angle above/below horizon
   - Dual-axis graphs showing both distance and elevation
   - Positive angles = sun above horizon (daytime)
   - Negative angles = sun below horizon (nighttime)
   - Horizon reference line at 0°

6. **Educational Formula Modal**
   - Interactive modal displaying all calculation formulas
   - Detailed explanations of astronomical concepts
   - Visual formula breakdowns with color-coded variables
   - Accessible via "View Formulas" button
   - Keyboard shortcut support (ESC to close)

### Display Elements
1. **Primary Display**
   - Distance in user-selected unit (kilometers or miles)
   - Unit toggle buttons for instant switching
   - Visual indicators (sun icon, Earth icon)
   - Unit preference saved to browser localStorage

2. **Interactive Dual-Axis Graphs**
   - Single graph displays both distance and elevation angle
   - Left Y-axis: Distance from Sun (km or miles)
   - Right Y-axis: Solar elevation angle (degrees)
   - Solid lines: Distance curves
   - Dashed lines: Elevation curves
   - Toggle between 24-hour view and 1-year view
   - Current time vertical line marker
   - Yellow position markers on each curve
   - Color-coded for multiple locations
   - Real-time updates every 100ms

3. **Supplementary Information**
   - Local time
   - Solar noon offset
   - Geographic coordinates

4. **User Controls**
   - Unit toggle: Switch between kilometers and miles
   - Graph view toggle: Switch between 24 Hours and 1 Year
   - Location comparison: Add/remove cities to compare
   - Button to view calculation formulas
   - Status messages for loading/errors

5. **Formula Modal**
   - Full-screen overlay with educational content
   - Sections for each calculation type:
     - Earth-Sun distance calculation
     - User distance offset calculation
     - Day/Night determination logic
     - Solar noon offset calculation
   - Color-coded variables and formulas
   - Close button and ESC key support

---

## Technical Approach

### Technologies
- **HTML5**: Structure and semantic markup
- **CSS3**: Styling with modern features (gradients, backdrop-filter, animations)
- **Vanilla JavaScript**: No dependencies, pure ES6+
- **Geolocation API**: Browser-based location detection

### Astronomical Calculations

#### 1. Earth-Sun Distance
```
- Average distance: 1 AU = 149,597,870.7 km
- Earth's orbital eccentricity: ~0.0167
- Perihelion: ~January 3 (closest)
- Aphelion: ~July 4 (farthest)

Formula:
distance = AU × (1 - e × cos(M))

Where:
- e = eccentricity (0.0167)
- M = mean anomaly (angle from perihelion)
```

#### 2. User's Distance Offset
```
The user's distance from Sun varies based on:

a) Latitude component:
   - Affects distance from Earth's axis
   - radius_at_latitude = Earth_radius × cos(latitude)

b) Longitude + Time component:
   - Earth rotates 15° per hour
   - Solar hour angle = (UTC_hours - 12) × 15 + longitude
   - At solar noon: closest to Sun (sunward side)
   - At midnight: farthest from Sun (away side)

c) Distance offset:
   - offset = Earth_radius × cos(latitude) × cos(solar_hour_angle)
   - User distance = Earth-Sun distance - offset
```

#### 3. Day/Night Determination
```
- Calculate solar hour angle
- If angle between -90° and +90°: Day (facing Sun)
- Otherwise: Night (facing away)
```

#### 4. Solar Declination
```
The Sun's declination angle varies throughout the year due to Earth's axial tilt:

Formula:
δ = 23.45° × sin(360° × (284 + N) / 365)

Where:
- δ = solar declination angle
- N = day of year (1-365)
- 23.45° = Earth's axial tilt
- Ranges from -23.45° (winter solstice) to +23.45° (summer solstice)
```

#### 5. Solar Elevation Angle
```
The angle of the Sun above (+) or below (-) the horizon:

Formula:
sin(α) = sin(φ) × sin(δ) + cos(φ) × cos(δ) × cos(H)

Where:
- α = solar elevation angle
- φ = observer's latitude
- δ = solar declination
- H = solar hour angle
- Positive values = Sun above horizon (daytime)
- Negative values = Sun below horizon (nighttime)
- 0° = Sun at horizon (sunrise/sunset)
```

### Update Strategy
- Use `setInterval()` at 100ms intervals
- Recalculate all values on each tick
- Update DOM elements with new values
- Redraw graphs with current position markers
- Use CSS animations for visual feedback

### Graph Rendering Strategy
- **Canvas-based drawing**: Uses HTML5 Canvas API for custom visualization
- **Dual Y-axes**: Left axis for distance, right axis for elevation angle
- **Line styles**: Solid for distance, dashed for elevation
- **Color coding**: Each location assigned a unique color
- **Two view modes**:
  - Daily (24 Hours): Hourly data points for current day
  - Yearly (1 Year): Monthly data points showing seasonal variation
- **Current time indicators**:
  - Vertical line spanning full graph height
  - Yellow dots on each curve at current position
  - Semi-transparent styling to avoid obscuring data
- **Legend management**: Dynamic legend shows all active locations with color keys

### Data Persistence
- **localStorage**: Saves user preferences across sessions
  - Selected unit (km or miles)
  - Automatically loads on page initialization
- **Session state**: Comparison locations stored in memory during session
- **No server required**: All data persisted locally in browser

### Modal Interactions
- **Formula Modal Display**:
  - Full-screen overlay with semi-transparent backdrop
  - Click outside modal or press ESC key to close
  - Smooth fade-in and slide-down animations
  - Detailed explanations of all astronomical calculations
- **Event Handling**:
  - Button click to open modal
  - ESC key listener for keyboard accessibility
  - Click-outside detection for intuitive closing

### Error Handling
- Geolocation permission denied
- Geolocation unavailable
- Position timeout
- Browser compatibility

---

## User Interface Design

### Layout Structure
```
┌─────────────────────────────────────────┐
│              Al Sole                    │
├─────────────────────────────────────────┤
│  You are        [km] [miles]            │
│           149,597,870                   │
│      kilometers from the Sun            │
│                ●                        │
├─────────────────────────────────────────┤
│ Distance from Sun & Solar Elevation     │
│                                         │
│    [24 Hours] [1 Year]                  │
│                                         │
│  Legend: 🔴 Your Location               │
│          🔵 New York   🟢 Tokyo         │
│          Solid=Distance|Dashed=Elevation│
│  ┌────────────────────────────────┐    │
│  │     ┌──────────────────┐       │150M│
│  │  M  │   /\    /\      │       │    │
│  │  k  │  /  \  /  \     │ Elev  │ 50°│
│  │  m  │ /    \/    \    │ (°)   │    │
│  │     │/            \   │       │  0°│
│  │     │--------------│--│-------│    │
│  │     └──────|───────┘   │       │    │
│  │         0h    12h   24h│       │    │
│  └────────────────────────────────┘    │
│         Current time: 14:23 ↑          │
├─────────────────────────────────────────┤
│ Compare Locations                       │
│ [City Dropdown ▼]  [Add Location]      │
│ 🔵 New York (40.7°, -74.0°)     [×]    │
│ 🟢 Tokyo (35.7°, 139.7°)        [×]    │
├────────────┬────────────────────────────┤
│ Local Time │ Solar Noon Offset         │
│ 14:23:45   │ +2h 23m                   │
├────────────┴────────────────────────────┤
│   📍 42.3601°, -71.0589°               │
├─────────────────────────────────────────┤
│          📐 View Formulas              │
└─────────────────────────────────────────┘
```

### Visual Design
- **Color Scheme**: Blue gradient background (sky/space theme) with blue accent colors (#60a5fa)
- **Glass-morphism**: Semi-transparent cards with blur effect
- **Animations**:
  - Pulsing sun icon
  - Blinking blue update indicator
  - Smooth value transitions
  - Real-time graph updates with moving markers
- **Color Coding for Locations**:
  - User location: Blue (#60a5fa)
  - Comparison locations: Cycling through red, cyan, yellow, purple
  - Consistent colors across legend and graph
- **Typography**: Clean, modern sans-serif font
- **Responsive**: Works on mobile and desktop
- **Graph Styling**:
  - Semi-transparent vertical line for current time
  - Yellow position markers for current values
  - Grid lines for readability
  - Dual Y-axes with clear labels
  - Dashed lines for elevation, solid for distance

### Status Indicators
- Loading state: Yellow background
- Error state: Red background
- Active state: Green blinking dot
- Success state: Content visible

---

## File Structure
```
/al-sole
  ├── CLAUDE.md            # Developer workflow guide for Claude Code
  ├── README.md            # Project overview and usage guide
  ├── al-sole.code-workspace # VS Code workspace configuration
  ├── docs/                # Documentation directory
  │   ├── specification.md # Technical specification document (this file)
  │   ├── changelog.md     # Log of changes and features added
  │   ├── deployment.md    # AWS deployment guide
  │   └── todo.md          # Task tracking and planning
  ├── terraform/           # Infrastructure as code
  │   ├── main.tf          # Main orchestration (providers, ACM, modules)
  │   ├── variables.tf     # Root-level input variables
  │   ├── outputs.tf       # Root-level outputs
  │   └── modules/         # Terraform modules
  │       ├── cloudfront/  # CloudFront CDN configuration
  │       ├── route53/     # DNS records configuration
  │       └── s3_bucket/   # S3 bucket configuration
  └── website/
      ├── index.html       # Main application (single-file, self-contained)
      └── favicon.png      # Site icon
```

### Implementation Notes
- Single-file application for simplicity
- Inline CSS and JavaScript
- No build process required
- Works offline after initial load

---

## Performance Considerations

### Optimization
- Minimize DOM manipulations
- Use CSS animations (GPU-accelerated)
- Efficient number formatting (locale strings)
- Debounce location updates if needed

### Browser Compatibility
- Modern browsers (Chrome, Firefox, Safari, Edge)
- Requires JavaScript enabled
- Requires Geolocation API support
- HTTPS required for geolocation in production

---

## Future Enhancements (Optional)
- Add distance to other celestial bodies (Moon, planets)
- Show 3D visualization of Earth's position in orbit
- Add light travel time from Sun (8+ minutes)
- Export graph data to CSV/image
- Share distance on social media
- Additional unit options (AU, light-minutes, light-seconds)
- Show precise sunrise/sunset times
- Add azimuth angle (compass direction to Sun)
- Historical playback mode (see past dates)
- Add sound effects or voice announcements
- Dark mode toggle
- Internationalization (multiple languages)

---

## Validation Criteria
- ✅ Requests and uses user's geolocation
- ✅ Displays distance in user-selected unit (km or miles)
- ✅ Updates in real-time (100ms intervals)
- ✅ Shows day/night status correctly
- ✅ Calculates and displays solar elevation angle
- ✅ Dual-axis graphs with distance and elevation
- ✅ Multi-location comparison with color coding
- ✅ Toggle between 24-hour and yearly views
- ✅ Current time indicators on graphs
- ✅ Handles errors gracefully
- ✅ Responsive design works on mobile
- ✅ Visually appealing interface
- ✅ No external dependencies required
- ✅ User preferences persist via localStorage
