import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wild_sport/components/textfield.dart';
import 'package:wild_sport/controllers/breakingNewsController.dart';
import 'package:wild_sport/models/breakingNewsModel.dart';

class VideoManagement extends StatefulWidget {
  @override
  State<VideoManagement> createState() => _VideoManagementState();
}

class _VideoManagementState extends State<VideoManagement> {
  @override
  Widget build(BuildContext context) {
    BreakingNewsController breakingNewsController = Get.find<BreakingNewsController>();
    final TextEditingController titleController = TextEditingController();
    final TextEditingController subtitleController = TextEditingController();
    final TextEditingController iconController = TextEditingController();
    File? _selectedImage;
    File? _selectedVideo;
    var isNew = false.obs;
    Future _pickImageFromGallery() async {
      final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (returnedImage == null){
        return;
      }
      setState(() {
        _selectedImage = File(returnedImage!.path);
      });
    }
    Future _pickVideoFromGallery() async {
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
                  hintText: 'Input Title',
                  obscureText: false
              ),
              SizedBox(height: 25,),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Video'),
                  SizedBox(width: 10,),
                  Ink(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Get.isDarkMode? Colors.white : Colors.black
                    ),
                    child: InkWell(
                      onTap: () {
                        _pickVideoFromGallery();
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text('Select Video',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Get.isDarkMode? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  if (_selectedImage != null) Image.file(_selectedImage!) else const Text('Select'),
                ],
              ),
              SizedBox(height: 25,),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Thumbnail'),
                  SizedBox(width: 10,),
                  Ink(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Get.isDarkMode? Colors.white : Colors.black
                    ),
                    child: InkWell(
                      onTap: () {
                        _pickImageFromGallery();
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text('Select Image',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Get.isDarkMode? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  if (_selectedImage != null) Image.file(_selectedImage!) else const Text('Select'),
                ],
              ),

              SizedBox(height: 25,),
              Ink(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Get.isDarkMode? Colors.white : Colors.black
                ),
                child: InkWell(
                  onTap: () async {
                    // BreakingNews breakingNews = BreakingNews(
                    //     thumbnail:  Thumbnail(name: "", contentType: ""),
                    //     id: '',
                    //     title: titleController.text,
                    //     subtitle: subtitleController.text,
                    //     bookmark: false,
                    //     author: "",
                    //     timestamp: DateTime.now(),
                    //     imageUrl: "",
                    //     priority: isPriority.value,
                    //     v: 0);
                    // await breakingNewsController.postNews(breakingNews, _selectedImage!);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text('Upload',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Get.isDarkMode? Colors.black : Colors.white,
                      ),
                    ),
                  ),
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
