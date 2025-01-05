enum Categories { bug, materiel, syntaxe }

class Quote {
  String text;
  Categories category;

  Quote({required this.text, required this.category});
}

class QuoteModel {
  final List<Quote> _quotes = [
    Quote(
        text: "Tu es comme un try catch: toujours la pour gerer les imprevus",
        category: Categories.bug),
    Quote(
        text:
            "Ton charisme pourrait convaincre un bug de se corriger tout seul.",
        category: Categories.bug),
    Quote(
        text: "Tu as plus de style que n'importe quelle feuille css.",
        category: Categories.syntaxe),
    Quote(
        text: "Ta creativite depasse celle d'un generateur aleatoire.",
        category: Categories.materiel),
    Quote(
        text: "tu es aussi fiable qu'un commit bien documente.",
        category: Categories.bug),
    Quote(
        text:
            "Ton code est si propre qu'il pourrait paser dans une publicite de savon.",
        category: Categories.syntaxe),
    Quote(
        text:
            "Tu es comme une base de donnes toujours la pour stocker nos meilleurs moments.",
        category: Categories.bug),
    Quote(
        text: "Ta presence illumine la piece comme un projecteur 500w",
        category: Categories.syntaxe),
    Quote(
        text: "Tu es aussi rapide qu'un ssd de derniere generation",
        category: Categories.materiel),
    Quote(
        text:
            "Tu resous les problemes avec autant d'elegance qu'une boucle for bien optimisees",
        category: Categories.syntaxe),
    Quote(
        text: "Tu es plus cool qu'une temperature CPU parafaitement stable",
        category: Categories.materiel),
    Quote(
        text:
            "Tu es aussi unique qu'un UUID, mais beaucoup plus face a retenir",
        category: Categories.bug),
  ];

  List<Quote> get quotes => _quotes;

  Quote getQuote(int index) {
    return _quotes.elementAt(index);
  }

  //ajout de citation
  void addQuote(Quote q) {
    _quotes.add(q);
  }

  //modifier la citation
  void modifyQuote(int index, String newText) {
    _quotes[index].text = newText;
  }

  // suppression d'un quote
  void deleteQuote(int index) {
    _quotes.removeAt(index);
  }

  // update d'un quote
  void updateQuote(int index, String text) {
    _quotes.elementAt(index).text = text;
  }

  //rechercher une citation
  Iterable<Quote> findQuote(String text, Categories? category) {
    return _quotes
        .where((quote) => quote.text.contains(text))
        .where((quote) => quote.category == category);
  }
}
