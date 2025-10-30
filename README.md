# Al Sole - Distance to the Sun

A real-time web application that calculates and displays your distance from the Sun based on your geographic location. Watch as your distance changes continuously as Earth rotates on its axis!

![Al Sole Banner](https://img.shields.io/badge/Al%20Sole-Distance%20to%20Sun-blue)
![Technology](https://img.shields.io/badge/tech-vanilla%20JS-yellow)
![No Dependencies](https://img.shields.io/badge/dependencies-none-green)

## Features

- **Real-Time Distance Calculation**: See your distance from the Sun update every 100 milliseconds
- **Geolocation-Based**: Uses your precise latitude and longitude for accurate calculations
- **Astronomical Accuracy**: Accounts for Earth's elliptical orbit and rotational position
- **Day/Night Indicator**: Shows whether you're on the sunward or dark side of Earth
- **Multiple Units**: Displays distance in both kilometers and miles
- **Educational Content**: Interactive modal with detailed explanations of all formulas
- **Beautiful UI**: Modern glass-morphism design with smooth animations
- **No Dependencies**: Pure vanilla JavaScript - no frameworks required
- **Works Offline**: Single HTML file that works after initial load

## Quick Start

### Running Locally

1. Clone or download this repository
2. Open `index.html` in a modern web browser
3. Allow location access when prompted
4. Watch your distance from the Sun in real-time!

**Note**: For geolocation to work properly:
- Use a modern browser (Chrome, Firefox, Safari, Edge)
- Enable JavaScript
- Grant location permissions when prompted
- For production deployment, HTTPS is required

## What It Shows

### Primary Display
- **Your Distance**: Real-time distance from you to the Sun (km and miles)
- **Earth-Sun Distance**: Current distance from Earth's center to the Sun
- **Day/Night Status**: Whether you're facing toward or away from the Sun
- **Local Time**: Your current time with live updates
- **Solar Noon Offset**: How far you are from solar noon (when Sun is highest)
- **Your Coordinates**: Your latitude and longitude

### Educational Features
Click the "View Formulas" button to see:
- How Earth-Sun distance is calculated using orbital mechanics
- How your position affects your personal distance
- The math behind day/night determination
- Solar noon calculations
- All formulas explained with color-coded variables

## How It Works

The application uses several astronomical calculations:

1. **Earth-Sun Distance**: Calculates the current distance between Earth's center and the Sun based on Earth's elliptical orbit, accounting for perihelion (closest, ~January 3) and aphelion (farthest, ~July 4)

2. **Your Distance Offset**: Determines your additional distance based on:
   - Your latitude (distance from Earth's axis)
   - Your longitude and current time (Earth's rotation)
   - Whether you're facing toward or away from the Sun

3. **Real-Time Updates**: Recalculates every 100ms to show how your distance changes as Earth rotates (approximately 1,670 km/h at the equator)

## Technical Details

- **Technology Stack**: HTML5, CSS3, Vanilla JavaScript (ES6+)
- **APIs Used**: Browser Geolocation API only
- **Update Frequency**: 100ms intervals
- **Calculation Precision**: Uses standard astronomical constants
- **Browser Compatibility**: All modern browsers

For detailed technical specifications, see [SPECIFICATION.md](SPECIFICATION.md)

## Deployment

The application can be deployed to AWS using the included Terraform configuration:

```bash
# Initial setup
cd terraform
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your values
terraform init
terraform apply

# Deploy updates
cd terraform
terraform apply
```

The infrastructure includes:
- **S3** for static hosting
- **CloudFront** for CDN and HTTPS
- **Route53** for DNS (alsole.yunker.dev)
- **ACM** for SSL certificate

For detailed deployment instructions, see [DEPLOYMENT.md](DEPLOYMENT.md)

## File Structure

```
/al-sole
  ├── index.html           # Main application (all-in-one file)
  ├── SPECIFICATION.md     # Comprehensive technical specification
  ├── DEPLOYMENT.md        # AWS deployment guide
  ├── CLAUDE.md            # Developer workflow guide
  ├── README.md            # This file
  ├── terraform/           # Infrastructure as code
  │   ├── main.tf          # Main orchestration (providers, ACM, modules)
  │   ├── variables.tf     # Root-level input variables
  │   ├── outputs.tf       # Root-level outputs
  │   ├── .gitignore       # Terraform-specific ignores
  │   ├── .tool-versions   # Tool version management
  │   └── modules/         # Terraform modules
  │       ├── cloudfront/  # CloudFront CDN configuration
  │       ├── route53/     # DNS records configuration
  │       └── s3_bucket/   # S3 bucket configuration
  ├── website/
  │   └── index.html.tpl   # Website template with Google Analytics
  └── tasks/
      └── todo.md          # Task tracking and planning
```

## Educational Value

This application demonstrates:
- Practical application of astronomical calculations
- Earth's orbital mechanics and rotation
- Geographic coordinate systems
- Real-time data visualization
- Modern web development without frameworks

## Privacy

- Location data is processed entirely in your browser
- No data is transmitted to any server
- No tracking or analytics
- No cookies or local storage used

## Future Enhancements

Potential additions:
- Distance to other planets
- Visualization of Earth's orbital position
- Light travel time from Sun (~8 minutes)
- Historical distance graphs
- Social media sharing
- Additional unit options (AU, light-minutes)
- Sunrise/sunset time predictions

## License

This is an educational project. Feel free to use, modify, and learn from it.

## Credits

Created to demonstrate real-time astronomical calculations using web technologies.

---

**Live Updates**: Your distance from the Sun changes by approximately **18 meters per second** as Earth rotates!
