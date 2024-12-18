import 'dart:math';
import 'package:flutter/material.dart';

import '../models/quote_model.dart';

class QuoteController extends ChangeNotifier {
  QuoteModel _model = QuoteModel();

  List<Quote> get quotes => _model.quotes;

  Quote randomQuotes() {
    notifyListeners();
    final _random = new Random();
    return quotes[_random.nextInt(quotes.length)];
  }
}
