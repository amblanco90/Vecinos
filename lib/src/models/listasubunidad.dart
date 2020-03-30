class DatosListaSubunidades{
int id;
String nomenclatura; 
String tipoUnidad;
String estadoCuenta;
String propietario;
String residente;
int total;
String estadoUnidad;
String switc;

DatosListaSubunidades({this.id,this.nomenclatura,this.tipoUnidad,this.estadoCuenta,this.estadoUnidad,this.propietario,this.residente,this.total,this.switc});

factory DatosListaSubunidades.fromJson(Map<String, dynamic> json)=> DatosListaSubunidades(
    id: json['id'],
    tipoUnidad: json['tipoUnidad'],
    estadoCuenta: json['estadoCuenta'],
    propietario: json['propietario'],
    residente: json['residente'],
    total: json['total'],
    estadoUnidad: json['estadoUnidad'],
    switc: json['switch'],
    nomenclatura: json['nomenclatura'],
  );
}
class ListaSubunidades {
  List<DatosListaSubunidades> items=new List();
    ListaSubunidades();
     ListaSubunidades.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    print(jsonList.toString());
    for (var item in jsonList) {
      final sububidad = new DatosListaSubunidades.fromJson(item);
      items.add(sububidad);
      
    }
    
    
  }
    }