import 'package:flutter/material.dart';
import 'package:trade_acai_app/model/user-model.dart';
import 'package:trade_acai_app/pages/home-page.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  User user;

  var emailFieldController = TextEditingController();
  var passwordFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      obscureText: false,
      style: style,
      controller: emailFieldController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          hintText: 'Email',
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordField = TextField(
      obscureText: true,
      style: style,
      keyboardType: TextInputType.number,
      controller: passwordFieldController,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          hintText: 'Password',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32))),
    );

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage(user: user)),
          );
        },
        child: Text('Entrar',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final registerButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.grey,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        onPressed: () {},
        child: Text('Cadastrar',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 185,
                  child: Image.asset('assets/images/logo_IAcai.png',
                      fit: BoxFit.contain),
                ),
                SizedBox(height: 45),
                emailField,
                SizedBox(height: 25),
                passwordField,
                SizedBox(height: 35),
                loginButton,
                SizedBox(height: 15),
                Column(children: <Widget>[
                  Row(children: <Widget>[
                    Expanded(
                      child: new Container(
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 20.0),
                          child: Divider(
                            color: Colors.black,
                            height: 36,
                          )),
                    ),
                    Text("OU"),
                    Expanded(
                      child: new Container(
                          margin:
                              const EdgeInsets.only(left: 20.0, right: 10.0),
                          child: Divider(
                            color: Colors.black,
                            height: 36,
                          )),
                    ),
                  ]),
                ]),
                registerButton
              ],
            ),
          ),
        ),
      ),
    );
  }



    void logar(){
      if(emailFieldController.text == 'rayanteixeira91@gmail.com' && int.parse(passwordFieldController.text) == 1234){
        user = new User(emailFieldController.text, int.parse(passwordFieldController.text));
    }
}
