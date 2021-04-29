import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Registro extends StatefulWidget {
  Registro({Key key}) : super(key: key);

  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  FocusNode nombreFocus;
  FocusNode correoFocus;
  FocusNode contrasenaFocus;
  FocusNode edadFocus;
  FocusNode IdperFocus;

  String nombre;
  String correo;
  String contrasena;
  String edad;
  String Idper;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('REGISTRO'),
        ),
        body: Card(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: Image.asset(
                    'images/7V9.gif',
                    height: 200,
                  ),
                ),

                Text(
                  'Registrate',
                  style: TextStyle(
                      color: Colors.amber,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),

                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'nombre',
                      hintText: 'Andres',
                      prefixIcon: Icon(Icons.person)),
                  onChanged: (value) {
                    nombre = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'LLena el campo';
                    } else {
                      return null;
                    }
                  },
                  focusNode: this.nombreFocus,
                  onEditingComplete: () => requestFocus(context, correoFocus),
                  textInputAction: TextInputAction.next,
                  //autofocus: true
                  //controller: nombreTextController,
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'correo',
                      hintText: 'Ejemplo:correo@gmail.com',
                      prefixIcon: Icon(Icons.email)),
                  onSaved: (value) {
                    correo = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'campo vacio';
                    } else {
                      return null;
                    }
                  },
                  focusNode: this.correoFocus,
                  onEditingComplete: () =>
                      requestFocus(context, contrasenaFocus),
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Contraseña',
                      hintText: 'ejemplo : ********',
                      prefixIcon: Icon(Icons.lock)),
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
                  onEditingComplete: () => requestFocus(context, edadFocus),
                  textInputAction: TextInputAction.next,
                ),

                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Edad',
                      hintText: 'ejemplo : 23',
                      prefixIcon: Icon(Icons.calendar_today)),
                  onSaved: (value) {
                    edad = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'campo vacio';
                    } else {
                      return null;
                    }
                  },
                  focusNode: this.edadFocus,
                  onEditingComplete: () => requestFocus(context, IdperFocus),
                  textInputAction: TextInputAction.next,
                ),

                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'ID para identificarte',
                      hintText: 'ejemplo : montecarlo122',
                      prefixIcon: Icon(Icons.person)),
                  onSaved: (value) {
                    Idper = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'campo vacio';
                    } else {
                      return null;
                    }
                  },
                  focusNode: this.IdperFocus,
                ),

                SizedBox(
                  height: 10.0,
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    child: Text('Registrar usuario'),
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();

                        agregarIdFirebase(
                            Idper, nombre, correo, contrasena, edad);
                        Navigator.pushNamed(context, '/');

                        print(
                          nombre,
                        );
                      }
                    })
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
    nombreFocus = FocusNode();
    correoFocus = FocusNode();
    contrasenaFocus = FocusNode();
    edadFocus = FocusNode();
    IdperFocus = FocusNode();
    //nombreTextController = TextEditingController();
    //apTextController = TextEditingController();
  }

//ELIMINAR LA INSTANCIA DE FOCUS
  @override
  void dispose() {
    super.dispose();
    nombreFocus.dispose();
    contrasenaFocus.dispose();
    correoFocus.dispose();
    edadFocus.dispose();
    IdperFocus.dispose();
    // nombreTextController.dispose();
    // apTextController.dispose();
  }
}

class Argumentos {
  String nombre;
  String correo;
  String contrasena;
  String edad;
  String Idper;

  Argumentos(
      {this.nombre, this.correo, this.contrasena, this.edad, this.Idper});
}

void agregarIdFirebase(
    String Idpe, String nombr, String corre, String contrasen, String eda) {
  String nombre = nombr;
  String correo = corre;
  String contrasena = contrasen;
  String edad = eda;
  String Idper = Idpe;
  final firebaseInstance = FirebaseFirestore.instance;
  firebaseInstance.collection('usuarios').doc(Idper).set({
    'nombre': nombre,
    'correo': correo,
    'contrasena': contrasena,
    'edad': edad,
    'Idper': Idper
  });
}
