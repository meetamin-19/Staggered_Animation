import 'package:flutter/material.dart';

import 'fourth.dart';
import 'main.dart';

class FirstAgain extends StatefulWidget {
  const FirstAgain({Key? key}) : super(key: key);

  @override
  State<FirstAgain> createState() => _FirstAgainState();
}

class _FirstAgainState extends State<FirstAgain> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * .5,
                  width: MediaQuery.of(context).size.width * .89,
                  child: Image.asset("assets/images/firstwoborder.png"))),
          Center(
            child: Hero(
              tag: 9,
              child: CustomPaint(
                size: Size(MediaQuery.of(context).size.width * .9,
                    (MediaQuery.of(context).size.height * .5).toDouble()),
                painter: FirstPainter(),
              ),
            ),
          ),
          Positioned(
              right: 10,
              bottom: 10,
              child: TextButton(
                onPressed: () {
                  Navigator.push(context, FadeRoute(page: FourthScreen()));
                },
                child: const Text("Next",
                    style: TextStyle(color: Color(0xffB68B4C))),
              ))
        ],
      ),
    );
  }
}

//Add this CustomPaint widget to the Widget Tree

//
// //Copy this FirstPainter code to the Bottom of the File
class FirstPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.9569437, size.height * 0.1874149);
    path_0.cubicTo(
        size.width * 1.013821,
        size.height * 0.3005767,
        size.width * 1.009404,
        size.height * 0.4713455,
        size.width * 0.9590639,
        size.height * 0.6266362);
    path_0.cubicTo(
        size.width * 0.9087187,
        size.height * 0.7819542,
        size.width * 0.8125908,
        size.height * 0.9213227,
        size.width * 0.6865754,
        size.height * 0.9720275);
    path_0.cubicTo(
        size.width * 0.5605908,
        size.height * 1.022719,
        size.width * 0.4278465,
        size.height * 0.9927963,
        size.width * 0.3122123,
        size.height * 0.9217162);
    path_0.cubicTo(
        size.width * 0.1965752,
        size.height * 0.8506362,
        size.width * 0.09823478,
        size.height * 0.7384897,
        size.width * 0.04126880,
        size.height * 0.6251487);
    path_0.cubicTo(
        size.width * -0.07243913,
        size.height * 0.3989130,
        size.width * 0.08180179,
        size.height * 0.1715824,
        size.width * 0.3344783,
        size.height * 0.06991442);
    path_0.cubicTo(
        size.width * 0.4609054,
        size.height * 0.01904462,
        size.width * 0.5881611,
        size.height * -0.008101350,
        size.width * 0.6979668,
        size.height * 0.005725652);
    path_0.cubicTo(
        size.width * 0.8076726,
        size.height * 0.01954037,
        size.width * 0.9000742,
        size.height * 0.07426362,
        size.width * 0.9569437,
        size.height * 0.1874149);
    path_0.close();

    Paint paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    paint0Stroke.color = const Color(0xffB68B4C).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Stroke);

    // Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    // paint_0_fill.color = Color(0xff000000).withOpacity(1.0);
    // canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
