import 'package:flutter/material.dart';
import 'siugn_up_screen.dart';
import '../main.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'home_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print("Submit");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>MyHomePage(title: "Car shop",)));
    }
  }
  _signIn(){
    Navigator.push(context, MaterialPageRoute(builder: (_)=>SignupScreen()));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(
                flex: 1,
              ),
              Image(
                image: AssetImage("assets/images/app_logo.jpg"),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 3, bottom: 3),
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: "Email",
                                labelStyle: TextStyle(color: Colors.grey)),
                            validator: (input) => !input.contains("@")
                                ? "Please enter a valid email"
                                : null,
                            onSaved: (input) => print(input),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 3, bottom: 3),
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: "Password",
                                labelStyle: TextStyle(color: Colors.grey)),
                            validator: (input) => input.isEmpty
                                ? "Please enter a valid email"
                                : null,
                            onSaved: (input) => print(input),
                            obscureText: true,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Container(
                        child: InkWell(
                          onTap: () => _submit(),
                          child: Container(
                            margin: EdgeInsets.all(0),
                            width: double.infinity,
                            height: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blueAccent),
                            child: Center(child: Text("Login", style: TextStyle(color: Colors.white),)),
                          ),
                        ),
                      ),
                      Container(
                        child: InkWell(
                          onTap: () => _signIn(),
                          child: Container(
                            margin: EdgeInsets.all(0),
                            width: double.infinity,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.grey,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
