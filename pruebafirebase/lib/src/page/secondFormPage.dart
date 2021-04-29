import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Paginados extends StatefulWidget {
  @override
  _PaginadosState createState() => _PaginadosState();
}

class _PaginadosState extends State<Paginados> {
  TextStyle estilosTexto = TextStyle(
      fontSize: 21, color: Colors.indigo, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    width: 300.0,
                    height: 50.0,
                    margin: EdgeInsets.all(30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Text(
                            'buscar...',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          child: Icon(
                            Icons.search,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          'ANIMES',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: 500,
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdY-8viRob-aIV0o_85FI_8CJ3ry4J6fZZIw&usqp=CAU'),
                      ),
                      Text(
                        'Dragon Ball Super',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Episodios :160',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              Icon(
                                Icons.people,
                                color: Colors.red,
                              )
                            ]),
                      ),
                      Container(
                        width: 500,
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: Image.network(
                            'https://www.tonica.la/__export/1606760406622/sites/debate/img/2020/11/30/demon-slayer-kimetsu-no-yaiba-la-segunda-pelxcula-mxs-taquillera-de-japxn.jpg_554688468.jpg'),
                      ),
                      Text(
                        'Kimetsu no Yaiba',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Episodios :110',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              Icon(
                                Icons.people,
                                color: Colors.red,
                              )
                            ]),
                      ),
                      CupertinoTabBar(
                        items: <BottomNavigationBarItem>[
                          BottomNavigationBarItem(
                              icon: Icon(Icons.home), title: Text('Home')),
                          BottomNavigationBarItem(
                              icon: Icon(Icons.menu), title: Text('Menu')),
                          BottomNavigationBarItem(
                              icon: Icon(Icons.supervisor_account),
                              title: Text('perfil')),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,

      //floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
