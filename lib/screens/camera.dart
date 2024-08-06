import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class CameraScreen extends StatelessWidget {
  const CameraScreen({Key? key}) : super(key: key);

  Future<void> _pickAndUploadImage(String folderName) async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      final File file = File(pickedFile.path);
      try {
        // Upload to Firebase Storage
        final ref = FirebaseStorage.instanceFor(
            bucket: "gs://rmbw-d3fa2.appspot.com"
        ).ref('$folderName/${DateTime.now().millisecondsSinceEpoch}.jpg');
        await ref.putFile(file);
        final String downloadURL = await ref.getDownloadURL();

        // Save the image URL to Firestore
        await FirebaseFirestore.instance.collection('camera').add({
          'url': downloadURL,
          'folder': folderName,
          'timestamp': FieldValue.serverTimestamp(),
        });

        print('Image uploaded to $folderName folder and URL saved to Firestore');
      } catch (e) {
        print('Error uploading image: $e');
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Upload'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16.0),
        child:
        FloatingActionButton(
          onPressed: () => _pickAndUploadImage('camera'),
          child: Icon(Icons.camera_alt),
        ),
        
      ),
    );
  }
}
