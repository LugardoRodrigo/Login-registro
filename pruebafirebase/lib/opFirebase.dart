import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OpFirebase extends StatefulWidget {
  OpFirebase({Key key}) : super(key: key);

  @override
  _OpFirebaseState createState() => _OpFirebaseState();
}

class _OpFirebaseState extends State<OpFirebase> {
  final firebaseInstance = FirebaseFirestore.instance;
  void agregarFirebase() {
    firebaseInstance.collection('personas').add(
        {'nombre': 'Andres', 'edad': '22', 'pais': 'Mexico', 'activo': true});
  }

  void agregarIdFirebase() {
    firebaseInstance.collection('personas').doc('id_personalizado').set({
      'nombre': 'Adrian',
      'edad': '23',
      'pais': 'Un rancho',
      'activo': false
    });
  }

  void actualizar() {
    firebaseInstance
        .collection('personas')
        .doc('id_perzonalizado')
        .update({'nombre': 'ADRIANA', 'activo': true});
  }

  void listarFirebase() {
    firebaseInstance.collection('personas').get().then((resultado) {
      resultado.docs.forEach((element) {
        print(element.data());
      });
    });
  }

  void buscarFirebase() {
    firebaseInstance
        .collection('personas')
        .where('pais', isEqualTo: 'Un rancho')
        .snapshots()
        .listen((res) {
      res.docs.forEach((element) {
        print(element.data());
      });
    });
  }

  void leerPersonalizadoFirebase() {
    firebaseInstance
        .collection('personas')
        .doc('id_personalizado')
        .get()
        .then((value) {
      print(value.data());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('operaciones en firestore'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  agregarFirebase();
                },
                child: Text(
                  'agregar',
                  style: TextStyle(fontSize: 20),
                )),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  // agregarFirebase();
                  agregarIdFirebase();
                },
                child: Text(
                  'Id perzonalizado',
                  style: TextStyle(fontSize: 20),
                )),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  // agregarFirebase();
                  //agregarIdFirebase();
                  actualizar();
                },
                child: Text(
                  'Actualizar',
                  style: TextStyle(fontSize: 20),
                )),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  // agregarFirebase();
                  listarFirebase();
                },
                child: Text(
                  'LISTAR',
                  style: TextStyle(fontSize: 20),
                )),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  // agregarFirebase();
                  leerPersonalizadoFirebase();
                },
                child: Text(
                  'leer personalizado',
                  style: TextStyle(fontSize: 20),
                )),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  // agregarFirebase();
                  buscarFirebase();
                },
                child: Text(
                  'Buscar',
                  style: TextStyle(fontSize: 20),
                )),
          ],
        ),
      ),
    );
  }
}
