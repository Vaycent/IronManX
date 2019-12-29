import 'package:flutter/material.dart';

import '../screen_routes.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: InkWell(
        child: Center(
          child: Text('LOGIN'),
        ),
        onTap: () => Navigator.pushNamedAndRemoveUntil(context, ScreenRoutes.Main, (route) => route == null),
      ),
    );
  }
}
