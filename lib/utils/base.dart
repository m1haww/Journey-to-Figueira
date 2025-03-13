import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:journey_to_figueira/pages/book_page.dart';
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
    child: Image(
      image: AssetImage("images/background.png"),
      fit: BoxFit.fill,
      width: double.infinity,
    ),
  );
}

Widget buildTextAppbar(BuildContext context, String text) {
  return Text(
    text,
    style: TextStyle(fontFamily: "Actor", fontSize: 30, color: kOrange),
  );
}

Widget buildContainerList(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return Container(
    width: width * 0.2,
    height: height * 0.04,
    decoration: BoxDecoration(
      color: kGold,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Center(
      child: Text("Details", textAlign: TextAlign.center, style: TextStyle()),
    ),
  );
}

Widget buildcenter(BuildContext context, VoidCallback ontap) {
  return Center(
    child: ElevatedButton(
      onPressed: ontap,

      child: Text(
        "Book Now",
        style: TextStyle(color: kBlack),
        textAlign: TextAlign.center,
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: kGold,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ),
  );
}
