import 'package:flutter/material.dart';
import 'styling/colors.dart';
import 'model/settings_model.dart';
import 'dart:async';
import 'DBhelpers.dart';

class settingsPage extends StatefulWidget {
  settingsPage({Key? key}) : super(key: key);

  @override
  _settingsPageState createState() => _settingsPageState();
}

class _settingsPageState extends State<settingsPage> {
  static const color = AppColors();
  TextEditingController _controller = TextEditingController();
  late Future<Settings> _settings;
  late String link = _controller.text;
  int id = 1;
  var dbhelper = DBHelper();

  void pushToDB() {
    Settings e = Settings(id, link);

    dbhelper.insert(e);
  }

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
          padding: const EdgeInsets.only(top: 50.0, right: 20.0, left: 20.0),
          child: Center(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(),
                  padding: EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: TextFormField(
                    controller: _controller,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      hintText: "Server Link",
                      hintStyle: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: Container(
                    child: TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(color.mainBlue),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: BorderSide(color: color.mainBlue),
                          ),
                        ),
                      ),
                      onPressed: () => pushToDB(),
                      child: Text(
                        "Save",
                        style: TextStyle(
                          backgroundColor: color.mainBlue,
                          color: color.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
