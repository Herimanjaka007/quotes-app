import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/viewModel/quote_viewModel.dart';

import '../models/quote_model.dart';

class QuoteView extends StatefulWidget {
  const QuoteView({super.key});

  @override
  State<QuoteView> createState() => QuoteViewState();
}

class QuoteViewState extends State<QuoteView> {
  final TextEditingController _quoteController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  Categories? _selectedCategory;
  String _searchKeyword = '';

  @override
  void dispose() {
    _quoteController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final quoteController = Provider.of<QuoteController>(context);

    final filteredQuotes =
        quoteController.findQuote(_searchKeyword, _selectedCategory);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Dev Quotes"),
        backgroundColor: const Color.fromARGB(255, 123, 22, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _searchController,
              onChanged: (text) {
                setState(() {
                  _searchKeyword = text;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Rechercher par mot-clé',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 20),
            DropdownButton<Categories>(
              value: _selectedCategory,
              hint: const Text("Sélectionner une catégorie"),
              items: Categories.values.map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category.name),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value;
                });
              },
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () {
                final randomQuote = quoteController.randomQuotes();
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Citation aléatoire"),
                      content: Text(randomQuote.text),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Fermer"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text("Générer une citation"),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: filteredQuotes.length,
                itemBuilder: (context, index) {
                  final q = filteredQuotes.elementAt(index);
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    elevation: 5,
                    child: ListTile(
                      title: Text(q.text),
                      subtitle: Text('Catégorie: ${q.category.name}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () => _showEditQuoteDialog(context, q),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => _showDeleteQuoteDialog(context, q),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            FloatingActionButton(
              onPressed: () => _showAddQuoteDialog(context),
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddQuoteDialog(BuildContext context) {
    final quoteController =
        Provider.of<QuoteController>(context, listen: false);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Ajouter une citation"),
          content: SizedBox(
            height: 250,
            child: Column(
              children: [
                TextField(
                  controller: _quoteController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Entrez une citation",
                    hintText: "Entrez ici",
                  ),
                ),
                const SizedBox(height: 10),
                DropdownButton<Categories>(
                  value: _selectedCategory,
                  hint: const Text("Sélectionner une catégorie"),
                  items: Categories.values.map((category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category.name),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCategory = value;
                    });
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                final text = _quoteController.text.trim();
                if (text.isNotEmpty) {
                  final newQuote = Quote(
                    text: text,
                    category: _selectedCategory!,
                  );
                  quoteController.addQuote(newQuote);
                  Navigator.pop(context);
                  _quoteController.clear();
                }
              },
              child: const Text("Ajouter"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Annuler"),
            ),
          ],
        );
      },
    );
  }

  void _showEditQuoteDialog(BuildContext context, Quote quote) {
    final TextEditingController editController =
        TextEditingController(text: quote.text);

    final quoteController =
        Provider.of<QuoteController>(context, listen: false);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Modifier la citation"),
          content: SizedBox(
            height: 250,
            child: Column(
              children: [
                TextField(
                  controller: editController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Modifiez la citation",
                    hintText: "Entrez ici",
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                final updatedText = editController.text.trim();
                if (updatedText.isNotEmpty) {
                  final index = quoteController.quotes.indexOf(quote);
                  quoteController.updateQuote(index, updatedText);
                  Navigator.pop(context);
                }
              },
              child: const Text("Mettre à jour"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Annuler"),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteQuoteDialog(BuildContext context, Quote quote) {
    final quoteController =
        Provider.of<QuoteController>(context, listen: false);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Supprimer la citation"),
          content:
              const Text("Êtes-vous sûr de vouloir supprimer cette citation ?"),
          actions: [
            TextButton(
              onPressed: () {
                final index = quoteController.quotes.indexOf(quote);
                quoteController.removeQuote(index);
                Navigator.pop(context);
              },
              child: const Text("Supprimer"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Annuler"),
            ),
          ],
        );
      },
    );
  }
}
