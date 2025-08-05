import 'package:blinkist/components/commonBtn.dart';
import 'package:blinkist/constants/dimensions.dart';
import 'package:blinkist/repositories/Screens/HomeScreens/HomeScreen.dart';
import 'package:blinkist/repositories/Screens/HomeScreens/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Plandetails extends StatefulWidget {
  const Plandetails({super.key});

  @override
  State<Plandetails> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<Plandetails> {
  @override
  Widget build(BuildContext context) {
    var width = AppDimensions.screenWidth(context);
    var height = AppDimensions.screenHeight(context);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Color(0xff29D276),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white, // match status bar color
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: width,
              height: height * 0.3,
              color: Color(0xff29D276),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  Padding(
                    padding: EdgeInsetsGeometry.all(16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: SizedBox(
                                width: 15,
                                height: 15,
                                child: Image.asset(
                                  "assets/images/cross.png",
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: InkWell(
                                onTap: () {
                                  print("Info Pressed");
                                },
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: Image.asset(
                                  "assets/images/info.png",
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 50),
                        Container(
                          width: width * 0.8,
                          margin: EdgeInsets.only(right: 40),
                          child: Text(
                            'Get the big ideas from 2000+ of the world’s best nonfiction titles',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Regular',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Container(
              width: width,
              color: Colors.white,
              height: height * 0.7,
              child: Padding(
                padding: EdgeInsetsGeometry.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      '\$79.99/ year*',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: 'Bold',
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '*Once you subscribe below, iTunes will charge the annual fee after 7 days unless you cancel the trial 24 hours before it expires. Plan renews automatically each year. Check our terms of use*',
                      // textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Regular',
                        color: Color(0xFF707C81),
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsetsGeometry.only(left: width * 0.01),
                      child: Row(
                        children: [
                          Image(image: AssetImage('assets/images/book.png')),
                          SizedBox(width: 20),
                          Text('Umlimited Access to 2000+ titles'),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsetsGeometry.only(left: width * 0.01),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              "assets/images/music.png",
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 20),
                          Text('Songs'),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsetsGeometry.only(left: width * 0.01),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              "assets/images/document.png",
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 20),
                          Text('Send to Kindle'),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsetsGeometry.only(left: width * 0.01),
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage('assets/images/elephant.png'),
                          ),
                          SizedBox(width: 20),
                          Text('Evernote Sync'),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.15),
                    commonBtn(
                      label: 'Subscribe & try 7 days for free',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Mainscreen()),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: InkWell(
                        child: Text(
                          'View all plans',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Regular',
                            color: Color(0xFF28E292),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
