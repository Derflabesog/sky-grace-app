#!/usr/bin/env bash
# Builds a debug APK inside GitHub Codespaces (installs Android SDK if missing)
set -e
export ANDROID_HOME="$HOME/android-sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
if [ ! -d "$ANDROID_HOME/cmdline-tools/latest" ]; then
  mkdir -p "$ANDROID_HOME/cmdline-tools"
  curl -fsSL -o /tmp/cmdtools.zip https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip
  unzip -q /tmp/cmdtools.zip -d "$ANDROID_HOME/cmdline-tools"
  mv "$ANDROID_HOME/cmdline-tools/cmdline-tools" "$ANDROID_HOME/cmdline-tools/latest"
fi
export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH"
yes | sdkmanager --licenses >/dev/null || true
sdkmanager "platform-tools" "platforms;android-35" "build-tools;35.0.0"
echo "sdk.dir=$ANDROID_HOME" > android/local.properties
npx cap sync android
cd android && chmod +x gradlew && ./gradlew assembleDebug
mkdir -p ../build-output && cp app/build/outputs/apk/debug/app-debug.apk ../build-output/sky-grace.apk
echo "DONE -> build-output/sky-grace.apk (right-click in Explorer > Download)"
