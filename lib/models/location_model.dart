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
  final int totalKulkulDesa;
  final int totalKulkulBanjar;
  final String image;
  Kecamatan({
    this.id,
    this.name,
    this.totalKulkulDesa,
    this.totalKulkulBanjar,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'totalKulkulDesa': totalKulkulDesa,
      'totalKulkulBanjar': totalKulkulBanjar,
      'image': image,
    };
  }

  factory Kecamatan.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Kecamatan(
      id: map['id'],
      name: map['name'],
      totalKulkulDesa: map['totalKulkulDesa'],
      totalKulkulBanjar: map['totalKulkulBanjar'],
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
