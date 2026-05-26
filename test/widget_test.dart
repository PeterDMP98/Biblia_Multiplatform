import 'package:biblia_multiplatform/app/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  testWidgets('renders the reader shell', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: BibliaApp()));

    expect(find.text('Juan 3:16'), findsWidgets);
    expect(find.textContaining('RV1909'), findsWidgets);
  });
}
