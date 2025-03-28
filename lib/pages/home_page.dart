import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:journey_to_figueira/utils/base.dart';
import 'package:journey_to_figueira/pages/home_details.dart';
import 'package:journey_to_figueira/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:journey_to_figueira/utils/provider_app.dart'; // Ensure correct import

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final restaurants = Provider.of<ProviderApp>(context).restaurant;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        buildBackground(), // Assuming this will still handle background customization
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: false,
            title: buildTextAppbar(context, "Home"),
            elevation: 0, // Removing the shadow for a cleaner look
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: width * 0.07, right: width * 0.07),
              child: ListView.builder(
                itemCount: restaurants.length,
                itemBuilder: (context, index) {
                  final restaurant = restaurants[index];
                  return Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: Colors.black.withOpacity(
                          0.8,
                        ), // Dark background for card
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              restaurant.image,
                              height: height * 0.17,
                              width: width * 0.25,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                restaurant.title,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                softWrap:
                                    true, // Permite textului să treacă pe o linie nouă dacă este necesar
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600, // Bolder text
                                  color: kGold, // Using gold for titles
                                  fontFamily: "Actor",
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder:
                                          (context) => HomeDetails(
                                            restaurant: restaurant,
                                          ),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.01,
                                    vertical: height * 0.01,
                                  ),
                                  decoration: BoxDecoration(
                                    color: kGold, // Gold button for action
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    'Details',
                                    style: TextStyle(
                                      color: Colors.black, // Black text
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                restaurant.description,
                                style: TextStyle(
                                  fontFamily: "Actor",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color:
                                      Colors
                                          .white, // White description for contrast
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                restaurant.date,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color:
                                      kOrange, // Use orange for date for a vibrant touch
                                  fontFamily: "Actor",
                                ),
                              ),
                            ],
                          ),
                          isThreeLine: true,
                        ),
                      ),
                      buildHeight(context, 0.02),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
