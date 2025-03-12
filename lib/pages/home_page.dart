import 'package:flutter/material.dart';
import 'package:journey_to_figueira/pages/base.dart';
import 'package:journey_to_figueira/utils/classes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        buildBackground(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: false,
            title: buildTextAppbar(context, "Home"),
          ),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [],
            ),
          ),
        ),
      ],
    );
  }
}
