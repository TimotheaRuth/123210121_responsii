import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsii/char.dart';
import 'char.api.dart';

class CharList extends StatefulWidget {
  @override
  _CharListState createState() => _CharListState();
}

class _CharListState extends State<CharList> {
  late List<Char> _char;
  bool _isloading = true;

  @override
  void initState(){
    super.initState();

    getWeapon();
  }

  Future<void> getWeapon() async{
    _char = await CharApi.getChar();
    setState(() {
      _isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 10),
              Text('Characters')
            ],
          ),
        ),
        body: _isloading? Center(child: CircularProgressIndicator()):
        ListView.builder(
          itemCount: _char.length,
          itemBuilder: (context, index){
            // return DetailCharModel(
            //     name: _char[index].name,
            //     image: _char[index].image
            // ));
          },
        )
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty<Char>('_char', _char));
  }
}
