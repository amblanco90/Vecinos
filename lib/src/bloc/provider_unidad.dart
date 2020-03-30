
import 'package:edificion247/src/bloc/unidad_bloc.dart';
import 'package:flutter/widgets.dart';

class ProviderUnidad extends InheritedWidget{

final unidad=UnidadBloc();  
ProviderUnidad({Key key, Widget child})
    :super(key:key,child:child);
    
  @override
  bool updateShouldNotify(InheritedWidget oldWidget)=> true;
 
 static UnidadBloc of (BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<ProviderUnidad>().unidad;
  }
}