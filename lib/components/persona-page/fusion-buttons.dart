import 'package:flutter/material.dart';

class FusionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        height: 70,
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: () {}, child: Text("Fusion to")),
            ElevatedButton(onPressed: () {}, child: Text("Fusion from")),
          ],
        ));
  }
}
