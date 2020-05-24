import 'package:edificion247/src/helpers/appdata.dart';
import 'package:flutter/material.dart';


class NormalForm extends StatelessWidget {

  
  
  final String hint;
  final  TextEditingController control;

  NormalForm(this.hint, this.control);

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      onChanged: (String val){
         appData.emergencia = val;
      },
      controller: control,
      style:
      TextStyle(fontFamily: "nunito",
          fontWeight: FontWeight.w500, color: Colors.grey.shade700, fontSize: 15.5),
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade100,
         
          
          hintText: hint,
          
          hintStyle:  TextStyle(fontFamily: "CenturyGothic",
              fontWeight: FontWeight.w500, color: Colors.grey.shade700, fontSize: 15.5),
          contentPadding:
          const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
          focusColor: Colors.grey.shade700,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(15.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(15.0),
          )),
    );
  }



}

