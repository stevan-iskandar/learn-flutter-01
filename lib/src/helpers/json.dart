import 'dart:convert';

Map<String, dynamic> parseJSON(dynamic data) {
  if (data is String) {
    return jsonDecode(data);
  }
  return data;
}
