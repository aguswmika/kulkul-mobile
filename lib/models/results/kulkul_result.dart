import 'dart:convert';

import 'package:semantic_kulkul/models/kulkul_model.dart';

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
