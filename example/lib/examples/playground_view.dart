// This is a playground view to make it easy to play around with Flutter Animate.

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class PlaygroundView extends StatelessWidget {
  const PlaygroundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children:List.generate(100, (index) {
              return const Card(
                child: DefaultTextStyle(
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  child: Text("Playground 🛝")

                ),
              ).animate().fadeIn(duration: 800.ms)
                  .slideY(duration: 900.ms, begin: 0.4);
            }).toList()

          ),
          Column(
              children:List.generate(100, (index) {
                return const Card(
                  child: DefaultTextStyle(
                      style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                      child: Text("Playground 🛝")

                  ),
                ).animate().fadeIn(duration: 800.ms)
                    .slideY(duration: 900.ms, begin: 0.4);
              }).toList()

          )
        ],
      ),
    );
  }
}
