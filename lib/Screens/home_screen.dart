import 'package:flutter/material.dart';
import 'package:oet_learning_app/Resources/NavBar.dart';
import 'package:oet_learning_app/Resources/Slivertoboxadapter.dart';
import 'package:oet_learning_app/Resources/colors.dart';
import 'package:oet_learning_app/Resources/homecontainer.dart';
import 'package:oet_learning_app/Resources/responsive.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:oet_learning_app/Resources/space_create.dart';
import 'package:oet_learning_app/Screens/Listening.dart';
import 'package:oet_learning_app/Screens/Reading.dart';
import 'package:sidebarx/sidebarx.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> images = [
    'Images/logo.jpg',
    'Images/logo.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: const NavBar(),
      backgroundColor: primaryColor,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
            color: textColor
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: screenLayout(80, context),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: screenLayout(150, context),height: screenLayout(250, context),
              child: Image.asset('Images/logo.jpg',
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            sizedBoxWithChild(200, width, context,
              Swiper(
                itemCount: images.length,
                control: const SwiperControl(
                  color: Colors.transparent
                ),
                itemBuilder: (context, index){
                  return Image.asset(
                      images[index],
                      fit: BoxFit.fill,
                  );
                },
                autoplay: true,
              ),
            ),
            sizedBox(20, width, context),//sized box with child
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                sizedBox(0, 20, context),
                Text('Courses',
                  style: TextStyle(
                    fontFamily: 'IBM',
                    color: secondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: screenLayout(30, context),
                  ),
                )
              ],
            ),
            sizedBox(20, width, context),//sized box with child
            Wrap(
              runSpacing: 10,
              spacing: 10,
              children: [
                homeContainer(context: context, heading: 'Listening', path: 'Images/Icons/listening.png', onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const ListeningPage()));
                }),
                homeContainer(context: context, heading: 'Speaking', path: 'Images/Icons/speaking.png', onTap: (){}),
                homeContainer(context: context, heading: 'Reading', path: 'Images/Icons/read.png', onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const ReadingPage()));
                }),
                homeContainer(context: context, heading: 'Writing', path: 'Images/Icons/note.png', onTap: (){}),
                homeContainer(context: context, heading: 'Grammar', path: 'Images/Icons/board.png', onTap: (){}),
                homeContainer(context: context, heading: 'Study Materials', path: 'Images/Icons/school-material.png', onTap: (){}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
