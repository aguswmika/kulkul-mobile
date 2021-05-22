import 'dart:convert';

import 'package:semantic_kulkul/models/location_model.dart';

class Kulkul {
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
    this.sounds,
  });

  List<Property> names;
  List<Property> numbers;
  List<Property> rawMaterials;
  List<Property> dimensions;
  List<Property> pengangges;
  List<Property> directions;
  String image;
  List<String> imageGallery;
  String location;
  List<Sound> sounds;

  factory Kulkul.fromJson(String str) => Kulkul.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Kulkul.fromMap(Map<String, dynamic> json) => Kulkul(
        names: json["names"] == null
            ? null
            : List<Property>.from(
                json["names"].map((x) => Property.fromMap(x))),
        numbers: json["numbers"] == null
            ? null
            : List<Property>.from(
                json["numbers"].map((x) => Property.fromMap(x))),
        rawMaterials: json["rawMaterials"] == null
            ? null
            : List<Property>.from(
                json["rawMaterials"].map((x) => Property.fromMap(x))),
        dimensions: json["dimensions"] == null
            ? null
            : List<Property>.from(
                json["dimensions"].map((x) => Property.fromMap(x))),
        pengangges: json["pengangges"] == null
            ? null
            : List<Property>.from(
                json["pengangges"].map((x) => Property.fromMap(x))),
        directions: json["directions"] == null ? null : List<Property>.from(json["directions"].map((x) => Property.fromMap(x))),
        image: json["image"] == null ? null : json["image"],
        imageGallery: json["imageGallery"] == null
            ? null
            : List<String>.from(json["imageGallery"].map((x) => x)),
        location: json["location"] == null ? null : json["location"],
        sounds: json["sounds"] == null ? null : List<Sound>.from(json["sounds"].map((x) => Sound.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "names": names == null
            ? null
            : List<dynamic>.from(names.map((x) => x.toMap())),
        "numbers": numbers == null
            ? null
            : List<dynamic>.from(numbers.map((x) => x.toMap())),
        "rawMaterials": rawMaterials == null
            ? null
            : List<dynamic>.from(rawMaterials.map((x) => x.toMap())),
        "dimensions": dimensions == null
            ? null
            : List<dynamic>.from(dimensions.map((x) => x.toMap())),
        "pengangges": pengangges == null
            ? null
            : List<dynamic>.from(pengangges.map((x) => x.toMap())),
        "directions": directions == null
            ? null
            : List<dynamic>.from(directions.map((x) => x)),
        "image": image == null ? null : image,
        "imageGallery": imageGallery == null
            ? null
            : List<dynamic>.from(imageGallery.map((x) => x)),
        "location": location == null ? null : location,
        "sounds": sounds == null ? null : List<dynamic>.from(sounds.map((x) => x.toMap())),
      };
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
      kulkul: map['kulkul'] == null ? null : Kulkul.fromMap(map['kulkul']),
      banjars: map['banjars'] == null
          ? null
          : List<Banjar>.from(map['banjars']?.map((x) => Banjar.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());
}

class Property {
  Property({
    this.id,
    this.value,
  });

  String id;
  String value;

  factory Property.fromJson(String str) => Property.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Property.fromMap(Map<String, dynamic> json) => Property(
        id: json["id"] == null ? null : json["id"],
        value: json["value"] == null ? null : json["value"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "value": value == null ? null : value,
      };
}

class Sound {
    Sound({
        this.activity,
        this.sound,
        this.type,
        this.file,
    });

    Property activity;
    String sound;
    String type;
    String file;

    factory Sound.fromJson(String str) => Sound.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Sound.fromMap(Map<String, dynamic> json) => Sound(
        activity: json["activity"] == null ? null : Property.fromMap(json["activity"]),
        sound: json["sound"] == null ? null : json["sound"],
        type: json["type"] == null ? null : json["type"],
        file: json["file"] == null ? null : json["file"],
    );

    Map<String, dynamic> toMap() => {
        "activity": activity == null ? null : activity.toMap(),
        "sound": sound == null ? null : sound,
        "type": type == null ? null : type,
        "file": file == null ? null : file,
    };
}

class KulkulPura {
    KulkulPura({
        this.puraDesa,
        this.puraPuseh,
        this.puraDalem,
    });

    Kulkul puraDesa;
    Kulkul puraPuseh;
    Kulkul puraDalem;

    factory KulkulPura.fromJson(String str) => KulkulPura.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory KulkulPura.fromMap(Map<String, dynamic> json) => KulkulPura(
        puraDesa: json["puraDesa"] == null ? null : Kulkul.fromMap(json["puraDesa"]),
        puraPuseh: json["puraPuseh"] == null ? null : Kulkul.fromMap(json["puraPuseh"]),
        puraDalem: json["puraDalem"] == null ? null : Kulkul.fromMap(json["puraDalem"]),
    );

    Map<String, dynamic> toMap() => {
        "puraDesa": puraDesa == null ? null : puraDesa.toMap(),
        "puraPuseh": puraPuseh == null ? null : puraPuseh.toMap(),
        "puraDalem": puraDalem == null ? null : puraDalem.toMap(),
    };
}