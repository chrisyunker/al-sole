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

4. **Educational Formula Modal**
   - Interactive modal displaying all calculation formulas
   - Detailed explanations of astronomical concepts
   - Visual formula breakdowns with color-coded variables
   - Accessible via "View Formulas" button
   - Keyboard shortcut support (ESC to close)

### Display Elements
1. **Primary Display**
   - Distance in kilometers (main display)
   - Distance in miles (secondary)
   - Visual indicators (sun icon, Earth icon)

2. **Supplementary Information**
   - Current Earth-Sun distance (center of Earth)
   - User's position (day/night side)
   - Local time
   - Solar noon offset
   - Geographic coordinates

3. **User Controls**
   - Button to refresh/update location
   - Button to view calculation formulas
   - Status messages for loading/errors

4. **Formula Modal**
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

### Update Strategy
- Use `setInterval()` at 100ms intervals
- Recalculate all values on each tick
- Update DOM elements with new values
- Use CSS animations for visual feedback

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
┌─────────────────────────────────┐
│       🌍 Distance to Sun ☀️     │
├─────────────────────────────────┤
│                                 │
│          ☀️ (animated)          │
│                                 │
│         You are                 │
│      149,597,870               │
│   kilometers from the Sun       │
│    (93,000,000 miles) ●         │
│                                 │
├──────────────┬──────────────────┤
│ Earth-Sun    │ Your Position    │
│ 149.6 M km   │ ☀️ Day          │
├──────────────┼──────────────────┤
│ Local Time   │ Solar Noon       │
│ 14:23:45     │ +2h 23m         │
├──────────────┴──────────────────┤
│   📍 42.3601°, -71.0589°       │
├─────────────────────────────────┤
│      🔄 Update Location         │
│      📐 View Formulas           │
└─────────────────────────────────┘
```

### Visual Design
- **Color Scheme**: Blue gradient background (sky/space theme)
- **Glass-morphism**: Semi-transparent cards with blur effect
- **Animations**:
  - Pulsing sun icon
  - Blinking update indicator
  - Smooth value transitions
- **Typography**: Clean, modern sans-serif font
- **Responsive**: Works on mobile and desktop

### Status Indicators
- Loading state: Yellow background
- Error state: Red background
- Active state: Green blinking dot
- Success state: Content visible

---

## File Structure
```
/al-sole
  ├── index.html           # Main application (all-in-one file)
  ├── SPECIFICATION.md     # Technical specification document
  ├── CLAUDE.md            # Developer workflow guide for Claude Code
  ├── README.md            # Project overview and usage guide
  ├── DEPLOYMENT.md        # AWS deployment guide
  ├── terraform/           # Infrastructure as code
  │   ├── main.tf          # Main orchestration (providers, ACM, modules)
  │   ├── variables.tf     # Root-level input variables
  │   ├── outputs.tf       # Root-level outputs
  │   └── modules/         # Terraform modules
  │       ├── cloudfront/  # CloudFront CDN configuration
  │       ├── route53/     # DNS records configuration
  │       └── s3_bucket/   # S3 bucket configuration
  ├── website/
  │   └── index.html       # Main website file
  └── tasks/
      └── todo.md          # Task tracking and planning
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
- Add distance to other planets
- Show visualization of Earth's position in orbit
- Add light travel time (8+ minutes from Sun)
- Historical distance graph
- Share distance on social media
- Multiple unit options (AU, light-minutes, etc.)
- Show sunrise/sunset times
- Add sound effects or voice announcements

---

## Validation Criteria
- ✅ Requests and uses user's geolocation
- ✅ Displays distance in km and miles
- ✅ Updates in real-time (< 1 second intervals)
- ✅ Shows day/night status correctly
- ✅ Handles errors gracefully
- ✅ Responsive design works on mobile
- ✅ Visually appealing interface
- ✅ No external dependencies required
