import 'package:flutter/material.dart';
import 'package:oet_learning_app/Authentication%20Resources/Authentication_methods.dart';
import 'package:oet_learning_app/Resources/bottom_sheet.dart';
import 'package:oet_learning_app/Resources/list_tile.dart';
import 'package:oet_learning_app/Resources/responsive.dart';
import 'package:oet_learning_app/Screens/loginPage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:oet_learning_app/Screens/main_page.dart';
import 'package:oet_learning_app/Screens/t_and_c.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:fluttertoast/fluttertoast.dart';
class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  void logOut() async {
    final String result = await AuthMethods().logoutUser();
    if(result == 'success' && mounted){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginPage()));
      Fluttertoast.showToast(msg: 'Logged out');
    }
    else{
      Fluttertoast.showToast(msg : 'Sign out failed. Try again later');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          SizedBox(
            height: screenLayout(360, context),
            child: const UserAccountsDrawerHeader(
              currentAccountPictureSize:  Size.fromRadius(30),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage('https://www.realsimple.com/thmb/z3cQCYXTyDQS9ddsqqlTVE8fnpc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/real-simple-mushroom-black-bean-burgers-recipe-0c365277d4294e6db2daa3353d6ff605.jpg'),
              ),
                accountName: Text('Allison Burgers'),
                accountEmail: Text('allisonburgers@gmail.com'),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                    image: AssetImage('Images/Fabsoet.png',
                    ),
                ),
              ),
            ),
          ),
          listTile(Icons.home_rounded, 'Home', (){
            Navigator.pop(context);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainPage()));
          }),
          listTile(Icons.chat_rounded, 'Contact Us', () {
           displayBottomSheet(context);
          }),
          listTile(Icons.login_outlined, 'Sign Out', () => logOut())
        ],
      ),
    );
  }
}

