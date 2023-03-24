import 'package:mon_atelier/app/modules/clients/pages/ajout_client_page.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('AjoutClientPage', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(AjoutClientPage(title: 'T')));
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}