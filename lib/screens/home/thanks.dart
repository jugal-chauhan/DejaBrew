import 'package:dejabrew/screens/home/homeapp.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'package:flutter_icons/flutter_icons.dart';

const Color dg = const Color(0xFF0a3929);
const Color gld = const Color(0xFFd8a349);
const Color strg = const Color(0xFF00704A);

void main() {
  runApp(Thanks());
}

class Thanks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: dg,
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 13,
              child: Column(
                children: [
                  Text(
                    "THANK YOU",
                    style: TextStyle(
                        fontFamily: 'nunito',
                        fontSize: 63.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    "for ordering",
                    style: TextStyle(
                        fontFamily: 'nunito',
                        fontSize: 45.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    "with us",
                    style: TextStyle(
                        fontFamily: 'nunito',
                        fontSize: 45.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 400.0),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomeApp()));
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: 11.0),
                      width: MediaQuery.of(context).size.width - 250.0,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40.0),
                            bottomLeft: Radius.circular(40.0),
                            bottomRight: Radius.circular(40.0),
                          ),
                          color: strg),
                      child: Text(
                        "Back to Home",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'nunito',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 2.2,
              child: Container(
                padding: EdgeInsets.all(30.0),
                height: MediaQuery.of(context).size.height / 2 - 62.0,
                width: MediaQuery.of(context).size.width - 90.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  color: gld,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 70.0),
                    Container(
                      child: Text(
                        "Please take 30% off your next order with code :",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'varela',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 13.0),
                    Text(
                      "CAFFLOVE",
                      style: TextStyle(
                          fontFamily: 'nunito',
                          fontSize: 27.0,
                          fontWeight: FontWeight.w900,
                          color: dg),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 270,
              child: Image.asset(
                'assets/dcup.png',
                scale: 0.5,
                height: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
