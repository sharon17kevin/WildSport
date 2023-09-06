import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wild_sport/components/intTextField.dart';
import 'package:wild_sport/components/textfield.dart';

class MatchManagement extends StatefulWidget {
  @override
  _MatchManagementState createState() => _MatchManagementState();
}

class _MatchManagementState extends State<MatchManagement> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController jerseyController = TextEditingController();
    final TextEditingController iconController = TextEditingController();
    File? _selectedImage;
    var isPriority = false.obs;
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
              SizedBox(height: 10,),
              Text('Day'),
              IntTextField(
                  controller: nameController,
                  hintText: 'Input Team Name',
                  obscureText: false
              ),
              SizedBox(height: 10,),
              Text('Month'),
              IntTextField(
                  controller: jerseyController,
                  hintText: 'Input Color Code',
                  obscureText: false
              ),
              SizedBox(height: 10,),
              Text('Year'),
              IntTextField(
                  controller: jerseyController,
                  hintText: 'Input Color Code',
                  obscureText: false
              ),
              SizedBox(height: 10,),
              Text('Away Team Name'),
              MyTextField(
                  controller: nameController,
                  hintText: 'Input Team Name',
                  obscureText: false
              ),
              SizedBox(height: 10,),
              Text('Home  Team Name'),
              MyTextField(
                  controller: nameController,
                  hintText: 'Input Team Name',
                  obscureText: false
              ),
              SizedBox(height: 10,),
              Text('Game Week'),
              MyTextField(
                  controller: nameController,
                  hintText: 'Input Team Name',
                  obscureText: false
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
