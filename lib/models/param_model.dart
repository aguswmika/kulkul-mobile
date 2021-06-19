import 'dart:convert';

class Output {
  Output({
    this.id,
    this.value,
  });

  String id;
  String value;

  factory Output.fromJson(String str) => Output.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Output.fromMap(Map<String, dynamic> json) => Output(
        id: json["id"],
        value: json["value"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "value": value,
      };
}

class Filter {
  Filter({
    this.id,
    this.category,
    this.value,
    this.status,
    this.label,
  });

  String id;
  String category;
  String value;
  bool status;
  String label;

  factory Filter.fromJson(String str) => Filter.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Filter.fromMap(Map<String, dynamic> json) => Filter(
      id: json["id"],
      category: json["category"],
      value: json["value"],
      status: false,
      label: '${json["category"][0].toUpperCase()}${json["category"].substring(1)} - ${json["value"]}');

  Map<String, dynamic> toMap() => {
        "id": id,
        "category": category,
        "value": value,
        "status": status,
        "label": label
      };
}

class Param {
  List<Output> output;
  List<Filter> filter;
  Param({
    this.output,
    this.filter,
  });

  Map<String, dynamic> toMap() {
    return {
      'output': output?.map((x) => x?.toMap())?.toList(),
      'filter': filter?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory Param.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Param(
      output: List<Output>.from(map['output']?.map((x) => Output.fromMap(x))),
      filter: List<Filter>.from(map['filter']?.map((x) => Filter.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());
}

class Search {
  Search({
    this.id,
    this.value,
  });

  String id;
  String value;

  factory Search.fromJson(String str) => Search.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Search.fromMap(Map<String, dynamic> json) => Search(
        id: json["id"],
        value: json["value"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "value": value,
      };
}

