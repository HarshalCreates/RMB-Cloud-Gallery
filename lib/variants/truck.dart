import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'dart:io';

class Truck extends StatefulWidget {
  @override
  _TruckState createState() => _TruckState();
}

class _TruckState extends State<Truck> {
  List<String> imageUrls = [];
  final String _passcode = "8787";

  @override
  void initState() {
    super.initState();
    fetchImageUrls();
  }

  Future<void> fetchImageUrls() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('truck').get();
      List<String> urls = snapshot.docs.map((doc) => doc['url'] as String).toList();
      setState(() {
        imageUrls = urls;
      });
    } catch (e) {
      print('Error fetching image URLs: $e');
    }
  }

  Future<void> pickAndUploadImages() async {
    final picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage();

    if (pickedFiles != null && pickedFiles.isNotEmpty) {
      try {
        for (var pickedFile in pickedFiles) {
          File imageFile = File(pickedFile.path);
          String fileName = pickedFile.name;
          Reference storageRef = FirebaseStorage.instanceFor(
              bucket: "gs://rmbw-d3fa2.appspot.com"
          ).ref().child('truck/$fileName');
          UploadTask uploadTask = storageRef.putFile(imageFile);
          TaskSnapshot snapshot = await uploadTask;

          String downloadUrl = await snapshot.ref.getDownloadURL();
          await FirebaseFirestore.instance.collection('truck').add({'url': downloadUrl});

          setState(() {
            imageUrls.add(downloadUrl);
          });
        }
      } catch (e) {
        print('Error uploading images: $e');
      }
    }
  }

  void showPasscodeDialog({required Function onCorrectPasscode}) {
    showDialog(
      context: context,
      builder: (context) {
        String enteredPasscode = "";
        return AlertDialog(
          title: Text("Enter Passcode"),
          content: TextField(
            obscureText: true,
            onChanged: (value) {
              enteredPasscode = value;
            },
            decoration: InputDecoration(
              hintText: "Passcode",
            ),
          ),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("OK"),
              onPressed: () {
                if (enteredPasscode == _passcode) {
                  Navigator.of(context).pop();
                  onCorrectPasscode();
                } else {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Incorrect passcode")),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> deleteImage(String url) async {
    try {
      // Find the document ID containing the URL
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('truck').where('url', isEqualTo: url).get();
      if (snapshot.docs.isNotEmpty) {
        String docId = snapshot.docs.first.id;

        // Delete from Firestore
        await FirebaseFirestore.instance.collection('truck').doc(docId).delete();

        // Delete from Storage
        Reference storageRef = FirebaseStorage.instanceFor(
            bucket: "gs://rmbw-d3fa2.appspot.com"
        ).refFromURL(url);
        await storageRef.delete();

        setState(() {
          imageUrls.remove(url);
        });
      }
    } catch (e) {
      print('Error deleting image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Gallery'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){ showPasscodeDialog(onCorrectPasscode: pickAndUploadImages);}
          ),
        ],
      ),
      body: imageUrls.isEmpty
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
        padding: EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FullScreenImagePage(
                    imageUrls: imageUrls,
                    initialIndex: index,
                    onDelete: (url) {
                      showPasscodeDialog(onCorrectPasscode: () {
                        deleteImage(url);
                        Navigator.pop(context); // Close the FullScreenImagePage
                      });
                    },
                  ),
                ),
              );
            },
            child: Image.network(
              imageUrls[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}

class FullScreenImagePage extends StatelessWidget {
  final List<String> imageUrls;
  final int initialIndex;
  final Function(String) onDelete;

  FullScreenImagePage({
    required this.imageUrls,
    required this.initialIndex,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.delete, color: Colors.white),
            onPressed: () {
              String urlToDelete = imageUrls[initialIndex];
              onDelete(urlToDelete);
            },
          ),
        ],
      ),
      body: PhotoViewGallery.builder(
        scrollPhysics: BouncingScrollPhysics(),
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(imageUrls[index]),
            initialScale: PhotoViewComputedScale.contained,
            heroAttributes: PhotoViewHeroAttributes(tag: imageUrls[index]),
          );
        },
        itemCount: imageUrls.length,
        pageController: PageController(initialPage: initialIndex),
        onPageChanged: (index) {},
      ),
    );
  }
}
