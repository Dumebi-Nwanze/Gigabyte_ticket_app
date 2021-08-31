import 'dart:ui';
import 'package:flutter/material.dart';
import 'styling/colors.dart';
import 'settings.dart';
import 'add_Tickets.dart';
import 'main.dart';
import 'landing.dart';
import 'contact_us.dart';

class myDrawer extends StatelessWidget {
  const myDrawer({Key? key}) : super(key: key);
  static const color = AppColors();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color.mainBlue),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: color.mainBlue),
            child: Padding(
              padding: EdgeInsets.only(
                top: 50.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1542813066-2475ea27bac3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTYyOTI5NzY0Mg&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080",
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "GigabyteLtd",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800,
                      color: color.white,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "servis@gigabyteltd.com",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: color.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            decoration: BoxDecoration(
                color: color.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                )),
            child: Column(
              children: [
                SizedBox(
                  height: 10.0,
                ),
                ListTile(
                  title: Text("Requests",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  leading: Icon(
                    Icons.note,
                    color: color.darkGrey,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => landingPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Text("Add Requests",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  leading: Icon(
                    Icons.note_add,
                    color: color.darkGrey,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => addTickets(),
                      ),
                    );
                  },
                ),
                Divider(
                  height: 15.0,
                  color: color.lightGrey,
                  indent: 12.5,
                  endIndent: 12.5,
                ),
                ListTile(
                  title: Text("Settings",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  leading: Icon(
                    Icons.settings,
                    color: color.darkGrey,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => settingsPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Text("Contact Us",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  leading: Icon(
                    Icons.help_center_rounded,
                    color: color.darkGrey,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => contactUsPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Text("Logout",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  leading: Icon(
                    Icons.logout,
                    color: color.darkGrey,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TicketApp(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
