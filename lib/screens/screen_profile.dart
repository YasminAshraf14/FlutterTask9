// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:task_list/app_colors.dart';
import 'package:task_list/screens/screen_create_task.dart';

class ScreenProfile extends StatelessWidget {

  final Function() _toggleTheme;

  final File? _imageFile;

  final String _name;

  ScreenProfile(this._toggleTheme, this._imageFile, this._name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).primaryColor,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                _toggleTheme();
              },
              icon: Icon(
                Icons.sunny,
                color: Theme.of(context).primaryColor,
              )
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
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
                    backgroundImage: _imageFile != null ? FileImage(_imageFile) : null,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      _name,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.edit_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                ],
              ),
              SizedBox(height: 16,),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ScreenCreateTask(),)
                  );
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
                    "Create Task",
                    style: TextStyle(
                        color: AppColors.onPrimaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.normal
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
