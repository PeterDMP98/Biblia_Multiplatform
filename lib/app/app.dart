import 'package:flutter/material.dart';

import '../features/bible/presentation/reader/reader_screen.dart';
import 'theme/app_theme.dart';

class BibliaApp extends StatelessWidget {
  const BibliaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biblia Multiplatform',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      home: const ReaderScreen(),
    );
  }
}
