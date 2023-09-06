//import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wild_sport/components/textfield.dart';

class TeamRegistration extends StatefulWidget {
  @override
  State<TeamRegistration> createState() => _TeamRegistrationState();
}

class _TeamRegistrationState extends State<TeamRegistration> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController jerseyController = TextEditingController();
    final TextEditingController iconController = TextEditingController();
    File? _selectedImage;
    Future<void> _pickImage(ImageSource source) async {
      try {
        final pickedFile = await ImagePicker().pickImage(source: source);

        if (pickedFile != null) {
          print('Image selected: ${pickedFile.path}');
          setState(() {
            _selectedImage = File(pickedFile.path);
          });
        } else {
          print('No image selected.');
          return;
        }
      } catch (e) {
        print('Error picking image: $e');
      }
    }
    Future _pickImageFromGallery() async {
      final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (returnedImage == null){
        return;
      }
      setState(() {
        _selectedImage = File(returnedImage!.path);
      });
    }

    return SafeArea(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 25,),
              Text('Team Name'),
              MyTextField(
                controller: nameController,
                hintText: 'Input Team Name',
                obscureText: false
              ),
              SizedBox(height: 25,),
              Text('Team Color Code'),
              MyTextField(
                  controller: jerseyController,
                  hintText: 'Input Color Code',
                  obscureText: false
              ),
              SizedBox(height: 25,),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Team Logo'),
                  SizedBox(width: 10,),
                  ElevatedButton(
                    onPressed: (){
                      _pickImageFromGallery();
                    },
                    child: Text('Select Icon'),
                  ),
                  SizedBox(width: 10,),
                  if (_selectedImage != null) Image.file(_selectedImage!) else const Text('Select yo'),
                ],
              ),
              Container(
                color: Get.theme.primaryColor,
                width: MediaQuery.of(context).size.width * 0.85,
                height: 150,
                child: SingleChildScrollView(
                  child: Text(
                    'This is a long text that will be scrollable vertically. It is a multi-line text and will be scrollable vertically as well.',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 25,),
              Container(
                padding: EdgeInsets.all(5),
                  child: Text('Enter Player Information',
                    style: TextStyle(
                      color: Get.isDarkMode? Colors.black: Colors.white,
                    ),
                  ),
                decoration: BoxDecoration(
                  color: Get.theme.primaryColorDark,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5)
                  )
                ),
              ),
              Container(
                color: Get.theme.primaryColor,
                child: Column(
                  children: [
                    Text('Player Name'),
                    MyTextField(
                        controller: iconController,
                        hintText: 'Input Icon',
                        obscureText: false
                    ),
                    Text('Position'),
                    MyTextField(
                        controller: iconController,
                        hintText: 'Input Icon',
                        obscureText: false
                    ),
                    Text('Age'),
                    MyTextField(
                        controller: iconController,
                        hintText: 'Input Icon',
                        obscureText: false
                    ),
                    ElevatedButton(
                      onPressed: (){
                        _pickImageFromGallery();
                      },
                      child: Text('Select Image'),
                    ),
                  ],
                )
              ),
              SizedBox(height: 25,),
              GestureDetector(
                onTap: (){},
                child: Container(
                  height: 70,
                  width: 150,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 25,),
            ],
          ),
        ),
      ),
    );
  }
}
