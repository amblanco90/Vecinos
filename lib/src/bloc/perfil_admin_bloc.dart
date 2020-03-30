
import 'package:edificion247/src/bloc/validator.dart';
import 'package:rxdart/rxdart.dart';

class PerfilAdminBloc with Validator{

  final _nombrePerfilAController=BehaviorSubject<String>();
  final _apellidoPerfilAController=BehaviorSubject<String>();
  final _telefonoPerfilAController=BehaviorSubject<String>();
  final _idPerfilAController=BehaviorSubject<String>();
  final _direccionPerfilAController=BehaviorSubject<String>();
  final _correoPerfilAController=BehaviorSubject<String>();
  final _estadoPerfilAController=BehaviorSubject<String>();

  Stream<String> get nombrePerfilAStream => _nombrePerfilAController.stream.transform(validatorNombrePerfil);
  Stream<String> get apellidoPerfilAStream => _apellidoPerfilAController.stream.transform(validatorApellidoPerfil);
  Stream<String> get telefonoPerfilAStream => _telefonoPerfilAController.stream.transform(validatorTelefonoPerfil);
  Stream<String> get idPerfilAStream => _idPerfilAController.stream.transform(validatorNombrePerfil);
  Stream<String> get direccionPerfilAStream => _direccionPerfilAController.stream.transform(validatorApellidoPerfil);
  Stream<String> get correoPerfilAStream => _correoPerfilAController.stream.transform(validatorTelefonoPerfil);
  Stream<String> get estadoPerfilAStream => _estadoPerfilAController.stream.transform(validatorTelefonoPerfil);

  Function (String) get changeNombrePerfil =>_nombrePerfilAController.sink.add;
  Function (String) get changeApellidoPerfil => _apellidoPerfilAController.sink.add;
  Function (String) get changeTelefonoPerfil => _telefonoPerfilAController.sink.add;
  Function (String) get changedireccionPerfil =>_direccionPerfilAController.sink.add;
  Function (String) get changetelefonoPerfil => _telefonoPerfilAController.sink.add;
  Function (String) get changecorreoPerfil => _correoPerfilAController.sink.add;
  Function (String) get changeestadoPerfil => _estadoPerfilAController.sink.add;

}