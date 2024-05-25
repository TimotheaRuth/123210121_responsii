class Char{
  final String name;
  final String image;

  Char({required this.name, required this.image});

  factory Char.fromJson(dynamic json){
    return Char(
        name: json['name'] as String,
        image: json['image'] as String);
  }

  static List<Char> charFromSnaphot(List snapshot){
    return snapshot.map((data){
      return Char.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Char{name: $name, image: $image}';
  }
}