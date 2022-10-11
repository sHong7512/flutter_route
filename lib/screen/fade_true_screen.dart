import 'package:flutter/material.dart';

class FadeTrueScreen extends StatelessWidget {
  const FadeTrueScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: WillPopScope(
        onWillPop: () {
          return Future((){
            Navigator.pop(context, 'Fade True BackPressed!');
            return false;
          });
        },
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context, 'Fade True Pop!');
            },
            child: Text('Pop !'),
          ),
        ),
      ),
    );
  }
}
