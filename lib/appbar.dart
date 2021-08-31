import 'package:flutter/material.dart';
import 'styling/colors.dart';

Widget setAppBar(String text) {
  const color = AppColors();
  return new AppBar(
    elevation: 0.0,
    backgroundColor: color.mainBlue,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(200),
      bottomRight: Radius.circular(200),
    )),
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                text,
                style: TextStyle(
                    color: color.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 100,
          )
        ],
      ),
    ),
  );
}
