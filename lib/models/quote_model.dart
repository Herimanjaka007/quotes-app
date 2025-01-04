class Quote {
  String text;

  Quote({required this.text});
}

class QuoteModel {
  final List<Quote> _quotes = [
    Quote(
        text: "Tu es comme un try catch: toujours la pour gerer les imprevus"),
    Quote(
        text:
            "Ton charisme pourrait convaincre un bug de se corriger tout seul."),
    Quote(text: "Tu as plus de style que n'importe quelle feuille css."),
    Quote(text: "Ta creativite depasse celle d'un generateur aleatoire."),
    Quote(text: "tu es aussi fiable qu'un commit bien documente."),
    Quote(
        text:
            "Ton code est si propre qu'il pourrait paser dans une publicite de savon."),
    Quote(
        text:
            "Tu es comme une base de donnes toujours la pour stocker nos meilleurs moments."),
    Quote(text: "Ta presence illumine la piece comme un projecteur 500w"),
    Quote(text: "Tu es aussi rapide qu'un ssd de derniere generation"),
    Quote(
        text:
            "Tu resous les problemes avec autant d'elegance qu'une boucle for bien optimisees"),
    Quote(text: "Tu es plus cool qu'une temperature CPU parafaitement stable"),
    Quote(
        text:
            "Tu es aussi unique qu'un UUID, mais beaucoup plus face a retenir"),
  ];

  List<Quote> get quotes => _quotes;

  Quote getQuote(int index) {
    return _quotes.elementAt(index);
  }

  //modifier la citation
  void modifyQuote(int index, String newText) {
    if (index >= 0 && index < _quotes.length) {
      _quotes[index].text = newText;
    }
  }
}
