import 'package:flutter/material.dart';

class RevealScreen extends StatelessWidget {
  const RevealScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: WillPopScope(
        onWillPop: () {
          return Future((){
            Navigator.pop(context, 'Reveal BackPressed!');
            return false;
          });
        },
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context, 'Reveal Pop!');
            },
            child: Text('Pop !'),
          ),
        ),
      ),
    );
  }
}
