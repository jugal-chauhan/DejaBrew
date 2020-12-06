import 'package:dejabrew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:dejabrew/shared/constants.dart';
import 'package:dejabrew/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String Fname = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: new Stack(
              fit: StackFit.expand,
              children: <Widget>[
                new Image(
                    image: new AssetImage("assets/bg1.png"),
                    fit: BoxFit.cover,
                    colorBlendMode: BlendMode.darken,
                    color: Colors.black54),
                new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Form(
                      key: _formKey,
                      child: Theme(
                        data: ThemeData(
                          brightness: Brightness.light,
                          inputDecorationTheme: InputDecorationTheme(
                            labelStyle: TextStyle(
                                color: Colors.pink[100], fontSize: 20),
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(60.0),
                          child: Column(
                            children: <Widget>[
                              
                              SizedBox(height: 20.0),
                              TextFormField(
                                decoration: textInputDecoration.copyWith(
                                    hintText: 'Email'),
                                validator: (val) =>
                                    val.isEmpty ? 'Enter your Email' : null,
                                onChanged: (val) {
                                  setState(() => email = val);
                                },
                              ),
                              SizedBox(height: 20.0),
                              TextFormField(
                                decoration: textInputDecoration.copyWith(
                                    hintText: 'Password'),
                                obscureText: true,
                                validator: (val) => val.length < 6
                                    ? 'Enter a password 6+ chars long'
                                    : null,
                                onChanged: (val) {
                                  setState(() => password = val);
                                },
                              ),
                              SizedBox(height: 20.0),
                              RaisedButton(
                                  color: Colors.pink[400],
                                  child: Text(
                                    'Register',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      setState(() => loading = true);
                                      dynamic result = await _auth
                                          .registerWithEmailAndPassword(
                                              email, password);
                                      if (result == null) {
                                        setState(() {
                                          loading = false;
                                          error = 'Please supply a valid email';
                                        });
                                      }
                                    }
                                  }),
                              SizedBox(height: 12.0),
                              Text(
                                error,
                                style: TextStyle(
                                    color: Colors.red, fontSize: 14.0),
                              ),
                              SizedBox(height: 15.0),
                              FlatButton.icon(
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.greenAccent,
                                ),
                                label: Text(
                                  'Sign In',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () => widget.toggleView(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
