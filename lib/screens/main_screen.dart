import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_task1/screens/image_screen.dart';
import 'package:test_task1/utilities/constants.dart';

class MainScreen extends StatefulWidget {
  final unsplashData;
  MainScreen({this.unsplashData});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.image,
          color: Colors.black,
        ),
        title: Text(
          'Simple photo gallery',
          style: kAppBarTextStyle,
        ),
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: widget.unsplashData.length,
        itemBuilder: _getPhotoText,
      ),
    );
  }

  Widget _getPhotoText(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ImageScreen(
                      url: widget.unsplashData[index]['urls']['regular'],
                      authorName: widget.unsplashData[index]['user']['name'],
                    )));
      },
      child: Card(
        child: ListTile(
          leading: Image.network(
            widget.unsplashData[index]['urls']['thumb'],
            fit: BoxFit.cover,
            width: 110.0,
          ),
          title: Text(
            'picture`s name',
            style: kPictureNameStyle,
          ),
          subtitle: Text(
            widget.unsplashData[index]['user']['name'],
            style: kCardUserNameTextStyle,
          ),
        ),
      ),
    );
  }
}
