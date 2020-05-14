import 'package:edificion247/src/helpers/appdata.dart';
import 'package:flutter/material.dart';

class DropdownWidget extends StatefulWidget {
  DropdownWidget({Key key}) : super(key: key);

  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

String dropdownStr = 'Unidad 1';

class _DropdownWidgetState extends State<DropdownWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.0,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          layoutBehavior: ButtonBarLayoutBehavior.constrained,
          child: DropdownButton(
              isExpanded: true,
              isDense: true,
              style: TextStyle(color: Colors.white),
              focusColor: Colors.white,
              iconDisabledColor: Colors.white,
              iconEnabledColor: Color.fromRGBO(177, 79, 0, 1.0),
              icon: Icon(
                Icons.arrow_drop_down,
                size: 30.0,
              ),
              value: dropdownStr,
              onChanged: (String newValue) {
                setState(() {
                  dropdownStr = newValue;
                  appData.rol = newValue;
                  print(appData.rol);
                });
              },
              items: <String>['Unidad 1', 'Unidad 2', 'Unidad 3']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Container(
                    child: Text(
                      value,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontFamily: 'CenturyGothic'),
                      textAlign: TextAlign.center,
                    ),
                    color: Color.fromRGBO(255, 114, 0, 0.9),
                  ),
                );
              }).toList()),
        ),
      ),
    );
  }
}

class DropDownSidebar extends StatefulWidget {
  final  data;

  const DropDownSidebar ({ Key key, this.data }): super(key: key);
  
  
  @override
  
  _DropDownSidebarState createState() => _DropDownSidebarState();
  
}

class _DropDownSidebarState extends State<DropDownSidebar> {

  String _mySelection ;
  List<Map> _myJson = appData.unidades;

  
  @override

  
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: ButtonTheme(
        layoutBehavior: ButtonBarLayoutBehavior.constrained,
        child: DropdownButton(
            isExpanded: true,
            hint:Center(
              child: Text(
                       appData.nombreSubUnidad,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                            fontFamily: 'CenturyGothic'),
                        textAlign: TextAlign.center,
                      ),
            ),
            isDense: true,
            style: TextStyle(color: Colors.white),
            focusColor: Colors.white,
            iconDisabledColor: Colors.white,
            iconEnabledColor: Color.fromRGBO(177, 79, 0, 1.0),
            value: _mySelection,
            icon: Icon(
              Icons.arrow_drop_down,
              size: 30.0,
              color: Colors.white,
            ),
            onChanged: (String newValue) {
              
             
               setState(() {
                _mySelection = newValue;
                appData.idSubunidad=int.parse(newValue);
                for (var item in appData.unidades) {

                  if(appData.idSubunidad==item["id_subunidad"]){
                    appData.saldo=item["saldo"];
                    appData.nombreSubUnidad= item["nombre_subunidad"];
                    appData.tipoUnidad=item["nombre_tipo_unidad"];
                    print(appData.saldo);
                    print(appData.tipoUnidad);
                  }
                  
                }
                

                print(newValue);
                
              });
              widget.data();
            },
            items:_myJson.map((Map map)  {
              return DropdownMenuItem<String>(
                value: map["id_subunidad"].toString(),
                child: Center(
                  child: Container(
                    child: Text(
                     map["nombre_subunidad"],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontFamily: 'CenturyGothic'),
                      textAlign: TextAlign.center,
                    ),
                    color: Color.fromRGBO(255, 114, 0, 0.9),
                  ),
                ),
              );
            }).toList()),
      ),
    );
  }
}

class DropDownZonaPqr extends StatefulWidget {
  DropDownZonaPqr({Key key}) : super(key: key);

  @override
  _DropDownZonaPqrState createState() => _DropDownZonaPqrState();
}

String dropdownPqr = 'CASA';

class _DropDownZonaPqrState extends State<DropDownZonaPqr> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.0),
        color: Colors.grey.shade200,
      ),
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            focusColor: Color.fromRGBO(205, 105, 55, 1.0),
            iconEnabledColor: Color.fromRGBO(205, 105, 55, 1.0),
            isExpanded: true,
            icon: Icon(Icons.arrow_drop_down, color: Colors.orange),
            value: dropdownPqr,
            onChanged: (String newValue) {
              dropdownPqr = newValue;
              if (newValue == 'CASA') {
                appData.tipo_pqr = 2;
              } else if (newValue == 'ZONA') {
                appData.tipo_pqr = 1;
              } else if (newValue == 'UNIDAD GENERAL') {
                appData.tipo_pqr = 3;
              } else if (newValue == 'OTRO') {
                appData.tipo_pqr = 4;
              }
              setState(() {});
            },
            items: <String>['CASA', 'UNIDAD GENERAL', 'OTRO', 'ZONA']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(
                      fontSize: 13.0,
                      fontFamily: 'CenturyGothic',
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.bold),
                ),
              );
            }).toList()),
      ),
    );
  }
}

class DropDownDestinoPqr extends StatefulWidget {
  DropDownDestinoPqr({Key key}) : super(key: key);

  @override
  _DropDownDestinoPqrState createState() => _DropDownDestinoPqrState();
}

String dropdownDestinoPqr = 'ADMINISTRADOR';

class _DropDownDestinoPqrState extends State<DropDownDestinoPqr> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.0),
        color: Colors.grey.shade200,
      ),
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            focusColor: Color.fromRGBO(205, 105, 55, 1.0),
            iconEnabledColor: Color.fromRGBO(205, 105, 55, 1.0),
            isExpanded: true,
            icon: Icon(Icons.arrow_drop_down, color: Colors.orange),
            value: dropdownDestinoPqr,
            onChanged: (String newValue) {
              dropdownDestinoPqr = newValue;
              if (newValue == 'ADMINISTRADOR') {
                appData.dirigido_a = 1;
              } else if (newValue == 'JUNTA DIRECTIVA') {
                appData.dirigido_a = 2;
              } else if (newValue == 'TODOS') {
                appData.dirigido_a = 3;
              }
              setState(() {});
            },
            items: <String>['ADMINISTRADOR', 'JUNTA DIRECTIVA', 'TODOS']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(
                      fontSize: 13.0,
                      fontFamily: 'CenturyGothic',
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.bold),
                ),
              );
            }).toList()),
      ),
    );
  }
}

class DropDownZonaSocialAdmin extends StatefulWidget {
  DropDownZonaSocialAdmin({Key key}) : super(key: key);

  @override
  _DropDownZonaSocialAdminState createState() =>
      _DropDownZonaSocialAdminState();
}

String dropdownZonaStr = 'Activo';

class _DropDownZonaSocialAdminState extends State<DropDownZonaSocialAdmin> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: DropdownButton(
          focusColor: Color.fromRGBO(205, 105, 55, 1.0),
          iconEnabledColor: Color.fromRGBO(205, 105, 55, 1.0),
          value: appData.estado_zona_string,
          onChanged: (String newValue) {
            setState(() {
              appData.estado_zona_string = newValue;
              if (newValue == 'Activo') {
                appData.estado_zona = 1;
              } else {
                appData.estado_zona = 2;
              }
            });
          },
          items: <String>['Activo', 'Inactivo']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'CenturyGothic',
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.bold),
              ),
            );
          }).toList()),
    ));
  }
}

class EstadoNuevoResidente extends StatefulWidget {
  EstadoNuevoResidente({Key key}) : super(key: key);

  @override
  _EstadoNuevoResidenteState createState() => _EstadoNuevoResidenteState();
}

class _EstadoNuevoResidenteState extends State<EstadoNuevoResidente> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: DropdownButton(
          focusColor: Color.fromRGBO(205, 105, 55, 1.0),
          iconEnabledColor: Color.fromRGBO(205, 105, 55, 1.0),
          value: appData.estado_nuevo_residente,
          onChanged: (String newValue) {
            setState(() {
              appData.estado_nuevo_residente = newValue;
              if (newValue == 'Activo') {
                appData.idEstadoNuevoResidente = 1;
              } else {
                appData.idEstadoNuevoResidente = 0;
              }
            });
          },
          items: <String>['Activo', 'Inactivo']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'CenturyGothic',
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.bold),
              ),
            );
          }).toList()),
    ));
  }
}

class DropDownZonasAdmin extends StatefulWidget {
  DropDownZonasAdmin({Key key}) : super(key: key);

  @override
  _DropDownZonasAdminState createState() => _DropDownZonasAdminState();
}

String dropdownZona = 'Piscina';

class _DropDownZonasAdminState extends State<DropDownZonasAdmin> {
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: DropdownButton(
          focusColor: Color.fromRGBO(205, 105, 55, 1.0),
          iconEnabledColor: Color.fromRGBO(205, 105, 55, 1.0),
          value: appData.tipo_zona_string,
          onChanged: (String newValue) {
            setState(() {
              appData.tipo_zona_string = newValue;
              if (newValue == 'Piscina') {
                appData.tipo_zona = 1;
              } else if (newValue == 'Salón') {
                appData.tipo_zona = 2;
              } else if (newValue == 'Gimnasio') {
                appData.tipo_zona = 3;
              }
            });
          },
          items: <String>['Piscina', 'Salón', 'Gimnasio']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'CenturyGothic',
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.bold),
              ),
            );
          }).toList()),
    ));
  }
}

class DropDownLugarReservaWidget extends StatefulWidget {
  DropDownLugarReservaWidget({Key key}) : super(key: key);

  @override
  _DropDownLugarReservaWidgetState createState() =>
      _DropDownLugarReservaWidgetState();
}

String dropdownStrLugar = 'ZONA SOCIAL';

class _DropDownLugarReservaWidgetState
    extends State<DropDownLugarReservaWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            icon: Icon(Icons.arrow_drop_down, color: Colors.orange),
            value: dropdownStrLugar,
            onChanged: (String newValue) {
              setState(() {
                dropdownStrLugar = newValue;
              });
            },
            items: <String>[
              'ZONA SOCIAL',
              'Piscina',
              'Salon social',
              'Gimnasio',
              'Otro'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'CenturyGothic',
                      fontWeight: FontWeight.bold),
                ),
              );
            }).toList()),
      ),
    ));
  }
}

class DropdownWidgetEmergencia extends StatefulWidget {
  DropdownWidgetEmergencia({Key key}) : super(key: key);

  @override
  _DropdownWidgetEmergenciaState createState() =>
      _DropdownWidgetEmergenciaState();
}

String dropdown = 'Incendio';

class _DropdownWidgetEmergenciaState extends State<DropdownWidgetEmergencia> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.0,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          layoutBehavior: ButtonBarLayoutBehavior.constrained,
          child: DropdownButton(
              isExpanded: true,
              isDense: true,
              focusColor: Colors.white,
              iconDisabledColor: Colors.white,
              iconEnabledColor: Color.fromRGBO(177, 79, 0, 1.0),
              icon: Icon(
                Icons.arrow_drop_down,
                size: 30.0,
              ),
              value: dropdown,
              onChanged: (String newValue) {
                setState(() {
                  dropdown = newValue;
                  appData.emergencia = newValue;
                });
              },
              items: <String>[
                'Incendio',
                'Inundación',
                'Emergencia familiar',
                'Fuga de gas',
                'Robo',
                'Otro'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Container(
                    child: Text(
                      value,
                      style: TextStyle(
                          fontSize: 16.0, fontFamily: 'CenturyGothic'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }).toList()),
        ),
      ),
    );
  }
}
