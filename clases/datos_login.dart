class DatosLogin{
  final String email;
  final String password;
  DatosLogin({this.email,this.password});

   // Convierte en un Map. Las llaves deben corresponder con los nombres de las 
  // columnas en la base de datos.
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password
    };
  }

}