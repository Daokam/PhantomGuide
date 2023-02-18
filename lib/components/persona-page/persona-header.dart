import 'package:flutter/material.dart';

class PersonaHeader extends StatelessWidget {
  String name;
  Function() toggleSearchPage;
  PersonaHeader(
      {super.key, required this.name, required this.toggleSearchPage});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        width: double.maxFinite,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
              flex: 2,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Material(
                      color: Colors.transparent,
                      child: IconButton(
                          splashRadius: 25,
                          onPressed: () => toggleSearchPage(),
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ))))),
          Expanded(
              flex: 6,
              child: Center(
                  child: Text(name,
                      style:
                          const TextStyle(fontSize: 30, color: Colors.white)))),
          Expanded(flex: 2, child: SizedBox())
        ]));
  }
}
