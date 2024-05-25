class Weapon{
  final String name;
  final String image;

  Weapon({required this.name, required this.image});

  factory Weapon.fromJson(dynamic json){
    return Weapon(
        name: json['name'] as String,
        image: json['image'] as String);
  }

  static List<Weapon> weaponFromSnaphot(List snapshot){
    return snapshot.map((data){
      return Weapon.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Weapon{name: $name, image: $image}';
  }
}