import 'package:flutter/material.dart';

void main() {
  runApp(const GoApp());
}

class GoApp extends StatelessWidget {
  const GoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Go Game',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Go Board'),
        ),
        body: Center(
          child: GoBoardWidget(size: 9), // You can change the board size here
        ),
      ),
    );
  }
}

class GoBoardWidget extends StatelessWidget {
  final int size;

  const GoBoardWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1, // Make the board square
      child: Container(
        color: Colors.orange[100], // Background color for the board area
        child: GridView.builder(
          itemCount: size * size,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: size,
          ),
          itemBuilder: (context, index) {
            final row = index ~/ size;
            final col = index % size;

            // Calculate spacing for grid lines
            final double top = row == 0 ? 20 : 0;
            final double left = col == 0 ? 20 : 0;
            final double right = col == size - 1 ? 20 : 0;
            final double bottom = row == size - 1 ? 20 : 0;

            return Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: row > 0 ? Colors.black : Colors.transparent,
                    width: 1.0,
                  ),
                  left: BorderSide(
                    color: col > 0 ? Colors.black : Colors.transparent,
                    width: 1.0,
                  ),
                  right: BorderSide(
                    color: col < size - 1 ? Colors.black : Colors.transparent,
                    width: 1.0,
                  ),
                  bottom: BorderSide(
                    color: row < size - 1 ? Colors.black : Colors.transparent,
                    width: 1.0,
                  ),
                ),
              ),
              child: InkWell(
                onTap: () {
                  // TODO: Implement stone placement logic here
                  print('Tapped at ($row, $col)');
                },
                child: Container(), // Placeholder for where stones will be
              ),
            );
          },
        ),
      ),
    );
  }
}
