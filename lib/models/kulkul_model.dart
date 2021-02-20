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

class KulkulResult {
  final String status;
  String message;
  List<Kulkul> data;
  KulkulResult({
    this.status,
    this.message,
    this.data,
  });
  

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'message': message,
      'data': data?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory KulkulResult.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return KulkulResult(
      status: map['status'],
      message: map['message'],
      data: List<Kulkul>.from(map['data']?.map((x) => Kulkul.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());
}

class Kabupaten {
  List<Kulkul> karangasem;
  List<Kulkul> badung;
  List<Kulkul> bangli;
  List<Kulkul> gianyar;
  List<Kulkul> buleleng;
  List<Kulkul> denpasar;
  List<Kulkul> tabanan;
  List<Kulkul> klungkung;
  List<Kulkul> jembrana;
  Kabupaten({
    this.karangasem,
    this.badung,
    this.bangli,
    this.gianyar,
    this.buleleng,
    this.denpasar,
    this.tabanan,
    this.klungkung,
    this.jembrana,
  });

  Map<String, dynamic> toMap() {
    return {
      'karangasem': karangasem?.map((x) => x?.toMap())?.toList(),
      'badung': badung?.map((x) => x?.toMap())?.toList(),
      'bangli': bangli?.map((x) => x?.toMap())?.toList(),
      'gianyar': gianyar?.map((x) => x?.toMap())?.toList(),
      'buleleng': buleleng?.map((x) => x?.toMap())?.toList(),
      'denpasar': denpasar?.map((x) => x?.toMap())?.toList(),
      'tabanan': tabanan?.map((x) => x?.toMap())?.toList(),
      'klungkung': klungkung?.map((x) => x?.toMap())?.toList(),
      'jembrana': jembrana?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory Kabupaten.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Kabupaten(
      karangasem: List<Kulkul>.from(map['karangasem']?.map((x) => Kulkul.fromMap(x))),
      badung: List<Kulkul>.from(map['badung']?.map((x) => Kulkul.fromMap(x))),
      bangli: List<Kulkul>.from(map['bangli']?.map((x) => Kulkul.fromMap(x))),
      gianyar: List<Kulkul>.from(map['gianyar']?.map((x) => Kulkul.fromMap(x))),
      buleleng: List<Kulkul>.from(map['buleleng']?.map((x) => Kulkul.fromMap(x))),
      denpasar: List<Kulkul>.from(map['denpasar']?.map((x) => Kulkul.fromMap(x))),
      tabanan: List<Kulkul>.from(map['tabanan']?.map((x) => Kulkul.fromMap(x))),
      klungkung: List<Kulkul>.from(map['klungkung']?.map((x) => Kulkul.fromMap(x))),
      jembrana: List<Kulkul>.from(map['jembrana']?.map((x) => Kulkul.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());
}

class KulkulResultByKabupaten {
  final String status;
  String message;
  Kabupaten data;
  KulkulResultByKabupaten({
    this.status,
    this.message,
    this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'message': message,
      'data': data?.toMap(),
    };
  }

  factory KulkulResultByKabupaten.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return KulkulResultByKabupaten(
      status: map['status'],
      message: map['message'],
      data: Kabupaten.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());
}
