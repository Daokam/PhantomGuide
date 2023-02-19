import 'package:flutter/material.dart';
import 'package:phantomguide/classes/skill.dart';
import 'package:phantomguide/classes/stat.dart';

class StatChart extends StatelessWidget {
  List<num> stats;

  StatChart({super.key, required this.stats});
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (num stat in stats)
            LayoutBuilder(builder: (ctx, constraints) {
              return Container(
                width: constraints.maxWidth * (stat / 100),
                height: 20,
                color: Colors.red,
              );
            }),
        ]);
  }
}
