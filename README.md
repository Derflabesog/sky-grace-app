# Sky Grace Ministry – Mobile App (Android + iOS)

Capacitor wrapper around your website (files in `www/`).

## Android
Quickest: push this folder to GitHub → Actions tab → "Build Android APK" → download `app-debug.apk` and install on any phone.
Or locally: install Android Studio → `npm install` → `npx cap sync` → `npx cap open android` → Build > Build APK.
Play Store: Build > Generate Signed Bundle (AAB). One-time $25 Google Play developer fee.

## iOS (needs a Mac with Xcode + Apple Developer account, $99/yr)
`npm install` → `npx cap sync ios` → `npx cap open ios` → set Team under Signing & Capabilities → Product > Archive → upload to App Store Connect / TestFlight.

## After editing the website
Copy changed files into `www/`, then run `npx cap sync`.

## GitHub Codespaces
- Preview in browser: `npm install && npm run serve` → open the forwarded port 8080.
- Build APK: `npm run build:apk` → download `build-output/sky-grace.apk`.
