// TODO Implement this library.

import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({Key? key}) : super(key: key);

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  XFile? _pickedImage;

  void_PickImage() async {
    final ImagePicker _picker = ImagePicker();

    final pickedImageFile = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _pickedImage = pickedImageFile;
    });
  }

  void_PickGallery() async {
    final ImagePicker _picker = ImagePicker();

    final pickedImageFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _pickedImage = pickedImageFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CircleAvatar(
        radius: 70,
        backgroundImage:
            _pickedImage != null ? FileImage(File(_pickedImage!.path)) : null,
      ),

    TextButton.icon(
    onPressed: (){
    _showBottomSheet();
    },
    icon: const Icon(Icons.add_a_photo),
    label: const Text('Add Image'),
    ),
    ]);
  }

  _showBottomSheet() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('gallery'),
                  onTap: () {
                    void_PickGallery();
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.camera),
                  title: const Text('camera'),
                  onTap: () {
                    void_PickImage();
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          );
        });
  }
}

