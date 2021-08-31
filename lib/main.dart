import 'package:flutter/material.dart';
import 'styling/colors.dart';
import 'appbar.dart';
import 'login.dart';

void main() => runApp(TicketApp());

class TicketApp extends StatelessWidget {
  const TicketApp({Key? key}) : super(key: key);
  static const Color = AppColors();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(200.0),
          child: setAppBar("Login"),
        ),
        body: SafeArea(child: loginBody()),
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Color.white),
    );
  }
}
