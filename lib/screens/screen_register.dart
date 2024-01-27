// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, no_logic_in_create_state

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_list/app_colors.dart';
import 'package:task_list/screens/screen_profile.dart';

class ScreenRegister extends StatefulWidget {

  final Function() toggleTheme;

  ScreenRegister(this.toggleTheme);

  @override
  State<ScreenRegister> createState() => _ScreenRegisterState(toggleTheme);
}

class _ScreenRegisterState extends State<ScreenRegister> {

  final Function() toggleTheme;

  File? _imageFile;

  final TextEditingController _controller = TextEditingController();

  _ScreenRegisterState(this.toggleTheme);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: Icon(null),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ScreenProfile(toggleTheme, _imageFile, _controller.text)
                  )
              );
            },
            child: Text(
              "Done",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            )
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundColor: AppColors.defAvatarBg,
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: CircleAvatar(
                      radius: 72,
                      backgroundColor: AppColors.defAvatarBg,
                      backgroundImage: _imageFile != null ? FileImage(_imageFile!) : null,
                    ),
                  ),
                ),
                SizedBox(height: 16,),
                ElevatedButton(
                  onPressed: () {
                    _getImageFromCamera();
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 4,
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                    child: Text(
                      "Upload from Camera",
                      style: TextStyle(
                          color: AppColors.onPrimaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16,),
                ElevatedButton(
                  onPressed: () {
                    _getImageFromGallery();
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 4,
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                    child: Text(
                      "Upload from Gallery",
                      style: TextStyle(
                          color: AppColors.onPrimaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Divider(
                    thickness: 1,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(height: 16,),
                TextFormField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: "Enter Your Name",
                    hintStyle: TextStyle(
                      color: AppColors.hint,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _getImageFromCamera() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _getImageFromGallery() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

}
