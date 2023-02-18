import 'package:flutter/material.dart';
import 'package:phantomguide/components/compendium.dart';

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (!mounted) return;
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Text(getHeader(_selectedIndex))),
        body: selected(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Compendium',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Confidants',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color.fromRGBO(255, 5, 5, 1),
          onTap: _onItemTapped,
        ));
  }
}

Widget selected(int selection) {
  switch (selection) {
    case 0:
      return Compendium();
    default:
      return Compendium();
  }
}

String getHeader(int selection) {
  switch (selection) {
    case 0:
      return 'Compendium';
    case 1:
      return 'Confidants';
    case 2:
      return 'School';
    default:
      return 'Compendium';
  }
}
