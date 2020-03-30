
import 'package:edificion247/src/bloc/perfil_admin_bloc.dart';
import 'package:flutter/widgets.dart';


class ProviderPerfilAdmin extends InheritedWidget{

final perfil=PerfilAdminBloc();  
ProviderPerfilAdmin({Key key, Widget child})
    :super(key:key,child:child);
    
  @override
  bool updateShouldNotify(InheritedWidget oldWidget)=> true;
 
 static PerfilAdminBloc of (BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<ProviderPerfilAdmin>().perfil;
  }
}