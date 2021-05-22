import 'dart:convert';

class Location {
  final String id;
  final String name;
  final List<Kecamatan> kecamatan;
  Location({
    this.id,
    this.name,
    this.kecamatan,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'kecamatan': kecamatan?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Location(
      id: map['id'],
      name: map['name'],
      kecamatan: List<Kecamatan>.from(
          map['kecamatan']?.map((x) => Kecamatan.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());
}

class Kecamatan {
  final String id;
  final String name;
  final String image;
  Kecamatan({
    this.id,
    this.name,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory Kecamatan.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Kecamatan(
      id: map['id'],
      name: map['name'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());
}

class Desa {
  final String id;
  final String name;
  final String image;
  Desa({
    this.id,
    this.name,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory Desa.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Desa(
      id: map['id'],
      name: map['name'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());
}

class Banjar {
  final String id;
  final String name;
  final String image;
  Banjar({
    this.id,
    this.name,
    this.image,
  });
  

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory Banjar.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Banjar(
      id: map['id'],
      name: map['name'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());
}

class LocationList {
    LocationList({
        this.title,
        this.kabupaten,
    });

    String title;
    List<Kabupaten> kabupaten;

    factory LocationList.fromJson(String str) => LocationList.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory LocationList.fromMap(Map<String, dynamic> json) => LocationList(
        title: json["title"] == null ? null : json["title"],
        kabupaten: json["kabupaten"] == null ? null : List<Kabupaten>.from(json["kabupaten"].map((x) => Kabupaten.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "title": title == null ? null : title,
        "kabupaten": kabupaten == null ? null : List<dynamic>.from(kabupaten.map((x) => x.toMap())),
    };
}

class Kabupaten {
    Kabupaten({
        this.title,
        this.kulkulList,
    });

    String title;
    List<KulkulList> kulkulList;

    factory Kabupaten.fromJson(String str) => Kabupaten.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Kabupaten.fromMap(Map<String, dynamic> json) => Kabupaten(
        title: json["title"] == null ? null : json["title"],
        kulkulList: json["kulkulList"] == null ? null : List<KulkulList>.from(json["kulkulList"].map((x) => KulkulList.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "title": title == null ? null : title,
        "kulkulList": kulkulList == null ? null : List<dynamic>.from(kulkulList.map((x) => x.toMap())),
    };
}

class KulkulList {
    KulkulList({
        this.id,
        this.value,
        this.type,
    });

    String id;
    String value;
    String type;

    factory KulkulList.fromJson(String str) => KulkulList.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory KulkulList.fromMap(Map<String, dynamic> json) => KulkulList(
        id: json["id"] == null ? null : json["id"],
        value: json["value"] == null ? null : json["value"],
        type: json["type"] == null ? null : json["type"],
    );

    Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "value": value == null ? null : value,
        "type": type == null ? null : type,
    };
}
