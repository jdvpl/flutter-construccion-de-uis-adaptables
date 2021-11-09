import 'package:api_rest_ui/widgets/circle.dart';
import 'package:api_rest_ui/widgets/icon_container.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double pinkSize = size.width * 0.8;
    final double orangeSize = size.width * 0.57;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: -pinkSize * .4,
              right: -pinkSize * .2,
              child: Circle(
                size: pinkSize,
                colors: [
                  Colors.pinkAccent,
                  Colors.pink,
                ],
              ),
            ),
            Positioned(
              top: -orangeSize * .55,
              left: -orangeSize * .15,
              child: Circle(
                size: orangeSize,
                colors: [
                  Colors.orange,
                  Colors.deepOrangeAccent,
                ],
              ),
            ),
            Positioned(
              top: pinkSize * 0.37,
              child: IconContainer(size: size.width * 0.17),
            )
          ],
        ),
      ),
    );
  }
}
