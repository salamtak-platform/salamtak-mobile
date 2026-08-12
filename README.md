# Salamtak Mobile

Salamtak Mobile is a Flutter-based patient application developed as part of the Salamtak healthcare platform. The application provides patients with access to healthcare services through a mobile interface, including doctor discovery, appointment booking, medical records, reminders, activities, and an AI-powered healthcare assistant.

## Features

- **Authentication**
  - Patient authentication and account management
  - API authentication through an HTTP interceptor

- **Doctor Discovery**
  - Browse medical specialties
  - Explore available doctors
  - View detailed doctor information

- **Appointment Booking**
  - Multi-step appointment booking workflow
  - Review appointment details before confirmation

- **Medical Records**
  - Access patient medical record information

- **Reminders**
  - View patient-related reminders

- **Activities**
  - Access patient activities through the application

- **Hakim AI**
  - AI-powered healthcare chatbot
  - Send patient messages through the backend AI service
  - Support for English-language requests
  - Chat-session management
  - Handles API and network errors gracefully

## Technology Stack

- **Flutter**
- **Dart**
- **Flutter BLoC / Cubit**
- **Dio**
- **HTTP**
- **Flutter Localization**
- **Intl**
- **Flutter ScreenUtil**
- **Image Picker**
- **Flutter Markdown**
- **Font Awesome**
- **Pinput**

## Architecture

The application follows a feature-oriented structure, with functionality organized under `lib/features`.

Major application areas include:

```text
lib/
├── components/
├── features/
│   ├── auth/
│   ├── hakim_ai/
│   ├── activities_view.dart
│   ├── booking_review_screen.dart
│   ├── doctor_details_view.dart
│   ├── main_view.dart
│   ├── medical_record_view.dart
│   ├── new_appointment_step_one_screen.dart
│   ├── new_appointment_step_two_screen.dart
│   ├── new_appointment_step_three_screen.dart
│   ├── reminders_view.dart
│   └── specialties_view.dart
├── models/
├── services/
├── utilites/
├── api_service.dart
├── app_colors.dart
├── text_styles.dart
└── views.dart
````

The project separates major concerns into feature, service, model, and reusable UI areas.

## API Integration

The application communicates with the Salamtak backend through a centralized `ApiService` built on top of Dio.

The API service provides support for:

* GET requests
* POST requests
* PATCH requests
* DELETE requests
* Query parameters
* Request payloads
* Authentication through an interceptor

The application communicates with the Salamtak API through the configured backend API.

## Hakim AI

Hakim AI is integrated as a dedicated application feature.

The AI service communicates with the backend through dedicated chatbot endpoints and supports:

* Sending patient messages
* Optional English-language requests
* Extracting AI responses from the API response
* Closing chat sessions
* Handling connection, timeout, response, and other network errors

## Project Structure

The repository is organized as a Flutter workspace. The patient application is located at:

```text
apps/patient_app
```

The application also uses shared workspace packages for common functionality, including:

* `core`
* `ui_kit`
* `data`
* `localization`

## Requirements

Before running the project, make sure you have:

* Flutter SDK
* Dart SDK compatible with the project's configured SDK constraint
* Android Studio or another supported Flutter development environment
* An Android or iOS device/emulator

## Getting Started

Clone the repository:

```bash
git clone https://github.com/salamtak-platform/salamtak-mobile.git
cd salamtak-mobile
```

Install dependencies:

```bash
flutter pub get
```

Run the patient application:

```bash
cd apps/patient_app
flutter run
```

> **Note:** The patient application currently references shared workspace packages using local paths. Make sure the complete workspace and its shared packages are available and correctly configured before running the application.

## Status

This project is under active development.

## License

No license is currently specified for this repository.

```
