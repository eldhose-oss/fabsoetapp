import 'package:flutter/material.dart';
import 'package:oet_learning_app/Resources/Bottomsheet_container.dart';
import 'package:oet_learning_app/Resources/colors.dart';
import 'package:oet_learning_app/Resources/homecontainer.dart';
import 'package:oet_learning_app/Resources/responsive.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';

TextStyle textStyle = const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20);

final Uri gmailUri = Uri.parse('mailto:fabsoet@gmail.com?subject=Customer Support');
final Uri whatsappUri = Uri.parse('whatsapp://send?phone=918848944317');

Future displayBottomSheet (BuildContext context,) {
  return showModalBottomSheet(context: context, builder: (context){
    return Container(
      height: MediaQuery.of(context).size.height/7,
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(.7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              bottomSheetContainer(
                  context: context,
                  heading: 'WhatsApp',
                  path: 'Images/Icons/WhatsApp.svg.png',
                  onTap: () async {
                    Navigator.pop(context);
                    if(await canLaunchUrl(whatsappUri)){
                      launchUrl(whatsappUri);
                    }
                    Fluttertoast.showToast(msg: 'Ensure WhatsApp is installed!');
                  },
                  containerWidth: 80,
                  containerHeight: 80,
              ) //home container
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              bottomSheetContainer(
                  context: context, 
                  heading: 'Gmail', 
                  path: 'Images/Icons/gmail.png', 
                  onTap: () async {
                    Navigator.pop(context);
                    if(await canLaunchUrl(gmailUri)){
                      launchUrl(gmailUri);
                    }
                    else{
                      Fluttertoast.showToast(msg: 'Ensure Gmail is installed!');
                    }
                  }, 
                  containerWidth: 80,
                  containerHeight: 80,
              )//home container
            ],
          ),
        ],
      ),
    );
  });
}