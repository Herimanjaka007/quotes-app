import 'package:flutter/material.dart';
import 'package:quotes_app/controllers/quote_controller.dart';

class QuoteView extends StatefulWidget {
  const QuoteView({super.key});

  @override
  State<QuoteView> createState() => QuoteViewState();
}

class QuoteViewState extends State<QuoteView> {
  final _quote = QuoteController();

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
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
                    _quote.randomQuotes().text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FilledButton(
                  onPressed: () => setState(() {}),
                  child: const Text("Generer"))
            ],
          ),
        ),
      ),
    ));
  }
}
