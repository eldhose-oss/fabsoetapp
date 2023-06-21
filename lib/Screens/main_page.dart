import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:oet_learning_app/Resources/NavBar.dart';
import 'package:oet_learning_app/Resources/responsive.dart';
import 'package:oet_learning_app/Screens/home_screen.dart';
import 'package:oet_learning_app/Screens/loginPage.dart';
import 'package:oet_learning_app/Screens/profile_page.dart';
import 'package:oet_learning_app/Screens/signup_page.dart';
import 'package:oet_learning_app/Screens/t_and_c.dart';
import '../Resources/colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var index = 2;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final screens = const [
    ProfilePage(),
    TermsAndConditions(),
    HomeScreen(),
    LoginPage(),
    SignupScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      bottomNavigationBar: CurvedNavigationBar(
        height: screenLayout(90, context),
        key: _bottomNavigationKey,
        index: index,
        backgroundColor: secondaryColor,
        items: const [
          Icon(EvaIcons.person),
          Icon(Icons.abc),
          Icon(EvaIcons.home),
          Icon(Icons.telegram),
          Icon(Icons.label),
        ],
        animationCurve: Curves.easeIn,
        animationDuration: const Duration(milliseconds: 500),
        onTap: (page) {
          setState(() {
            index = page;
          });        },
        letIndexChange: (index) => true,
      ),
      body: screens[index]

    );
  }
}
