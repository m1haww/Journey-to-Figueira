import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:journey_to_figueira/utils/base.dart';
import 'package:journey_to_figueira/utils/classes.dart';
import 'package:journey_to_figueira/utils/colors.dart';

class FoodPage extends StatefulWidget {
  final Food food;

  const FoodPage({super.key, required this.food});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> with TickerProviderStateMixin {
  late AnimationController _imageAnimationController;
  late Animation<double> _imageAnimation;
  final TextEditingController _noteController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller and set the duration
    _imageAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    // Define the image animation (zoom-in effect)
    _imageAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _imageAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    // Start the animation when the page loads
    _imageAnimationController.forward();
  }

  @override
  void dispose() {
    _imageAnimationController.dispose(); // Clean up the animation controller
    _noteController.dispose(); // Clean up the note controller
    super.dispose();
  }

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
            title: buildTextAppbar(context, "Food Details"),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios, color: kGold),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(height * 0.02),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Animated food image with zoom-in effect
                    FadeTransition(
                      opacity: _imageAnimationController,
                      child: ScaleTransition(
                        scale: _imageAnimation,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            widget.food.image,
                            height: height * 0.3, // Adjust size
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    // Food Name
                    Text(
                      widget.food.name,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    // Food Price
                    Text(
                      "\$${widget.food.price.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: kGold, // Use your custom gold color
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    // Food Description
                    Text(
                      widget.food.description,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: height * 0.03),

                    // Leave a Note Button
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
