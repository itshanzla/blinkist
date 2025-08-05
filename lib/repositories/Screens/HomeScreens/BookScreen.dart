import 'package:blinkist/components/BulletPoint.dart';
import 'package:blinkist/constants/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Bookscreen extends StatefulWidget {
  const Bookscreen({super.key});

  @override
  State<Bookscreen> createState() => _BookscreenState();
}

class _BookscreenState extends State<Bookscreen> {
  @override
  Widget build(BuildContext context) {
    var width = AppDimensions.screenWidth(context);
    var height = AppDimensions.screenHeight(context);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light, // White icons
        // For iOS
      ),
    );

    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(height: statusBarHeight, color: Color(0xffC6C7BD)),

                Positioned.fill(
                  child: Image.asset(
                    "assets/images/alarm.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                SafeArea(
                  top: false,
                  child: Container(
                    color: Color(0xffC6C7BD).withAlpha(170),
                    width: width,
                    height: height * 0.35,
                    padding: const EdgeInsets.all(20),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: SizedBox(
                                  width: 15,
                                  height: 15,
                                  child: Image.asset(
                                    "assets/images/cross.png",
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Image.asset(
                                    "assets/images/info.png",
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40),
                        Text(
                          'Daniel H.Pink',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "600",
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'When',
                          style: TextStyle(
                            fontSize: 32,
                            fontFamily: "Bold",
                            color: Colors.white,
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
              ],
            ),
            Stack(
              children: [
                Container(width: width, height: 60, color: Color(0xffC6C7BD)),
                Positioned(
                  child: Center(
                    child: Container(
                      width: width * 0.8,
                      height: 60,
                      // padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Color(0xff02314B),
                        borderRadius: BorderRadius.circular(30),
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () => {print("Text is succesfully print.")},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  margin: EdgeInsets.only(right: 10),
                                  child: Image.asset(
                                    "assets/images/document.png",
                                  ),
                                ),
                                Text(
                                  "Read",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Bold',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(height: 25, width: 2, color: Colors.white),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                margin: EdgeInsets.only(right: 10),
                                child: Image.asset("assets/images/music.png"),
                              ),
                              Text(
                                "Listen",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Bold',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Container(
              width: width,
              color: Color(0xffC6C7BD),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Regular",
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      "When (2018) combs through around 700 sceintific studies to get a better undersatnding of how big a role timing plays in our lives. Daniel H. Pink sifts thorugh data from the fields of economics, athroopology, social pyschology and others, giving the readers a thorough look at why we make the descision we do, and why we make them when we do.",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Regular",
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      "Who should read this?",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        BulletPoint(
                          text: "Readers who want to improve their efficiency.",
                          width: width,
                        ),
                        BulletPoint(
                          text:
                              "Managers looking for tips on effective leadership.",
                          width: width,
                        ),
                        BulletPoint(
                          text: "Recent college graduates.",
                          width: width,
                        ),
                      ],
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
