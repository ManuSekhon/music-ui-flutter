import 'package:flutter/material.dart';

// import 'package:flutter_login/models/login_model.dart';
// import 'package:flutter_login/screens/login_screen.dart';
import 'package:flutter_login/screens/home_screen.dart';
import 'package:flutter_login/screens/music_screen.dart';
import 'package:flutter_login/service_locator.dart';

// bool _isAuth = false;

void main() async {
  // inject service locator
  setupLocator();

  // // check if user is logged in
  // LoginModel loginInstance = locator<LoginModel>();
  // _isAuth = await loginInstance.isAuthenticated();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login App',
      theme: ThemeData(primaryColor: Colors.white),
      home: Home(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/home':
            return MaterialPageRoute(builder: (_) => Home());
          case '/music':
            return MaterialPageRoute(builder: (_) => Music());
        }
      },
    );
  }
}
