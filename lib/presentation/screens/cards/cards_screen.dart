import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elevatio 0'},
  {'elevation': 3.0, 'label': 'Elevatio 3'},
  {'elevation': 7.0, 'label': 'Elevatio 7'},
];

class CardsScreen extends StatelessWidget {
  static const String name = 'cards_screen';
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cards Screen')),
      body: _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...cards.map(
            (card) =>
                _CardType1(elevation: card['elevation'], label: card['label']),
          ),
          ...cards.map(
            (card) =>
                _CardType2(elevation: card['elevation'], label: card['label']),
          ),
          ...cards.map(
            (card) =>
                _CardType3(elevation: card['elevation'], label: card['label']),
          ),
          ...cards.map(
            (card) =>
                _CardType4(elevation: card['elevation'], label: card['label']),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType1({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => {},
                icon: const Icon(Icons.arrow_right_alt_outlined),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(colors.tertiary),
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                ),
              ),
            ),
            Align(alignment: Alignment.bottomLeft, child: Text(label)),
          ],
        ),
      ),
    );
  }
}

class _CardType2 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType2({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: colors.outline, width: 2),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => {},
                icon: const Icon(Icons.arrow_right_alt_outlined),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(colors.tertiary),
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - outline'),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardType3 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType3({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      color: colors.tertiaryFixedDim,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => {},
                icon: const Icon(Icons.arrow_right_alt_outlined),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(colors.tertiary),
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - Filled'),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardType4 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType4({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: elevation,
      child: Stack(
        children: [
          Image.network(
            'https://picsum.photos/id/${elevation.toInt()}/600/250',
            height: 350,
            fit: BoxFit.cover,
          ),

          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                ),
              ),

              child: IconButton(
                onPressed: () => {},
                icon: const Icon(Icons.arrow_right_rounded),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
