import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'styling/colors.dart';
import 'data/ticket_data.dart';
import 'package:intl/intl.dart';
import 'landing.dart';

class pen_ticketCards extends StatefulWidget {
  @override
  _pen_ticketCardsState createState() => _pen_ticketCardsState();
}

class _pen_ticketCardsState extends State<pen_ticketCards> {
  static const color = AppColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                top: 16.0,
              ),
              child: Text(
                "Pending Tickets",
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
            Container(
              height: MediaQuery.of(context).size.height,
              child: tickets == tickets.isEmpty
                  ? Container(
                      child: Center(
                        child: Text(
                          "You currently have no pending tickets",
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
          ],
        ),
      ),
    );
  }
}

Widget cardBuilder(BuildContext context, int index) {
  const color = AppColors();

  return new Container(
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
    child: GestureDetector(
      onTap: () {
        print("Tapped");
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
                    Container(
                      child: Row(children: [
                        IconButton(
                          onPressed: () => removeCard(index),
                          icon: Icon(
                            Icons.delete_rounded,
                            color: Colors.red,
                          ),
                        ),
                      ]),
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

void removeCard(int index) {
  tickets.removeAt(index);
}
