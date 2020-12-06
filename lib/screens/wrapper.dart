import 'package:dejabrew/models/user.dart';
import 'package:dejabrew/screens/authenticate/authenticate.dart';
import 'package:dejabrew/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dejabrew/screens/home/homeapp.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    // return either the Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return HomeApp();
    }
  }
}
