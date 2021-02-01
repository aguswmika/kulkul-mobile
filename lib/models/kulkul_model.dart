import 'dart:convert';

class Kulkul {
  final String id;
  final String name;
  final String image;
  final String location;
  Kulkul({
    this.id,
    this.name,
    this.image,
    this.location,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'location': location,
    };
  }

  factory Kulkul.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Kulkul(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      location: map['location'],
    );
  }

  String toJson() => json.encode(toMap());
}
