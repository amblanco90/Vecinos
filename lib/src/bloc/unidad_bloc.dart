
import 'package:edificion247/src/bloc/validator.dart';
import 'package:rxdart/rxdart.dart';

class UnidadBloc with Validator{
  final _nombreUnidadController=BehaviorSubject<String>();
  final _ciudadUnidadController=BehaviorSubject<String>();
  final _barrioUnidadController=BehaviorSubject<String>();

  Stream<String> get nombreUnidadStrean =>_nombreUnidadController.transform(validatorNombreUnidad);
  Stream<String> get ciudadUnidadStrean =>_ciudadUnidadController.transform(validatorCiudadUnidad);
  Stream<String> get barrioUnidadStrean =>_barrioUnidadController.transform(validatorBarriodUnidad);

  Function (String) get changeNombreUnidad => _nombreUnidadController.sink.add;
  Function (String) get changeCiudadUnidad => _ciudadUnidadController.sink.add;
  Function (String) get changeBarrioUnidad => _barrioUnidadController.sink.add;
}