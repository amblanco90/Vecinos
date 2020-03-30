
import 'package:edificion247/src/bloc/validator.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';


class VisitasBloc with Validator{
  final _cedulaVisitaController=BehaviorSubject<String>();
  final _nombreVisitaController=BehaviorSubject<String>();
  final _placaVisitanteController=BehaviorSubject<String>();
  final _observacionVisitaController=BehaviorSubject<String>();

  Stream<String> get cedulaVisitaStream => _cedulaVisitaController.stream.transform(validatorCedulaVisita);
  Stream<String> get nombreVisitaStream => _nombreVisitaController.stream.transform(validatorNombreVisita);
  Stream<String> get placaVisitaStream => _placaVisitanteController.stream.transform(validatorPlacaVisita);
  Stream<String> get observacionVisitaStream => _observacionVisitaController.stream.transform(validatorObservacionVisita);

  Stream<bool> get formularioVisitaStream=>  CombineLatestStream.combine2(cedulaVisitaStream, nombreVisitaStream, (e,p)=>true);

  Function (String) get  changeCedulaVisita => _cedulaVisitaController.sink.add;
  Function (String) get  changeNombreVisita => _nombreVisitaController.sink.add;
  Function (String) get  changePlacaVisita => _placaVisitanteController.sink.add;
  Function (String) get  changeObservacionVisita => _observacionVisitaController.sink.add;

  dipose(){
    _cedulaVisitaController?.close();
    _nombreVisitaController?.close();
  }
  
}