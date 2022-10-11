import 'package:flutter/material.dart';
import 'package:route/route/fade_route.dart';
import 'package:route/route/reveal_route.dart';
import 'package:route/screen/fade_screen.dart';
import 'package:route/screen/fade_true_screen.dart';
import 'package:route/screen/reveal_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String state = 'None';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Last state : $state'),
            ElevatedButton(
              onPressed: () async {
                state = await Navigator.push(
                  context,
                  RevealRoute(
                    page: RevealScreen(),
                    maxRadius: 800,
                    centerAlignment: Alignment.center,
                  ),
                );
                setState(() {});
              },
              child: Text('Reveal Route'),
            ),
            ElevatedButton(
              onPressed: () async {
                state = await Navigator.of(context).push(FadeRoute(child: FadeScreen()));
                setState(() {});
              },
              child: Text('Fade Route Opaque true'),
            ),
            ElevatedButton(
              onPressed: () async{
                state = await Navigator.of(context).push(FadeRoute(
                  child: FadeTrueScreen(),
                  barrierColorCustom: Colors.black.withOpacity(0.7),
                  opaqueCustom: false,
                ));
                setState(() {});
              },
              child: Text('Fade Route Opaque false'),
            ),
          ],
        ),
      ),
    );
  }
}
