import 'package:blinkist/repositories/Screens/HomeScreens/BookScreen.dart';
import 'package:blinkist/repositories/Screens/HomeScreens/HomeScreen.dart';
import 'package:blinkist/repositories/Screens/HomeScreens/ProfileScreen.dart';
import 'package:flutter/material.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  int currentIndex = 0;

  final List<Widget> _Screens = [HomeScreen(), Bookscreen(), Profilescreen()];

  void _onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Screens[currentIndex],
      bottomNavigationBar: PhysicalModel(
        color: Color(0xff023A59),
        elevation: 10,
        shadowColor: Colors.black54,
        // borderRadius: BorderRadius.circular(30),
        child: ClipRRect(
          // borderRadius: BorderRadius.circular(30),
          child: SizedBox(
            height: 100,
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: _onTap,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Color(0xff023A59),
              selectedItemColor: Color(0xff28E292),
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              iconSize: 30,
              items: const [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Icon(Icons.home),
                  ),
                  label: '',
                ),

                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Icon(Icons.book),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Icon(Icons.person),
                  ),
                  label: '',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
