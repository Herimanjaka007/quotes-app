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

  // Ajout de citations
  void addQuote(Quote q) {
    _model.addQuote(q);
    notifyListeners();
  }

  // Recherche de citations
  Iterable<Quote> findQuote(String text, Categories? category) {
    notifyListeners();
    return _model.findQuote(text, category);
  }

  //Suppression des citations
  void removeQuote(int index) {
    _model.deleteQuote(index);
    notifyListeners();
  }

  //Update citation
  void updateQuote(int index, String text) {
    _model.updateQuote(index, text);
    notifyListeners();
  }
}
