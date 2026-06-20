import 'package:core/core.dart';
import 'package:test/test.dart';

void main() {
  group('core', () {
    final awesome = Awesome();

    test('exports the sample core type', () {
      expect(awesome.isAwesome, isTrue);
    });

    test('provides a non-empty API base URL', () {
      expect(AppConfig.apiBaseUrl, isNotEmpty);
      expect(Uri.tryParse(AppConfig.apiBaseUrl)?.hasScheme, isTrue);
    });
  });
}
