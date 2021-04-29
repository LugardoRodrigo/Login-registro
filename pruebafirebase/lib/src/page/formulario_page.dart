import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  Future<List> _listaUsuarios;
  int o = 0;
  Future<List> _obteneUsuarios(String corre, String contrasen) async {
    String contrasena = contrasen;
    String correo = corre;
    List listaUsuario = [];
    Query crUsuario = FirebaseFirestore.instance
        .collection("usuarios")
        .where('correo', isEqualTo: correo)
        .where('contrasena', isEqualTo: contrasena);
    QuerySnapshot usuarios = await crUsuario.get();
    print("pepepepepepepe::::${usuarios.docs.length}");
    if (usuarios.docs.length != 0) {
      for (var doc in usuarios.docs) {
        listaUsuario.add(doc.data());
        print(doc.data());
        o = 1;
      }
    } else {
      o = 0;
    }
    print(usuarios.docs);
    return listaUsuario;
  }

  FocusNode correoFocus;
  FocusNode contrasenaFocus;

  String correo;
  String contrasena;

  String a = "";
  /* void usu(String corre, String contrasen) async {
    String contrasena = contrasen;
    String correo = corre;

    Query crUsuario = FirebaseFirestore.instance
        .collection("usuarios")
        .where('correo', isEqualTo: correo)
        .where('contrasena', isEqualTo: contrasena);
    QuerySnapshot usuarios = await crUsuario.get();
    print("pepepepepepepe::::${usuarios.docs.length}");
    if (usuarios.docs.length != 0) {
      o = 1;
    } else {
      o = 0;
    }

    print(usuarios.docs);
  }*/

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('LOGINE'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: Image.asset(
                    'images/img.gif',
                    height: 250,
                  ),
                ),
                Text(
                  'Inicia sesion',
                  style: TextStyle(
                      color: Colors.amber,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Correo',
                      hintText: 'Ejemplo@gmail.com',
                      prefixIcon: Icon(Icons.email)),
                  onSaved: (value) {
                    correo = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'LLena el campo';
                    } else {
                      return null;
                    }
                  },
                  focusNode: this.correoFocus,
                  onEditingComplete: () =>
                      requestFocus(context, contrasenaFocus),
                  textInputAction: TextInputAction.next,
                  //autofocus: true
                  //controller: nombreTextController,
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'contraseña',
                      hintText: 'Ejemplo:**********',
                      icon: Icon(Icons.lock)),
                  onSaved: (value) {
                    contrasena = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'campo vacio';
                    } else {
                      return null;
                    }
                  },
                  focusNode: this.contrasenaFocus,
                ),
                SizedBox(
                  height: 10.0,
                ),

                SizedBox(
                  height: 10.0,
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    child: Text('Iniciar sesion'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      _obteneUsuarios(correo, contrasena);

                      print(correo);

                      print("la lista:::${o}");
                      // int u = usu(correo, contrasena);
                      // print("usuarios encontrados:  ${u}");
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();

                        if (o == 1) {
                          Navigator.pushNamed(context, 'pagina dos',
                              arguments: Argumentos(correo: this.correo));
                        } else {
                          print('Datos incorrectos');
                          a = "datos incorrectos";
                        }
                      }
                    }),

                Text(a,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                    )),
                Row(
                  children: [
                    Text('¿Aun no tienes cuenta?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        )),
                    FlatButton(
                      child: Text(
                        'Registrate aqui',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          'registrar',
                        );
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //METODO PARA EL FOCUS
  void requestFocus(BuildContext context, FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
  }

  /*String validarCampo(var value) {
    if (value.isEmpty) {
      return 'Llene ese campo';
    }
  }*/

//INSTANSIAR A FOCUS
  @override
  void initState() {
    super.initState();
    _listaUsuarios = _obteneUsuarios(correo, contrasena);
    correoFocus = FocusNode();
    contrasenaFocus = FocusNode();
    //nombreTextController = TextEditingController();
    //apTextController = TextEditingController();
  }

//ELIMINAR LA INSTANCIA DE FOCUS
  @override
  void dispose() {
    super.dispose();

    contrasenaFocus.dispose();
    correoFocus.dispose();
    // nombreTextController.dispose();
    // apTextController.dispose();
  }
}

class Argumentos {
  String correo;
  String contrasena;

  Argumentos({this.correo, this.contrasena});
}
