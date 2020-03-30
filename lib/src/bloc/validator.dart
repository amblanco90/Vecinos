import 'dart:async';

class Validator{
  final validatorCedulaVisita=StreamTransformer<String,String>.fromHandlers(
      handleData: (cedula,sink){
        if(cedula.length<6){
          sink.addError('minimo puede ingresar 6 caracter');
        }else if(cedula.length>10){
            sink.addError('maximo puede ingresar 10 caracter');
        }else{
          sink.addError(null);
        }
        
      }
  );

  final validatorNombreVisita=StreamTransformer<String,String>.fromHandlers(
      handleData: (nombre,sink){
        if(nombre.length>50){
          sink.addError('maximo puede ingresar 50 caracter');
        }else{
          sink.addError(null);
        }
        
      }
  );
  final validatorPlacaVisita=StreamTransformer<String,String>.fromHandlers(
    handleData: (placa,sink){
      if(placa.length>10){
          sink.addError('maximo puede ingresar 10 caracter');
      }else{
        sink.addError(null);
      }
    }
  );

  final validatorObservacionVisita=StreamTransformer<String,String>.fromHandlers(
    handleData: (obsevacion,sink){
      if(obsevacion.length>200){
          sink.addError('maximo puede ingresar 200 caracter');
      }else{
        sink.addError(null);
      }
    }
  );

  final validatorNombreUnidad=StreamTransformer<String,String>.fromHandlers(
    handleData: (nombre,sink){
      if(nombre.length>50){
        sink.addError('maximo puede ingresar 50 caracter');
      }else{
        sink.addError(null);
      }
    }
  );

  final validatorCiudadUnidad=StreamTransformer<String,String>.fromHandlers(
    handleData: (ciudad,sink){
      if(ciudad.length>50){
        sink.addError('maximo puede ingresar 50 caracter');
      }else{
        sink.addError(null);
      }
    }
  );

  final validatorBarriodUnidad=StreamTransformer<String,String>.fromHandlers(
    handleData: (barrio,sink){
      if(barrio.length>50){
        sink.addError('maximo puede ingresar 50 caracter');
      }else{
        sink.addError(null);
      }
    }
  );

  final validatorNombrePerfil=StreamTransformer<String,String>.fromHandlers(
    handleData: (nombre,sink){
      if(nombre.length>51){
        sink.addError('maximo puede ingresar 50 caracter');
      }else{
        sink.addError(null);
      }
    }
  );

  final validatorApellidoPerfil=StreamTransformer<String,String>.fromHandlers(
    handleData: (apellido,sink){
      if(apellido.length>50){
        sink.addError('maximo puede ingresar 50 caracter');
      }else{
        sink.addError(null);
      }
    }
  );

  final validatorTelefonoPerfil=StreamTransformer<String,String>.fromHandlers(
    handleData: (telefono,sink){
      if(telefono.length>10){
        sink.addError('maximo puede ingresar 10 caracter');
      }else{
        sink.addError(null);
      }
    }
  );
}