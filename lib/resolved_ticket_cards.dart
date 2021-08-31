import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'styling/colors.dart';
import 'data/ticket_data.dart';
import 'package:intl/intl.dart';
import 'my_drawer.dart';
import 'landing.dart';
import 'model/ticket_model.dart';

class res_ticketCards extends StatefulWidget {
  @override
  _res_ticketCardsState createState() => _res_ticketCardsState();
}

class _res_ticketCardsState extends State<res_ticketCards> {
  static const color = AppColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.mainBlue,
        title: Text(
          "Tickets",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            tooltip: "Search",
          ),
          PopupMenuButton(
              icon: Icon(Icons.arrow_drop_down),
              onSelected: (value) {
                value == "Pending"
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => landingPage(),
                        ),
                      )
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => res_ticketCards(),
                        ),
                      );
                ;
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text("Pending Tickets"),
                    value: "Pending",
                  ),
                  PopupMenuItem(
                    child: Text("Resolved Tickets"),
                    value: "Resolved",
                  ),
                ];
              }),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => notifications(),
                ),
              );
            },
            icon: Icon(Icons.notifications),
            tooltip: "Notifications",
          ),
        ],
      ),
      drawer: Drawer(
        child: myDrawer(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              top: 16.0,
            ),
            child: Text(
              "Resolved Tickets",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: color.darkGrey,
              ),
            ),
          ),
          Divider(
            height: 20,
            endIndent: 12,
            indent: 12,
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: tickets == tickets.isEmpty
                  ? Container(
                      child: Center(
                        child: Text(
                          "You currently have no resolved tickets",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                  : new ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: tickets.length,
                      itemBuilder: (BuildContext context, int index) =>
                          cardBuilder(context, index),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget cardBuilder(BuildContext context, int index) {
    const color = AppColors();
    return new Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => _openTicket(tickets[index], index),
            ),
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 8.0,
          child: Container(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        DateFormat.yMd()
                            .add_jms()
                            .format(tickets[index].date_time)
                            .toString(),
                        style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Text(
                        tickets[index].title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Text(
                              tickets[index].name,
                              style: TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.w600,
                                color: color.lightGrey,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              tickets[index].level,
                              style: TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.w600,
                                color: color.lightGrey,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              tickets[index].technician,
                              style: TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.w600,
                                color: color.lightGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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

Widget _openTicket(Ticket ticket, int index) {
  const color = AppColors();
  return Scaffold(
    appBar: AppBar(
      backgroundColor: color.mainBlue,
      title: Text(
        "#${index + 1}",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: color.white,
        ),
      ),
      centerTitle: true,
    ),
    body: Container(
      padding: EdgeInsets.all(10.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                ticket.title,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              ticket.description,
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
            Divider(
              height: 30.0,
              color: Colors.black45,
              thickness: 5.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Text(
                ticket.technician,
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
