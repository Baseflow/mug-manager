import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:mug_manager/main.dart' as app;
import 'package:mug_manager/ui/shared/widgets/checkbox_form_field.dart';

void main() async {
  setUpAll(() async {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  });

  testWidgets(
    'Mug list is initially empty',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      expect(find.text('Mug Manager'), findsOneWidget);

      final Finder listTile = find.byElementType(ListTile);
      expect(listTile, findsNothing);
    },
  );

  testWidgets(
    'Create a mug',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      final Finder fab = find.byType(FloatingActionButton);
      await tester.tap(fab);

      await tester.pumpAndSettle();

      expect(find.text('Create new mug'), findsOneWidget);

      final Finder firstNameField = find.byKey(const Key('FIRST_NAME'));
      final Finder lastNameField = find.byKey(const Key('LAST_NAME'));
      final Finder nicknameField = find.byKey(const Key('NICKNAME'));
      final Finder isBrokenField = find.byType(CheckboxFormField);

      await tester.enterText(firstNameField, 'Firstname');
      await tester.enterText(lastNameField, 'Lastname');
      await tester.enterText(nicknameField, 'Nickname');
      await tester.tap(isBrokenField);

      final Finder submitButton = find.byType(ElevatedButton);

      await tester.tap(submitButton);

      await tester.pumpAndSettle();

      expect(find.text('Firstname \'Nickname\' Lastname 💀'), findsOneWidget);
    },
  );

  testWidgets(
    'Update a mug',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      final Finder mugTile = find.byType(ListTile);
      await tester.tap(mugTile);

      await tester.pumpAndSettle();

      expect(find.text('Update mug'), findsNWidgets(2));

      final Finder firstNameField = find.byKey(const Key('FIRST_NAME'));
      final Finder lastNameField = find.byKey(const Key('LAST_NAME'));
      final Finder nicknameField = find.byKey(const Key('NICKNAME'));
      final Finder isBrokenField = find.byType(CheckboxFormField);

      await tester.enterText(firstNameField, 'Firstname2');
      await tester.enterText(lastNameField, 'Lastname2');
      await tester.enterText(nicknameField, 'Nickname2');
      await tester.tap(isBrokenField);

      final Finder submitButton = find.byType(ElevatedButton);

      await tester.tap(submitButton);

      await tester.pumpAndSettle();

      expect(find.text('Firstname2 \'Nickname2\' Lastname2'), findsOneWidget);
    },
  );

  testWidgets(
    'Delete a mug',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      final Finder deleteButton = find.byType(IconButton);
      await tester.tap(deleteButton);

      await tester.pumpAndSettle();

      final Finder mugTile = find.byType(ListTile);
      expect(mugTile, findsNothing);
    },
  );
}
