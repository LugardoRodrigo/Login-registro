import 'package:flutter/material.dart';
import 'package:pruebafirebase/src/page/formulario_page.dart';
import 'package:pruebafirebase/src/page/registro.dart';
import 'package:pruebafirebase/src/page/secondFormPage.dart';

Map<String, WidgetBuilder> obtenerRutas() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => FormPage(),
    'pagina dos': (BuildContext contex) => Paginados(),
    'registrar': (BuildContext context) => Registro(),
  };
}
