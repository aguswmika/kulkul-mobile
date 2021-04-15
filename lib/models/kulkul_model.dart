import 'dart:convert';

import 'package:semantic_kulkul/models/location_model.dart';

class Kulkul {
  List<String> names;
  List<int> numbers;
  List<String> rawMaterials;
  List<String> dimensions;
  List<String> pengangges;
  List<String> directions;
  String image;
  List<String> imageGallery;
  String location;
  Kulkul({
    this.names,
    this.numbers,
    this.rawMaterials,
    this.dimensions,
    this.pengangges,
    this.directions,
    this.image,
    this.imageGallery,
    this.location,
  });

  Map<String, dynamic> toMap() {
    return {
      'names': names,
      'numbers': numbers,
      'rawMaterials': rawMaterials,
      'dimensions': dimensions,
      'pengangges': pengangges,
      'directions': directions,
      'image': image,
      'imageGallery': imageGallery,
      'location': location,
    };
  }

  factory Kulkul.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Kulkul(
      names: List<String>.from(map['names']),
      numbers: List<int>.from(map['numbers']),
      rawMaterials: List<String>.from(map['rawMaterials']),
      dimensions: List<String>.from(map['dimensions']),
      pengangges: List<String>.from(map['pengangges']),
      directions: List<String>.from(map['directions']),
      image: map['image'],
      imageGallery: List<String>.from(map['imageGallery']),
      location: map['location'],
    );
  }

  String toJson() => json.encode(toMap());
}

class KulkulDesa {
  Kulkul kulkul;
  List<Banjar> banjars;
  KulkulDesa({
    this.kulkul,
    this.banjars,
  });

  Map<String, dynamic> toMap() {
    return {
      'kulkul': kulkul?.toMap(),
      'banjars': banjars?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory KulkulDesa.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return KulkulDesa(
      kulkul: Kulkul.fromMap(map['kulkul']),
      banjars: List<Banjar>.from(map['banjars']?.map((x) => Banjar.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());
}
