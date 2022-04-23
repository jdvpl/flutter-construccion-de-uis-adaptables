import 'package:api_rest_ui/utils/responsive.dart';
import 'package:api_rest_ui/widgets/circle.dart';
import 'package:api_rest_ui/widgets/icon_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = "register";
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    // clase responsive
    final Responsive responsive = Responsive.of(context);
    final double pinkSize = responsive.wp(88);
    final double orangeSize = responsive.wp(57);
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: responsive.height,
            color: Colors.white,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: -pinkSize * .25,
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
                  top: -orangeSize * .3,
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
                  top: pinkSize * 0.25,
                  child: Column(
                    children: [
                      Text(
                        "Hello\nSign Up to get stated!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: responsive.dp(1.6), color: Colors.white),
                      ),
                      SizedBox(height: responsive.hp(5)),
                      ClipOval(
                        child: Image.network(
                          'https://www.w3schools.com/howto/img_avatar.png',
                          width: responsive.wp(28),
                          height: responsive.wp(28),
                        ),
                      )
                    ],
                  ),
                ),

                Positioned(
                    left: 15,
                    top: 15,
                    child: SafeArea(
                      child: CupertinoButton(
                        color: Colors.black26,
                        padding: EdgeInsets.all(10),
                        borderRadius: BorderRadius.circular(50),
                        child: Icon(Icons.arrow_back),
                        onPressed: () {},
                      ),
                    ))
                // LoginForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
