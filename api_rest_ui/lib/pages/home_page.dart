import 'package:api_rest_ui/widgets/circle.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Stack(
          children: [
            Positioned(
              top: -100,
              right: -50,
              child: Circle(
                size: 340,
                colors: [
                  Colors.pinkAccent,
                  Colors.pink,
                ],
              ),
            ),
            Positioned(
              left: -50,
              top: -100,
              child: Circle(
                size: 240,
                colors: [
                  Colors.orange,
                  Colors.deepOrangeAccent,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
