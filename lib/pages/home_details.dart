import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:journey_to_figueira/food_page.dart';
import 'package:journey_to_figueira/utils/base.dart';
import 'package:journey_to_figueira/pages/book_page.dart';
import 'package:journey_to_figueira/utils/classes.dart';
import 'package:journey_to_figueira/utils/colors.dart';

class HomeDetails extends StatefulWidget {
  final Restaurant restaurant;

  const HomeDetails({super.key, required this.restaurant});

  @override
  State<HomeDetails> createState() => _HomeDetailsState();
}

class _HomeDetailsState extends State<HomeDetails> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        buildBackground(), // Assuming you already have a background setup
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: false,
            title: buildTextAppbar(context, "Details"),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios, color: kGold),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image section
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Stack(
                      children: [
                        Image.asset(
                          widget.restaurant.image,
                          fit: BoxFit.cover,
                          height: height * 0.3,
                          width: double.infinity,
                        ),
                        // Gradient overlay
                        Container(
                          height: height * 0.3,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withOpacity(0.5),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  buildHeight(context, 0.02),
                  // Title with more styling
                  Padding(
                    padding: EdgeInsets.all(height * 0.025),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.restaurant.title,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        buildHeight(context, 0.01),

                        // Description with padding and color contrast
                        Text(
                          widget.restaurant.description,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                            height: 1.5,
                          ),
                        ),
                        buildHeight(context, 0.01),

                        // Date section with some style
                        Center(
                          child: Text(
                            textAlign: TextAlign.center,
                            widget.restaurant.date,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: kGold, // Use your custom gold color
                            ),
                          ),
                        ),
                        buildHeight(context, 0.04),
                        SizedBox(
                          height: 250, // Set height for the horizontal list
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.restaurant.menu.length,
                            itemBuilder: (context, index) {
                              final food = widget.restaurant.menu[index];
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                            builder:
                                                (context) =>
                                                    FoodPage(food: food),
                                          ),
                                        );
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(40),
                                        child: Image.asset(
                                          food.image,
                                          height: height * 0.2,
                                          width: width * 0.4,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      food.name,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      '\$${food.price}',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        buildHeight(context, 0.04),

                        buildcenter(context, () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => BookPage(),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
