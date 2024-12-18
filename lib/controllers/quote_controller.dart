import 'dart:math';

import '../models/quote_model.dart';

class QuoteController {
  final QuoteModel _model = QuoteModel();

  List<Quote> get quotes => _model.quotes;

  Quote randomQuotes() {
    final random = Random();
    return _model.getQuote(random.nextInt(quotes.length));
  }
}
