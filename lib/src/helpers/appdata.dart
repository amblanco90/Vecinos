import 'dart:typed_data';

class AppData {
  static final AppData _appData = new AppData._internal();
  
  String hora_inicial_reserva;
  String hora_final_reserva;
  String fecha_inicial_reserva;
  String fecha_final_reserva;

  String hora_inicio_lunes ='Inicio';
  String hora_final_lunes = 'Fin';

  String hora_inicio_martes='Inicio';
  String hora_final_martes= 'Fin';

  String hora_inicio_miercoles='Inicio';
  String hora_final_miercoles= 'Fin';

  String hora_inicio_jueves='Inicio';
  String hora_final_jueves= 'Fin';

  String hora_inicio_viernes='Inicio';
  String hora_final_viernes= 'Fin';

  String hora_inicio_sabado='Inicio';
  String hora_final_sabado= 'Fin';

  String hora_inicio_domingo='Inicio';
  String hora_final_domingo= 'Fin';

  int idNuevoResidente;
  int idEstadoNuevoResidente=1;
  String estado_nuevo_residente='Activo';

  int tipo_zona = 1 ;
  String tipo_zona_string='Piscina';
  int estado_zona = 1;
  String estado_zona_string='Activo';
  int idZonaSocial;

  List<DateTime> fechasReservas;

  int idUsuario;
  int idSubunidad;
  int estado;
  int cedula;
  String nombre;
  String apellido;
  Uint8List fotoPerfil;
  String encodedFotoPerfil ='';

  String rol = 'Residente';
  factory AppData() {
    return _appData;
  }
  AppData._internal();
}
final appData = AppData();