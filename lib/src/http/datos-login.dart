import 'dart:convert';
class DatosLogin{
  String username,password;
  DatosLogin({this.username,this.password});

  Map<String, dynamic> toJson() {
    return {"username": username, "password": password};
  }
}

String profileToJsonLogin( DatosLogin data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}