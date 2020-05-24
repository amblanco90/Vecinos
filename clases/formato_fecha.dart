class FormatoDate{
  DateTime corregir_fecha(String fecha){
    var dia=fecha.substring(0,1);
    var mes=fecha.substring(3,4);
    var anos=fecha.substring(6,9);
    var fechar_corregida="${anos}-${mes}-${dia}";
    return DateTime.parse(fechar_corregida);

  }
}