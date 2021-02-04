
import 'package:confidelay/screens/car_shop.dart';
import 'package:confidelay/screens/listview_product.dart';
import 'package:confidelay/screens/login_screen.dart';
import 'package:confidelay/screens/select_place.dart';
import 'package:flutter/material.dart';
import 'package:confidelay/service/auth.dart';

class SideBar extends StatelessWidget {

   void logOutAction(BuildContext context) async {
    Auth auth = Auth();
    try{
      auth.signOut();
      Navigator.pushNamed(context, LoginScreen.id);
    }catch(e){
      print("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.amber,
            ),
            child: Padding(
              padding: EdgeInsets.zero,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Image.asset(
                            'images/person.png',
                            height: 100.0,
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            'Usuario',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            'Puntos: 0',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            'Telefono',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.fastfood),
            title: Text('Productos'),
            onTap: () {
              Navigator.pushNamed(context, ListViewProducts.id);
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Carrito'),
            onTap: () {
              Navigator.pushNamed(context, CarShop.id);
            },
          ),
          ListTile(
            leading: Icon(Icons.pin_drop),
            title: Text('Elige Ubicacion Actual'),
            onTap: () {
              Navigator.pushNamed(context, SelectPlace.id);
            },
          ),
          ListTile(
            leading: Icon(Icons.archive),
            title: Text('Historial de Pedidos'),
            onTap: () {
              // change app state...
              //Navigator.pushNamed(context, OrderList.id);
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Recompensas'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Configuracion'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Cerrar sesión'),
            onTap: () {
              logOutAction(context);
            },
          ),
        ],
      ),
    );
  }
}
