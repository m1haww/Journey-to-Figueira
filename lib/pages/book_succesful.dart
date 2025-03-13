import 'package:flutter/material.dart';
import 'package:journey_to_figueira/utils/base.dart';
import 'package:journey_to_figueira/utils/colors.dart';

class BookSuccesful extends StatefulWidget {
  const BookSuccesful({super.key});

  @override
  State<BookSuccesful> createState() => _BookSuccesfulState();
}

class _BookSuccesfulState extends State<BookSuccesful> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        buildBackground(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Centering content vertically
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle_outline, // Icon of choice
                    color: kGold, // Icon color
                    size: 50, // Icon size
                  ),
                  SizedBox(height: 20), // Space between icon and text
                  Text(
                    'Congratulations!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28, // Slightly larger font size for prominence
                      fontWeight: FontWeight.w600, // Bold but not too heavy
                      fontFamily: 'Karma', // Applying the Karma font family
                    ),
                  ),
                  SizedBox(height: 10), // Space between messages
                  Text(
                    'You have successfully booked this place.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18, // Font size for the main message
                      fontWeight: FontWeight.w400, // Regular weight
                      fontFamily: 'Karma', // Same font family for consistency
                    ),
                    textAlign: TextAlign.center, // Centering the text
                  ),
                  SizedBox(
                    height: 20,
                  ), // Space between the message and next text
                  Text(
                    'Our manager will come back to you soon.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16, // Slightly smaller font size
                      fontWeight: FontWeight.w300, // Lighter weight
                      fontFamily: 'Karma', // Consistent font family
                    ),
                    textAlign: TextAlign.center, // Centering the text
                  ),
                  buildHeight(context, 0.04),
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: width * 0.3,
                        height: height * 0.05,
                        decoration: BoxDecoration(
                          color: kGold,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            "Get back",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color:
                                  Colors.black, // Text color inside the button
                              fontSize: 16, // Font size for the button text
                              fontWeight:
                                  FontWeight
                                      .w500, // Medium weight for the button text
                            ),
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
      ],
    );
  }
}
