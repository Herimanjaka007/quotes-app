import 'dart:math'; 
import '../models/quote_model.dart';

class QuoteController {
  QuoteModel _model = QuoteModel();

  List<Quote> get quotes => _model.quotes;

  Quote randomQuotes() {
    final _random = new Random();
    return quotes[_random.nextInt(quotes.length)];
  }
}
