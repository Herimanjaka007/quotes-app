import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/viewModel/quote_viewModel.dart';
import 'package:quotes_app/views/quote_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuoteController(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: QuoteView(),
      ),
    );
  }
}
