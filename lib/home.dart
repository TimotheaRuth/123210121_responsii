import 'package:flutter/material.dart';
import 'package:responsii/char_list.dart';
import 'package:responsii/weapons_list.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Genshin Impact")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WeaponsList()),
                );
              },
              child: Text('Weapons'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CharList()),
                );
              },
              child: Text('Characters'),
            )
          ],
        ),
      ),
    );
  }
}
