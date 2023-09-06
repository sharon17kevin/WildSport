import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../components/textfield.dart';

class NewsManagement extends StatefulWidget {
  @override
  State<NewsManagement> createState() => _NewsManagementState();
}

class _NewsManagementState extends State<NewsManagement> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController subtitleController = TextEditingController();
    final TextEditingController iconController = TextEditingController();
    File? _selectedImage;
    var isNew = false.obs;
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
              SizedBox(height: 25,),
              Text('Title'),
              MyTextField(
                  controller: titleController,
                  hintText: 'Input Team Name',
                  obscureText: false
              ),
              SizedBox(height: 25,),
              Text('Subtitle'),
              MyTextField(
                  controller: subtitleController,
                  hintText: 'Input Color Code',
                  obscureText: false
              ),
              SizedBox(height: 25,),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Priority'),
                  Obx(
                      () => Checkbox(
                        value: isPriority.value,
                        onChanged: (newValue) {
                          isPriority.value = newValue!;
                        }
                    ),
                  )
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Thumbnail'),
                  SizedBox(width: 10,),
                  ElevatedButton(
                    onPressed: (){
                      _pickImageFromGallery();
                    },
                    child: Text('Select Image'),
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
                child: Text('Enter Author Information',
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
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: (){
                                isNew.value = true;
                              },
                              child: Text('Author Login',
                                style: TextStyle(
                                    color: Colors.white
                                ),),
                            ),
                            ElevatedButton(
                              onPressed: (){
                                isNew.value = true;
                              },
                              child: Text('Author Login',
                              style: TextStyle(
                                color: Colors.white
                              ),),
                            ),
                          ],
                        ),
                      ),
                      Text('Author Name'),
                      MyTextField(
                          controller: iconController,
                          hintText: 'Input Icon',
                          obscureText: false
                      ),
                      ElevatedButton(
                        onPressed: (){
                          _pickImageFromGallery();
                        },
                        child: Text('Select Icon'),
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
