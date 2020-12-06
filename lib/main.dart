import 'package:dejabrew/dummy.dart';
import 'package:dejabrew/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dejabrew/services/auth.dart';
import 'package:dejabrew/models/user.dart';
import 'package:dejabrew/dummy.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Dummy(),
      ),
    );
  }
}
