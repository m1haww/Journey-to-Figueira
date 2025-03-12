import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:journey_to_figueira/utils/colors.dart';

Widget buildHeight(BuildContext context, double percentage) {
  final height = MediaQuery.of(context).size.height;
  return SizedBox(height: height * percentage);
}

Widget buildWidth(BuildContext context, double percentage) {
  final width = MediaQuery.of(context).size.width;
  return SizedBox(width: width * percentage);
}

Widget buildBackground() {
  return Positioned.fill(
    child: Image(image: AssetImage("images/background.jpg"), fit: BoxFit.cover),
  );
}

Widget buildTextAppbar(BuildContext context, String text) {
  return Text(
    text,
    style: TextStyle(fontFamily: "Actor", fontSize: 30, color: kGold),
  );
}
