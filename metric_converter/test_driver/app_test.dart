// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Screen Grabs', () {
    final headingTextFinder = find.byValueKey('heading_text');
    final tabBarFinder = find.byType('TabBarView');
    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('starts with degrees', () async {
      expect(await driver.getText(headingTextFinder), '\u00B0Celsius');
    });

    test('has a tab bar', () async {
      final tabBar = await driver.getRenderObjectDiagnostics(tabBarFinder);
      expect(tabBar.isNotEmpty, true);
    });
/*
    test('starts at 0', () async {
      // Use the `driver.getText` method to verify the counter starts at 0.
      expect(await driver.getText(counterTextFinder), "0");
    });

    test('increments the counter', () async {
      // First, tap the button.
      await driver.tap(buttonFinder);

      // Then, verify the counter text is incremented by 1.
      expect(await driver.getText(counterTextFinder), "1");
    });
  */
  });
}
