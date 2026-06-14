import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/Frontend/ui/pages/account_page.dart';

void main() {
  group('Widget Test: AccountPage', () {
    testWidgets('Memastikan elemen profil dasar muncul di halaman AccountPage', (WidgetTester tester) async {
      
      await tester.pumpWidget(const MaterialApp(
        home: AccountPage(),
      ));

      expect(find.text('Akun dan Profil'), findsOneWidget);

      expect(find.text('Restu Aditya'), findsWidgets); 
      expect(find.text('Konsultan'), findsWidgets);
      
      expect(find.text('Informasi Profil'), findsOneWidget);
      expect(find.text('Proyek Terkait'), findsOneWidget);
      expect(find.text('Menu Lainnya'), findsOneWidget);

      expect(find.text('Keluar Akun'), findsOneWidget);
      

      expect(find.byIcon(Icons.security_outlined), findsOneWidget);
    });
  });
}
