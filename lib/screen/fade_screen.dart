import 'package:flutter/material.dart';

class FadeScreen extends StatelessWidget {
  const FadeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () {
          return Future((){
            Navigator.pop(context, 'Fade BackPressed!');
            return false;
          });
        },
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context, 'Fade Pop!');
            },
            child: Text('Pop !'),
          ),
        ),
      ),
    );
  }
}
