import 'dart:convert';

import 'dart:io';

class PopulateKulkul {
    PopulateKulkul({
        this.number,
        this.pengangge,
        this.rawMaterials,
        this.dimensions,
        this.direction,
        this.images,
        this.sounds,
    });

    String number;
    ItemLang pengangge;
    List<ItemLang> rawMaterials;
    List<String> dimensions;
    String direction;
    List<File> images;
    List<Sound> sounds;

    factory PopulateKulkul.fromJson(String str) => PopulateKulkul.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PopulateKulkul.fromMap(Map<String, dynamic> json) => PopulateKulkul(
        number: json["number"] == null ? null : json["number"],
        pengangge: json["pengangge"] == null ? null : ItemLang.fromMap(json["pengangge"]),
        rawMaterials: json["rawMaterials"] == null ? null : List<ItemLang>.from(json["rawMaterials"].map((x) => ItemLang.fromMap(x))),
        dimensions: json["dimensions"] == null ? null : List<String>.from(json["dimensions"].map((x) => x)),
        direction: json["direction"] == null ? null : json["direction"],
        images: json["images"] == null ? null : List<File>.from(json["images"].map((x) => x)),
        sounds: json["sounds"] == null ? null : List<Sound>.from(json["sounds"].map((x) => Sound.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "number": number == null ? null : number,
        "pengangge": pengangge == null ? null : pengangge.toMap(),
        "rawMaterials": rawMaterials == null ? null : List<dynamic>.from(rawMaterials.map((x) => x.toMap())),
        "dimensions": dimensions == null ? null : List<dynamic>.from(dimensions.map((x) => x)),
        "direction": direction == null ? null : direction,
        "images": images == null ? null : List<dynamic>.from(images.map((x) => x)),
        "sounds": sounds == null ? null : List<dynamic>.from(sounds.map((x) => x.toMap())),
    };
}

class ItemLang {
    ItemLang({
        this.name,
        this.lang,
    });

    String name;
    String lang;

    factory ItemLang.fromJson(String str) => ItemLang.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ItemLang.fromMap(Map<String, dynamic> json) => ItemLang(
        name: json["name"] == null ? null : json["name"],
        lang: json["lang"] == null ? null : json["lang"],
    );

    Map<String, dynamic> toMap() => {
        "name": name == null ? null : name,
        "lang": lang == null ? null : lang,
    };
}

class Sound {
    Sound({
        this.name,
        this.activities,
        this.file,
        this.type,
    });

    String name;
    List<Activity> activities;
    File file;
    String type;

    factory Sound.fromJson(String str) => Sound.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Sound.fromMap(Map<String, dynamic> json) => Sound(
        name: json["name"] == null ? null : json["name"],
        activities: json["activities"] == null ? null : List<Activity>.from(json["activities"].map((x) => Activity.fromMap(x))),
        file: json["file"] == null ? null : json["file"],
        type: json["type"] == null ? null : json["type"],
    );

    Map<String, dynamic> toMap() => {
        "name": name == null ? null : name,
        "activities": activities == null ? null : List<dynamic>.from(activities.map((x) => x.toMap())),
        "file": file == null ? null : file,
        "type": type == null ? null : type,
    };
}

class Activity {
    Activity({
        this.name,
        this.group,
        this.lang,
    });

    String name;
    String group;
    String lang;

    factory Activity.fromJson(String str) => Activity.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Activity.fromMap(Map<String, dynamic> json) => Activity(
        name: json["name"] == null ? null : json["name"],
        group: json["group"] == null ? null : json["group"],
        lang: json["lang"] == null ? null : json["lang"],
    );

    Map<String, dynamic> toMap() => {
        "name": name == null ? null : name,
        "group": group == null ? null : group,
        "lang": lang == null ? null : lang,
    };
}
