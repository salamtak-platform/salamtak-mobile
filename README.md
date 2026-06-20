# Salamtak Mobile

Flutter monorepo for the Salamtak patient and provider applications.

## Workspace

- `apps/patient_app` — patient-facing mobile app
- `apps/provider_app` — provider-facing mobile app
- `packages/core` — shared configuration and core utilities
- `packages/data` — shared data layer
- `packages/localization` — shared localization resources
- `packages/ui_kit` — shared UI assets and components

## Requirements

- Flutter stable with Dart 3.5 or newer
- Android SDK and Java 17 for Android builds
- GNU Make and Bash for the convenience commands

Verify the local toolchain:

```bash
flutter doctor -v
flutter --version
java -version
```

## Setup

```bash
git clone <repository-url>
cd salamtak-mobile
cp .env.example .env
make get
```

The apps read `API_BASE_URL` at compile time. The default targets the host
machine from an Android emulator:

```text
http://10.0.2.2:5000/api
```

Override it for any run or build:

```bash
make run-patient API_BASE_URL=https://api.example.com
```

Do not commit `.env` or credentials. The API URL is not a secret and production
values should be supplied by the deployment environment.

## Common commands

```bash
make get                       # install all workspace dependencies
make run-patient               # run the patient app
make run-provider              # run the provider app
make analyze                   # analyze every app and package
make test                      # run every available test suite
make build-patient-android     # build the patient release APK
make build-provider-android    # build the provider release APK
make build-android             # build both release APKs
make clean                     # clean every workspace package
make ci                        # run the complete local CI sequence
```

APK output is written beneath each app's `build/app/outputs/flutter-apk/`
directory.

## Continuous integration

`.github/workflows/mobile-ci.yml` runs for pushes and pull requests targeting
`main`. It installs Flutter stable and Java 17, resolves the workspace, analyzes
all members, runs all test suites, and builds release APKs for both apps.

## Backend integration

Shared code can import `package:core/core.dart` and use
`AppConfig.apiBaseUrl`. API clients still need to be connected to the backend's
final endpoint contracts, authentication flow, error schema, and environment
URLs.
