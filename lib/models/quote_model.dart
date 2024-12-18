class Quote {
  final String text;

  Quote({required this.text});
}

class QuoteModel {
  final List<Quote> _quotes = [];

  List<Quote> get quotes => _quotes;

  Quote getQuote(int index) {
    return _quotes.elementAt(index);
  }
}
