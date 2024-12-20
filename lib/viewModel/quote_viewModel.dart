// ignore_for_file: file_names

import 'dart:math';

import 'package:flutter/material.dart';

import '../models/quote_model.dart';

class QuoteController extends ChangeNotifier {
  final QuoteModel _model = QuoteModel();

  List<Quote> get quotes => _model.quotes;

  Quote randomQuotes() {
    notifyListeners();
    final random = Random();
    return quotes[random.nextInt(quotes.length)];
  }
}
