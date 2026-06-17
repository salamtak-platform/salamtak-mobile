# Patient App TODOs for Production

- Move `Form` key out of `build()` into the widget state.

## Release configuration

- Replace placeholder `applicationId` with the real Android package name.
- Configure proper Android release signing instead of debug signing.
- Verify iOS/macOS bundle identifiers and signing settings.

## App architecture

- Implement a stable route/navigation system.
- Add a state management layer for authentication and flow control.
- Create a centralized networking layer for API calls.
- Add error handling for network timeouts and API failures.

## Security and storage

- Add secure token/session storage.
- Secure sensitive data and any API keys.

## Stability and observability

- Add crash reporting and analytics.
- Add logging for important app events and failures.

## Quality and polish

- Remove placeholder/test screens from final app flow.
- Complete onboarding/login/guest flow.
- Ensure full RTL and localization support.
- Add unit tests, widget tests, and integration tests.
- Use strict linting and code analysis.
