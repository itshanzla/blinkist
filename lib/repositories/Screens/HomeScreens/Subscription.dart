import 'package:blinkist/constants/dimensions.dart';
import 'package:blinkist/repositories/Screens/HomeScreens/PlanDetails.dart';
import 'package:flutter/material.dart';

class Subscription extends StatefulWidget {
  const Subscription({super.key});

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  @override
  Widget build(BuildContext context) {
    var width = AppDimensions.screenWidth(context);
    var height = AppDimensions.screenHeight(context);
    return Scaffold(
      backgroundColor: Color(0xffEFEFED),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height * 0.1),
            Image(
              width: width,
              opacity: AlwaysStoppedAnimation<double>(1.0),
              fit: BoxFit.contain,
              image: AssetImage('assets/images/Banner.png'),
            ),
            Column(
              children: [
                SizedBox(height: 40),

                Padding(
                  padding: EdgeInsetsGeometry.only(left: width * 0.05),
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
                  padding: EdgeInsetsGeometry.only(left: width * 0.05),
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
                  padding: EdgeInsetsGeometry.only(left: width * 0.05),
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
                  padding: EdgeInsetsGeometry.only(left: width * 0.05),
                  child: Row(
                    children: [
                      Image(image: AssetImage('assets/images/elephant.png')),
                      SizedBox(width: 20),
                      Text('Evernote Sync'),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.08),
                Card(
                  child: SizedBox(
                    width: width * 0.9,
                    height: 125,
                    child: Padding(
                      padding: EdgeInsetsGeometry.all(30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Monthly',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Regular',
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                '\$12.99/Month',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Regular',
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff28E292),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            width: 106,
                            height: 36,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff28E292),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Plandetails(),
                                  ),
                                );
                              },
                              child: Text(
                                'Subscribe',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: 'Regular',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  child: SizedBox(
                    width: width * 0.9,
                    height: 250,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            Container(
                              color: Color(0xffE6FC88),
                              width: width * 0.25,
                              height: 40,
                              child: Center(
                                child: Text(
                                  'Save 49%',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Bold',
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsGeometry.only(
                                top: width * 0.02,
                                left: width * 0.03,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Yearly + free trial*',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Bold',
                                      color: Color(0xff4A585B),
                                    ),
                                  ),
                                  Text(
                                    '\$79.99/ month*',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Bold',
                                      color: Color(0xff28E292),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  SizedBox(
                                    width: width * 0.56,

                                    child: Text(
                                      '*Try 7 days free when you subscribe for a year. If you love it, no action is needed: iTunes will charge the yearly fees unless you cancel the trial 24 hours before expriration*',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontFamily: 'Regular',
                                        color: Color(0xff707C81),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        Container(
                          width: 106,
                          height: 36,
                          margin: EdgeInsets.only(top: 40),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff28E292),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Plandetails(),
                                ),
                              );
                            },
                            child: Text(
                              'Subscribe',
                              style: TextStyle(
                                fontSize: 10,
                                fontFamily: 'Regular',
                                color: Colors.white,
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
          ],
        ),
      ),
    );
  }
}
