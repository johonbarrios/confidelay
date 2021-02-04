import 'package:confidelay/components/rounded_button.dart';
import 'package:confidelay/screens/car_shop.dart';
import 'package:confidelay/screens/listview_product.dart';

import 'package:confidelay/screens/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:confidelay/service/auth.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  final txtEmailController = TextEditingController();
  final txtPassController = TextEditingController();
  
  void loginAction(BuildContext context) async {

    String email = txtEmailController.text;
    String password = txtPassController.text;

    if(password.length < 6){
      showDialog(
        context: context,
        builder: (BuildContext context) {
            return AlertDialog(
                title: Text('La contraseña debe tener al menos 6 caracteres'),
                elevation: 24,
                actions: <Widget>[
                  FlatButton( 
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }, 
                  )
                ],
              );
            }
        );
    }else{
      Auth auth = Auth();
      String uid = await auth.signIn(email, password);
      if(uid != "error"){
        setState(() {
          Navigator.pushNamed(context, ListViewProducts.id);
        });
      }else{
        showDialog(
        context: context,
        builder: (BuildContext context) {
            return AlertDialog(
                title: Text('Ocurrió un error, por favor vuelve a intentar'),
                elevation: 24,
                actions: <Widget>[
                  FlatButton( 
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }, 
                  )
                ],
              );
            }
        );
      }
      
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo_dulces.png'),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),

              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                controller: txtEmailController,
                style: TextStyle(
                  color: Colors.white70,
                ),
                decoration: InputDecoration(
                  hintText: 'Ingresa tu Correo',
                  hintStyle: TextStyle(
                    color: Colors.white70,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFECA703),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),

             
              SizedBox(
                height: 8.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                controller: txtPassController,
                style: TextStyle(
                  color: Colors.white70,
                ),
                decoration: InputDecoration(
                  hintText: 'Ingresa tu Contrasena',
                  hintStyle: TextStyle(
                    color: Colors.white70,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFECA703),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              RoundedButton(
                labelText: 'Ingresar',
                color: Colors.amber,
                onPressed: () {
                  loginAction(context);
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              FlatButton(
                  textColor: Colors.white,
                  onPressed: () {
                    setState(() {
                      Navigator.pushNamed(context, RegisterScreen.id);
                    });
                  },  
                  child: Text(
                    'Registrate Aqui',
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
