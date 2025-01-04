import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/viewModel/quote_viewModel.dart';

class QuoteView extends StatefulWidget {
  const QuoteView({super.key});

  @override
  State<QuoteView> createState() => QuoteViewState();
}

class QuoteViewState extends State<QuoteView> {
  final TextEditingController _quoteController = TextEditingController();
  String? _selectedCategory;

  @override
  void dispose() {
    _quoteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final quote = Provider.of<QuoteController>(context);
//otrotranzao ilay style ao am model
//  [
//   Quote(text: "CSS is good!", category: "CSS"),
//   Quote(text: "Flutter is great!", category: "Flutter"),
//   Quote(text: "CSS is cool!", category: "CSS"),
//   Quote(text: "Dart is cute!", category: "Dart"),
// ]

    //ito no angalan'azy par catégory (tsy maninona raha misy category double)
    // final categories = quote.quotes.map((q) => q.category).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Dev Quotes"),
        backgroundColor: const Color.fromARGB(255, 123, 22, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                shadowColor: Colors.black54,
                elevation: 5,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 50, horizontal: 15),
                  child: Text(
                    quote.randomQuotes().text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FilledButton(
                onPressed: () => setState(() => quote.randomQuotes()),
                child: const Text("Generer"),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _quoteController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Ajouter une citation",
                  hintText: "Entrez une citation ici",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              FilledButton(
                onPressed: () {
                  final newQuote = _quoteController.text.trim();
                  if (newQuote.isNotEmpty) {
                    // quote.addQuote(newQuote); // ito ilay méthode add quote efa poinss TSARA
                    _quoteController.clear();
                  }
                },
                child: const Text("Ajouter"),
              ),
              const SizedBox(
                height: 20,
              ),

              // select miandry an'ilay catégories atsy am modèle
              // DropdownButton<String>(
              //   value: _selectedCategory,
              //   hint: const Text("Sélectionnez une catégorie"),
              //   items: categories.map((category) {
              //     return DropdownMenuItem(
              //       value: category,
              //       child: Text(category),
              //     );
              //   }).toList(),
              //   onChanged: (value) {
              //     setState(() {
              //       _selectedCategory = value;
              //     });
              //   },
              // ),
              const SizedBox(
                height: 10,
              ),
              FilledButton(
                onPressed: () {
                  if (_selectedCategory != null) {
                    // eto no filtre an'ilay category
                    // final filteredQuotes = quote.quotes
                    //     .where((q) =>
                    //         q.category.toLowerCase() ==
                    //         _selectedCategory!.toLowerCase())
                    //     .toList();
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(" $_selectedCategory "),
                        content: SizedBox(
                          height: 200,
                          child: ListView(
                              //eto ilay listena ilay quote par catégories
                              // children: filteredQuotes
                              //     .map((q) => ListTile(title: Text(q.text)))
                              //     .toList(),
                              ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Close"),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: const Text("Rechercher"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
