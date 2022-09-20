import 'package:Toters/Screens/ConfigApp/ConfigApp.dart';
import 'package:Toters/Screens/HomePage/view.dart';
import 'package:Toters/Screens/Orders/Orders.dart';
import 'package:Toters/Screens/Profile/Login.dart';
import 'package:Toters/Screens/Search/view.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';

class MainNav extends StatefulWidget {
  @override
  _MainNavState createState() => _MainNavState();
}

class _MainNavState extends State<MainNav> {
  int _selectedIndex = 3;

  static List<Widget> _widgetOptions = <Widget>[
    Profile(),
    Orders(),
    Search(),
    HomePage(),

  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: ColorApp,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: Icons.account_circle_rounded,
                  text: 'حساب',
                ),
                GButton(
                  icon: Icons.add_alert_outlined,
                  text: 'طلبات',
                ),
                GButton(
                  icon: Icons.search,
                  text: 'بحث',
                ),
                GButton(
                  icon: Icons.home,
                  text: 'رئيسية',

                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}