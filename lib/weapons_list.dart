import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsii/weapon.api.dart';
import 'package:responsii/weapon.dart';

class WeaponsList extends StatefulWidget {
  @override
  _WeaponsListState createState() => _WeaponsListState();
}

class _WeaponsListState extends State<WeaponsList> {
  late List<Weapon> _weapon;
  bool _isloading = true;

  @override
  void initState(){
    super.initState();

    getWeapon();
  }

  Future<void> getWeapon() async{
    _weapon = await WeaponApi.getWeapon();
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
            Text('Weapons')
          ],
        ),
      ),
      body: _isloading? Center(child: CircularProgressIndicator()):
      ListView.builder(
        itemCount: _weapon.length,
        itemBuilder: (context, index){
          // return DetailWeaponModel(
          //     name: _weapon[index].name,
          //     image: _weapon[index].image
          // ));
        },
      )
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty<Weapon>('_weapon', _weapon));
  }
}
