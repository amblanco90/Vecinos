
import 'package:edificion247/src/bloc/visita_bloc.dart';
import 'package:flutter/widgets.dart';

class ProviderVisitas extends InheritedWidget{

final visitas=VisitasBloc();  
ProviderVisitas({Key key, Widget child})
    :super(key:key,child:child);
    
  @override
  bool updateShouldNotify(InheritedWidget oldWidget)=> true;
 
 static VisitasBloc of (BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<ProviderVisitas>().visitas;
  }
}