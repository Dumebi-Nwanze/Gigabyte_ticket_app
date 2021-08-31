import 'package:flutter/material.dart';
import 'styling/colors.dart';

class contactUsPage extends StatelessWidget {
  const contactUsPage({Key? key}) : super(key: key);
  static const color = AppColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          splashColor: color.white,
        ),
        backgroundColor: color.mainBlue,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.mail_outlined),
          ),
        ],
        title: Text(
          " Settings",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(50.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Need assistance?",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  "Send us a mail servis@gigabyteltd.com",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w300,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
