import 'package:flutter/material.dart';

class EditProfilePicture extends StatefulWidget {
  @override
  State<EditProfilePicture> createState() => _EditProfilePicture();
}

class _EditProfilePicture extends State<EditProfilePicture> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Center(child: Text('EDIT PROFILE PICTURE')),
        backgroundColor: theme.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.photo_camera,
                        color: theme.primaryColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Camera',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.image,
                        color: theme.primaryColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Gallery',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 130.0, // Adjust the desired top position
            left: 80.0, // Adjust the desired left position
            child: Container(
              width: 210.0, // Adjust the width of the circular image
              height: 210.0, // Adjust the height of the circular image
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors
                      .white, // Set the color of the outline (white in this case)
                  width: 2.0, // Set the width of the outline
                ),
                image: DecorationImage(
                  image: AssetImage('images/img_ph.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
