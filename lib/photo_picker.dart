import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:image_picker/image_picker.dart';

class LoadImage extends StatefulWidget {
  @override
  _LoadImage createState() => _LoadImage();
}

class _LoadImage extends State<LoadImage> {
  File _image;
  dynamic _pickImageError;

  void _getImage(ImageSource source, {BuildContext context}) async {

        try {
          _image = await ImagePicker.pickImage(
              source: source
              );
          setState(() {});
        } catch (e) {
          _pickImageError = e;
        }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Center(
        child: _image == null
            ? Text('No image selected.')
            : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {_getImage(ImageSource.gallery, context: context);
        },
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}