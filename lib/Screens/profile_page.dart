import 'dart:io';
import 'package:flutter/material.dart';
import 'package:oet_learning_app/Resources/NavBar.dart';
import 'package:oet_learning_app/Resources/responsive.dart';
import 'package:oet_learning_app/Resources/space_create.dart';
import 'package:image_picker/image_picker.dart';
import '../Resources/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  late String _selected;
  File? imageSelected;
  _displayDialog(BuildContext context) async {
    _selected = await showDialog(context: context, builder: (context){
      return SimpleDialog(
        title: Text('Select an image',
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        children: [
          SimpleDialogOption(
            onPressed: (){
              pickImageFromCamera();
              Navigator.pop(context);
            },
            child: Text('Camera',
              style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                  backgroundColor: primaryColor
              ),
            ),
          ),
          SizedBox(height: screenLayout(20, context)),
          SimpleDialogOption(
            onPressed: (){
              pickImageFromGallery();
              Navigator.pop(context);
            },
            child: Text('Gallery',
              style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                  backgroundColor: primaryColor
              ),
            ),
          ),
        ],
      );
    });
  }

  void pickImageFromGallery() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    File file = File(image!.path);
    setState(() {
      imageSelected = file;
    });
  }
  void pickImageFromCamera() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    File file = File(image!.path);
    setState(() {
      imageSelected = file;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const NavBar(),
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
        body: Container(
          decoration: BoxDecoration(
            color: primaryColor
          ),
          height: double.maxFinite,
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height/3.1,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.blueGrey.withOpacity(.5)
                ),
                child: Column(
                  children: [

                    sizedBox(screenLayout(40, context ),0, context),
                    (imageSelected != null)?
                    GestureDetector(
                      onTap: (){
                        _displayDialog(context);
                      },
                      child: CircleAvatar(
                        maxRadius: screenLayout(80, context),
                        backgroundImage: FileImage(imageSelected!),
                        backgroundColor: Colors.white70,
                      ),
                    )
                        :
                    GestureDetector(
                      onTap: (){
                        _displayDialog(context);
                      },
                      child: ClipRRect(
                          borderRadius : BorderRadius.circular(90),
                          child: Image.asset('Images/user.png',
                            width: screenLayout(140, context),
                            height: screenLayout(140, context),
                          )
                      ),
                    ),
                    sizedBox(screenLayout(40, context), 0, context),
                    Text('Allison Burgers',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenLayout(45, context)
                      ),
                    ),
                    sizedBox(screenLayout(20, context), 0, context),
                    Text('allisonburgers@gmail.com',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: screenLayout(35, context)
                      ),
                    ),
                    sizedBox(screenLayout(20, context),0, context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: primaryColor,
                            backgroundColor: textColor
                          ),
                            onPressed: (){},
                            child: const Text('Edit Profile')
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                foregroundColor: primaryColor,
                                backgroundColor: textColor
                            ),
                            onPressed: (){},
                            child: const Text('Unused Button')
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenLayout(10, context)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    sizedBox(0, screenLayout(40, context), context),
                    Row(
                      children: [
                        Image.asset('Images/contactless.png',
                          width: screenLayout(60, context),
                        ),
                        sizedBox(0, screenLayout(30, context), context),
                        Text('Recent Transactions',
                          style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: screenLayout(30, context)
                          ),
                        ),
                      ],
                    ),
                    sizedBox(0, screenLayout(50, context), context),
                    TextButton(
                        onPressed: (){},
                        child: Text('View Entire Transactions',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: screenLayout(25, context)
                          ),
                        )
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenLayout(20, context)),
                child: Container(
                  height: MediaQuery.of(context).size.height / 2.6,
                  width: MediaQuery.of(context).size.width - screenLayout(40, context),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10))
                  ),
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) => Card(
                      key: ValueKey(index),
                      child: ListTile(
                        minVerticalPadding: 10,
                        tileColor: Colors.grey.withOpacity(.1),
                        leading: const Icon(Icons.payments_rounded),
                        title: Text('Payment $index', style: TextStyle(color: textColor, fontWeight: FontWeight.w600),),
                        subtitle: Text('Payment details', style:  TextStyle(color: textColor),),
                        trailing: TextButton(onPressed: (){

                        }, child: const Text('More details')),
                      ),
                    ),
                    itemCount: 10,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
