<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Distance to the Sun - Al Sole</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 50%, #7e8ba3 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #fff;
            padding: 20px;
        }

        .container {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 40px;
            max-width: 600px;
            width: 100%;
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            border: 1px solid rgba(255, 255, 255, 0.18);
        }

        h1 {
            text-align: center;
            margin-bottom: 10px;
            font-size: 2.5em;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }

        .sun-icon {
            text-align: center;
            font-size: 4em;
            margin: 20px 0;
            animation: pulse 2s ease-in-out infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.1); }
        }

        .distance-display {
            text-align: center;
            margin: 30px 0;
        }

        .distance-value {
            font-size: 3em;
            font-weight: bold;
            margin: 10px 0;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }

        .distance-unit {
            font-size: 1.2em;
            opacity: 0.9;
        }

        .info-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
            margin: 20px 0;
        }

        .info-card {
            background: rgba(255, 255, 255, 0.1);
            padding: 15px;
            border-radius: 10px;
            text-align: center;
        }

        .info-label {
            font-size: 0.9em;
            opacity: 0.8;
            margin-bottom: 5px;
        }

        .info-value {
            font-size: 1.3em;
            font-weight: bold;
        }

        .location-info {
            text-align: center;
            margin: 20px 0;
            opacity: 0.9;
            font-size: 0.95em;
        }

        .status {
            text-align: center;
            padding: 15px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            margin: 15px 0;
        }

        .error {
            background: rgba(255, 0, 0, 0.2);
        }

        .loading {
            background: rgba(255, 255, 0, 0.2);
        }

        .button {
            display: block;
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            background: rgba(255, 255, 255, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.3);
            border-radius: 8px;
            color: white;
            font-size: 1em;
            cursor: pointer;
            transition: all 0.3s;
        }

        .button:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: translateY(-2px);
        }

        .update-indicator {
            width: 10px;
            height: 10px;
            border-radius: 50%;
            background: #4ade80;
            display: inline-block;
            margin-left: 5px;
            animation: blink 1s infinite;
        }

        @keyframes blink {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.3; }
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            overflow-y: auto;
            animation: fadeIn 0.3s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .modal-content {
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
            margin: 50px auto;
            padding: 30px;
            border-radius: 15px;
            max-width: 800px;
            width: 90%;
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.6);
            border: 1px solid rgba(255, 255, 255, 0.18);
            position: relative;
            animation: slideDown 0.3s ease;
        }

        @keyframes slideDown {
            from {
                transform: translateY(-50px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        .close {
            color: #fff;
            float: right;
            font-size: 32px;
            font-weight: bold;
            line-height: 24px;
            cursor: pointer;
            transition: color 0.3s;
        }

        .close:hover {
            color: #ffcc00;
        }

        .modal-content h2 {
            color: #fff;
            margin-bottom: 20px;
            font-size: 2em;
            text-align: center;
        }

        .modal-content h3 {
            color: #fff;
            margin-top: 25px;
            margin-bottom: 10px;
            font-size: 1.4em;
            border-bottom: 2px solid rgba(255, 255, 255, 0.3);
            padding-bottom: 5px;
        }

        .modal-content p {
            color: rgba(255, 255, 255, 0.9);
            line-height: 1.6;
            margin-bottom: 15px;
        }

        .formula {
            background: rgba(255, 255, 255, 0.1);
            padding: 15px;
            border-radius: 8px;
            margin: 15px 0;
            font-family: 'Courier New', monospace;
            border-left: 4px solid #4ade80;
        }

        .formula-title {
            color: #4ade80;
            font-weight: bold;
            margin-bottom: 8px;
        }

        .variable {
            color: #fbbf24;
            font-weight: bold;
        }

        .info-button {
            background: rgba(255, 255, 255, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.3);
            color: white;
            padding: 8px 16px;
            border-radius: 8px;
            font-size: 0.9em;
            cursor: pointer;
            transition: all 0.3s;
            margin-top: 10px;
        }

        .info-button:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: translateY(-2px);
        }

        @media (max-width: 600px) {
            h1 {
                font-size: 2em;
            }

            .distance-value {
                font-size: 2.2em;
            }

            .container {
                padding: 25px;
            }

            .info-grid {
                gap: 10px;
            }

            .info-card {
                padding: 12px;
            }

            .modal-content {
                margin: 20px auto;
                padding: 20px;
                width: 95%;
            }

            .modal-content h2 {
                font-size: 1.5em;
            }

            .modal-content h3 {
                font-size: 1.2em;
            }
        }
    </style>

  <!-- Google Analytics -->
  %{ if google_analytics_id != "" }
  <script async src="https://www.googletagmanager.com/gtag/js?id=${google_analytics_id}"></script>
  <script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());
    gtag('config', '${google_analytics_id}');
  </script>
  %{ endif }

</head>
<body>
    <div class="container">
        <h1>🌍 Distance to the Sun ☀️</h1>

        <div class="sun-icon">☀️</div>

        <div id="status" class="status loading">
            Requesting location access...
        </div>

        <div id="mainContent" style="display: none;">
            <div class="distance-display">
                <div class="distance-unit">You are</div>
                <div class="distance-value" id="distanceKm">-</div>
                <div class="distance-unit">kilometers from the Sun</div>
                <div style="margin-top: 10px;">
                    <span id="distanceMiles" style="font-size: 1.1em;">-</span>
                    <span class="update-indicator"></span>
                </div>
            </div>

            <div class="info-grid">
                <div class="info-card">
                    <div class="info-label">Earth-Sun Distance</div>
                    <div class="info-value" id="earthSunDist">-</div>
                </div>
                <div class="info-card">
                    <div class="info-label">Your Position</div>
                    <div class="info-value" id="userPosition">-</div>
                </div>
                <div class="info-card">
                    <div class="info-label">Local Time</div>
                    <div class="info-value" id="localTime">-</div>
                </div>
                <div class="info-card">
                    <div class="info-label">Solar Noon Offset</div>
                    <div class="info-value" id="solarNoon">-</div>
                </div>
            </div>

            <div class="location-info">
                <div id="coordinates">📍 Location: -</div>
            </div>

            <button class="button" onclick="requestLocation()">🔄 Update Location</button>
            <button class="info-button" onclick="openModal()" style="width: 100%; margin-top: 5px;">📐 View Formulas</button>
        </div>
    </div>

    <!-- Formula Modal -->
    <div id="formulaModal" class="modal" onclick="closeModalOnOutsideClick(event)">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2>📐 Distance Calculation Formulas</h2>

            <h3>1. Earth-Sun Distance</h3>
            <p>Earth's orbit around the Sun is elliptical, not circular. The distance varies throughout the year:</p>

            <div class="formula">
                <div class="formula-title">Base Formula:</div>
                <span class="variable">distance</span> = <span class="variable">AU</span> × (1 - <span class="variable">e</span> × cos(<span class="variable">M</span>))
            </div>

            <p><strong>Where:</strong></p>
            <p>
                • <span class="variable">AU</span> = 149,597,870.7 km (Astronomical Unit, average Earth-Sun distance)<br>
                • <span class="variable">e</span> = 0.0167 (eccentricity of Earth's orbit)<br>
                • <span class="variable">M</span> = Mean Anomaly (angle from perihelion)
            </p>

            <div class="formula">
                <div class="formula-title">Mean Anomaly Calculation:</div>
                <span class="variable">M</span> = (2π × <span class="variable">daysSincePerihelion</span>) / 365.25
            </div>

            <p>
                • Perihelion (closest point) occurs around January 3<br>
                • Aphelion (farthest point) occurs around July 4<br>
                • This creates a ~5 million km variation in Earth-Sun distance
            </p>

            <h3>2. Your Distance Offset</h3>
            <p>Your personal distance from the Sun varies based on your position on Earth's surface and the time of day:</p>

            <div class="formula">
                <div class="formula-title">User Offset:</div>
                <span class="variable">offset</span> = <span class="variable">R</span> × cos(<span class="variable">lat</span>) × cos(<span class="variable">H</span>)
            </div>

            <p><strong>Where:</strong></p>
            <p>
                • <span class="variable">R</span> = 6,371 km (Earth's radius)<br>
                • <span class="variable">lat</span> = your latitude in radians<br>
                • <span class="variable">H</span> = solar hour angle (your rotation position)
            </p>

            <div class="formula">
                <div class="formula-title">Solar Hour Angle:</div>
                <span class="variable">H</span> = ((UTC_hours - 12) × 15 + <span class="variable">longitude</span>) × π/180
            </div>

            <p>
                • Earth rotates 15 degrees per hour (360°/24h)<br>
                • At solar noon (H = 0°): you're closest to the Sun<br>
                • At solar midnight (H = 180°): you're farthest from the Sun<br>
                • Maximum variation: ~12,742 km (Earth's diameter)
            </p>

            <div class="formula">
                <div class="formula-title">Final User Distance:</div>
                <span class="variable">userDistance</span> = <span class="variable">earthSunDistance</span> - <span class="variable">offset</span>
            </div>

            <h3>3. Day/Night Determination</h3>
            <p>Whether you're facing the Sun (day) or away from it (night):</p>

            <div class="formula">
                <div class="formula-title">Day Condition:</div>
                -90° ≤ <span class="variable">solarHourAngle</span> ≤ 90° → Day<br>
                Otherwise → Night
            </div>

            <h3>4. Solar Noon Offset</h3>
            <p>Solar noon occurs when the Sun is highest in your sky:</p>

            <div class="formula">
                <div class="formula-title">Solar Noon (UTC):</div>
                <span class="variable">solarNoon</span> = 12 - (<span class="variable">longitude</span> / 15)
            </div>

            <p>
                • Each 15° of longitude = 1 hour time difference<br>
                • This doesn't account for time zones or daylight saving time<br>
                • It represents true solar time based on Earth's rotation
            </p>

            <h3>Real-Time Updates</h3>
            <p>This application recalculates all values every 100 milliseconds to show how your distance changes in real-time as Earth rotates on its axis. You can see the numbers change continuously!</p>

            <p style="text-align: center; margin-top: 30px; opacity: 0.8;">
                <em>All calculations use simplified astronomical models suitable for educational purposes.</em>
            </p>
        </div>
    </div>

    <script>
        let userLat = null;
        let userLon = null;
        let updateInterval = null;

        // Request user's location on page load
        window.addEventListener('load', () => {
            requestLocation();
        });

        function requestLocation() {
            const statusEl = document.getElementById('status');
            statusEl.className = 'status loading';
            statusEl.textContent = 'Requesting location access...';

            if ('geolocation' in navigator) {
                navigator.geolocation.getCurrentPosition(
                    onLocationSuccess,
                    onLocationError,
                    { enableHighAccuracy: true }
                );
            } else {
                statusEl.className = 'status error';
                statusEl.textContent = 'Geolocation is not supported by your browser';
            }
        }

        function onLocationSuccess(position) {
            userLat = position.coords.latitude;
            userLon = position.coords.longitude;

            document.getElementById('status').style.display = 'none';
            document.getElementById('mainContent').style.display = 'block';

            // Update immediately
            updateDistance();

            // Update every 100ms for smooth real-time updates
            if (updateInterval) clearInterval(updateInterval);
            updateInterval = setInterval(updateDistance, 100);
        }

        function onLocationError(error) {
            const statusEl = document.getElementById('status');
            statusEl.className = 'status error';

            switch(error.code) {
                case error.PERMISSION_DENIED:
                    statusEl.textContent = 'Location access denied. Please enable location access and refresh.';
                    break;
                case error.POSITION_UNAVAILABLE:
                    statusEl.textContent = 'Location information unavailable.';
                    break;
                case error.TIMEOUT:
                    statusEl.textContent = 'Location request timed out.';
                    break;
                default:
                    statusEl.textContent = 'An unknown error occurred.';
            }
        }

        function updateDistance() {
            const now = new Date();

            // Calculate Earth-Sun distance using simplified astronomical formula
            const dayOfYear = getDayOfYear(now);
            const earthSunDistanceKm = calculateEarthSunDistance(dayOfYear);

            // Calculate user's distance from Sun considering Earth's rotation
            const userDistanceKm = calculateUserDistanceFromSun(
                userLat,
                userLon,
                now,
                earthSunDistanceKm
            );

            // Update display
            document.getElementById('distanceKm').textContent =
                userDistanceKm.toLocaleString('en-US', { maximumFractionDigits: 0 });

            const distanceMiles = userDistanceKm * 0.621371;
            document.getElementById('distanceMiles').textContent =
                distanceMiles.toLocaleString('en-US', { maximumFractionDigits: 0 }) + ' miles';

            document.getElementById('earthSunDist').textContent =
                (earthSunDistanceKm / 1000000).toFixed(2) + ' M km';

            const position = isUserFacingSun(userLat, userLon, now) ? '☀️ Day' : '🌙 Night';
            document.getElementById('userPosition').textContent = position;

            document.getElementById('localTime').textContent =
                now.toLocaleTimeString('en-US', { hour: '2-digit', minute: '2-digit', second: '2-digit' });

            const solarNoonOffset = calculateSolarNoonOffset(userLon, now);
            document.getElementById('solarNoon').textContent = solarNoonOffset;

            document.getElementById('coordinates').textContent =
                `📍 $${userLat.toFixed(4)}°, $${userLon.toFixed(4)}°`;
        }

        function getDayOfYear(date) {
            const start = new Date(date.getFullYear(), 0, 0);
            const diff = date - start;
            const oneDay = 1000 * 60 * 60 * 24;
            return Math.floor(diff / oneDay);
        }

        function calculateEarthSunDistance(dayOfYear) {
            // Earth's orbit is elliptical with perihelion ~Jan 3 and aphelion ~July 4
            // Average distance (1 AU) = 149,597,870.7 km
            // Eccentricity of Earth's orbit ≈ 0.0167

            const AU = 149597870.7; // km
            const eccentricity = 0.0167;

            // Approximate orbital position (0 = perihelion, around Jan 3)
            const perihelionDay = 3;
            const daysSincePerihelion = (dayOfYear - perihelionDay + 365) % 365;
            const meanAnomaly = (2 * Math.PI * daysSincePerihelion) / 365.25;

            // Simplified distance calculation
            const distance = AU * (1 - eccentricity * Math.cos(meanAnomaly));

            return distance;
        }

        function calculateUserDistanceFromSun(lat, lon, time, earthSunDistance) {
            // Convert latitude to radians
            const latRad = lat * Math.PI / 180;

            // Earth's radius in km
            const earthRadius = 6371;

            // Calculate hour angle (Earth's rotation)
            const hours = time.getUTCHours();
            const minutes = time.getUTCMinutes();
            const seconds = time.getUTCSeconds();
            const milliseconds = time.getUTCMilliseconds();

            // Decimal hours since midnight UTC
            const decimalHours = hours + minutes/60 + seconds/3600 + milliseconds/3600000;

            // Solar hour angle for the longitude (15 degrees per hour)
            // At solar noon (12:00 solar time), the user is closest to the Sun
            const solarHourAngle = ((decimalHours - 12) * 15 + lon) * Math.PI / 180;

            // User's distance from Earth's center projected toward the Sun
            const userOffsetFromCenter = earthRadius * Math.cos(latRad) * Math.cos(solarHourAngle);

            // Total distance from user to Sun
            const userDistanceFromSun = earthSunDistance - userOffsetFromCenter;

            return userDistanceFromSun;
        }

        function isUserFacingSun(lat, lon, time) {
            const hours = time.getUTCHours();
            const minutes = time.getUTCMinutes();
            const decimalHours = hours + minutes/60;

            // Calculate solar hour angle
            const solarHourAngle = ((decimalHours - 12) * 15 + lon);

            // Normalize to -180 to 180
            let angle = solarHourAngle % 360;
            if (angle > 180) angle -= 360;
            if (angle < -180) angle += 360;

            // If angle is between -90 and 90, user is facing the Sun (daytime)
            return angle >= -90 && angle <= 90;
        }

        function calculateSolarNoonOffset(lon, time) {
            const hours = time.getUTCHours();
            const minutes = time.getUTCMinutes();
            const decimalHours = hours + minutes/60;

            // Solar noon in UTC for this longitude
            const solarNoonUTC = 12 - (lon / 15);

            // Offset from solar noon
            let offset = decimalHours - solarNoonUTC;

            // Normalize to -12 to 12
            while (offset > 12) offset -= 24;
            while (offset < -12) offset += 24;

            const absOffset = Math.abs(offset);
            const hrs = Math.floor(absOffset);
            const mins = Math.round((absOffset - hrs) * 60);

            if (Math.abs(offset) < 0.05) {
                return 'At solar noon';
            }

            const timeStr = hrs > 0 ? `$${hrs}h $${mins}m` : `$${mins}m`;
            return offset > 0 ? `+$${timeStr}` : `-$${timeStr}`;
        }

        // Modal functions
        function openModal() {
            document.getElementById('formulaModal').style.display = 'block';
        }

        function closeModal() {
            document.getElementById('formulaModal').style.display = 'none';
        }

        function closeModalOnOutsideClick(event) {
            const modal = document.getElementById('formulaModal');
            if (event.target === modal) {
                closeModal();
            }
        }

        // Allow ESC key to close modal
        document.addEventListener('keydown', function(event) {
            if (event.key === 'Escape') {
                closeModal();
            }
        });
    </script>
</body>
</html>
