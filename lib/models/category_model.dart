import 'dart:convert';

class Category {
  final String id;
  final String nama;
  List<Category> child;
  Category({this.id, this.nama, this.child});

  void appendChild(List<Category> child) {
    this.child = child;
  }

  Map<String, dynamic> toMap() {
    if (child == null) {
      return {'id': id, 'nama': nama};
    }
    return {
      'id': id,
      'nama': nama,
      'child': child?.map((x) => x?.toMap())?.toList()
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    if (map['child'] == null) {
      return Category(id: map['id'], nama: map['nama']);
    }

    return Category(
        id: map['id'],
        nama: map['nama'],
        child: List<Category>.from(
            map['child']?.map((x) => Category.fromMap(x))));
  }

  String toJson() => json.encode(toMap());
}