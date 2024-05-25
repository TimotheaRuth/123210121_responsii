import 'dart:convert';
import 'char.dart';
import 'package:http/http.dart' as http;

class CharApi{
  static Future<List<Char>> getChar() async{
    var uri = Uri.http('https://genshin.jmp.blue', '/characters',
        {"limit: '50', start: '0'"} as Map<String, dynamic>? );

    final response = await http.get(uri, headers: {
      'Host': 'https://genshin.jmp.blue'
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for(var i in data['feed']){
      _temp.add(i['details']);
    }

    return Char.charFromSnaphot(_temp);
  }
// https://genshin.jmp.blue/weapons/${nama_weapon}/icon
// https://genshin.jmp.blue/weapon
}