/// Compile-time application configuration shared by all Salamtak apps.
abstract final class AppConfig {
  /// Backend URL supplied with `--dart-define=API_BASE_URL=...`.
  static const apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://10.0.2.2:5000/api',
  );
}
