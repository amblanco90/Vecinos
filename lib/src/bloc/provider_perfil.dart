
import 'package:edificion247/src/bloc/perfil_bloc.dart';
import 'package:flutter/widgets.dart';

class ProviderPerfil extends InheritedWidget{

final perfil=PerfilBloc();  
ProviderPerfil({Key key, Widget child})
    :super(key:key,child:child);
    
  @override
  bool updateShouldNotify(InheritedWidget oldWidget)=> true;
 
 static PerfilBloc of (BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<ProviderPerfil>().perfil;
  }
}