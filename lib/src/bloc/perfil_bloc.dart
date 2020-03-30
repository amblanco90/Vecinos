
import 'package:edificion247/src/bloc/validator.dart';
import 'package:rxdart/rxdart.dart';

class PerfilBloc with Validator{

  final _nombrePerfilController=BehaviorSubject<String>();
  final _apellidoPerfilController=BehaviorSubject<String>();
  final _telefonoPerfilController=BehaviorSubject<String>();

  Stream<String> get nombrePerfilStream=> _nombrePerfilController.stream.transform(validatorNombrePerfil);
  Stream<String> get apellidoPerfilStream=> _apellidoPerfilController.stream.transform(validatorApellidoPerfil);
  Stream<String> get telefonoPerfilStream=> _telefonoPerfilController.stream.transform(validatorTelefonoPerfil);

  Function (String) get changeNombrePerfil =>_nombrePerfilController.sink.add;
  Function (String) get changeApellidoPerfil => _apellidoPerfilController.sink.add;
  Function (String) get changeTelefonoPerfil => _telefonoPerfilController.sink.add;
}