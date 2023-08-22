import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Orientation mode = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          switch (mode) {
            Orientation.landscape => "Landscape",
            Orientation.portrait => "Portrait",
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Screen size"),
                  Text(MediaQuery.of(context).size.toString())
                ],
              ),
            ),
          ),
          const SecondHalf(),
        ],
      ),
    );
  }
}

class SecondHalf extends StatelessWidget {
  const SecondHalf({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const column = Column(
      children: [
        LargeCard(text: "First Card"),
        LargeCard(text: "Second Card"),
      ],
    );

    const row = Row(
      children: [
        LargeCard(text: "First Card"),
        LargeCard(text: "Second Card"),
      ],
    );

    return Expanded(
      child: Container(
        color: Colors.red,
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxHeight > 300) {
              return column;
            } else {
              return row;
            }
          },
        ),
      ),
    );
  }
}

class LargeCard extends StatelessWidget {
  const LargeCard({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      ),
    );
  }
}
