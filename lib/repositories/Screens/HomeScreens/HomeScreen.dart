import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:blinkist/constants/dimensions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var width = AppDimensions.screenWidth(context);
    var height = AppDimensions.screenHeight(context);

    // Set system icons color
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark, // White icons
        // For iOS
      ),
    );

    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      // backgroundColor: Colors.white, // This is for body only
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Status bar colored container
            Container(
              height: statusBarHeight,
              color: Colors.white, // Your status bar background color
            ),

            SafeArea(
              top: false,
              child: Container(
                color: Colors.white,
                width: width,
                height: height * 0.2,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: const Image(
                            image: AssetImage('assets/images/archive.png'),
                          ),
                        ),
                        SizedBox(width: width * 0.05),
                        InkWell(
                          onTap: () {},
                          child: const Image(
                            image: AssetImage('assets/images/search.png'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Text(
                      'Discover',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: "Bold",
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: width * 0.23,
                      height: 5,
                      color: Color(0xff28E292),
                    ),
                  ],
                ),
              ),
            ),

            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width,
                    child: Image.asset(
                      "assets/images/homebanner.png",
                      fit: BoxFit.cover,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'For you',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Regular",
                        color: Colors.black,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: height * 0.4,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10, // Number of items
                      itemBuilder: (context, index) {
                        EdgeInsets margin;
                        if (index == 0) {
                          margin = const EdgeInsets.only(left: 24, right: 8);
                        } else if (index == 9) {
                          margin = const EdgeInsets.only(left: 8, right: 24);
                        } else {
                          margin = const EdgeInsets.symmetric(horizontal: 8);
                        }
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Card(
                            color: Colors.white,

                            margin: margin,
                            child: Container(
                              width: width * 0.4,
                              // margin: margin,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    "assets/images/user.png",
                                    fit: BoxFit.contain,
                                  ),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'The 7 Habbits of highly Effective People.',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "Regular",
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(height: height * 0.07),
                                        Text(
                                          "Blinks",
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontFamily: "Bold",
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          ".",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "10 mins",
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontFamily: "Bold",
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
