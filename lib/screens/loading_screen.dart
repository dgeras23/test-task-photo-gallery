import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_task1/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:test_task1/utilities/constants.dart';

import 'main_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getUnsplashData() async {
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.unsplash.com/photos/?client_id=$kUnsplashApiKey');

    var decodedData = await networkHelper.getData();

    Navigator.of(context).pushAndRemoveUntil(
        CupertinoPageRoute(
            builder: (context) => MainScreen(
                  unsplashData: decodedData,
                )),
        (Route<dynamic> route) => false);
  }

  @override
  void initState() {
    getUnsplashData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitFoldingCube(
            color: kAccentColor,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'LOADING',
            style: TextStyle(fontSize: 20.0, color: kAccentColor),
          ),
        ],
      ),
    );
  }
}
