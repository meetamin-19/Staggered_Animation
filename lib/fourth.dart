import 'package:flutter/material.dart';
import 'package:untitled4/fifth.dart';

import 'main.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({Key? key}) : super(key: key);

  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Center(
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width * .8,
                  child: Image.asset("assets/images/secondwoborder.png"))),
          Center(
              child: Hero(
            tag: 9,
            child: Transform.rotate(
              angle: 0,
              child: CustomPaint(
                size: Size(MediaQuery.of(context).size.width * .78,
                    (MediaQuery.of(context).size.height * 0.65).toDouble()),
                //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                painter: SecondPainter(),
              ),
            ),
          )),
          Positioned(
              right: 10,
              bottom: 10,
              child: TextButton(
                onPressed: () {
                  Navigator.push(context, FadeRoute(page: FifthScreen()));
                },
                child: Text("Next", style: TextStyle(color: Color(0xffB68B4C))),
              ))
        ],
      ),
    );
  }
}

class SecondPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.9936486, size.height * 0.5390968);
    path_0.cubicTo(
        size.width * 0.9664160,
        size.height * 0.6427877,
        size.width * 0.8516951,
        size.height * 0.7662849,
        size.width * 0.7078605,
        size.height * 0.8589963);
    path_0.cubicTo(
        size.width * 0.6359638,
        size.height * 0.9053389,
        size.width * 0.5568475,
        size.height * 0.9439516,
        size.width * 0.4778501,
        size.height * 0.9685345);
    path_0.cubicTo(
        size.width * 0.3988424,
        size.height * 0.9931192,
        size.width * 0.3200336,
        size.height * 1.003648,
        size.width * 0.2486930,
        size.height * 0.9939181);
    path_0.cubicTo(
        size.width * 0.1773320,
        size.height * 0.9841862,
        size.width * 0.1249401,
        size.height * 0.9591546,
        size.width * 0.08729767,
        size.height * 0.9238510);
    path_0.cubicTo(
        size.width * 0.04963333,
        size.height * 0.8885270,
        size.width * 0.02669251,
        size.height * 0.8428734,
        size.width * 0.01438214,
        size.height * 0.7918771);
    path_0.cubicTo(
        size.width * -0.01024160,
        size.height * 0.6898696,
        size.width * 0.007722713,
        size.height * 0.5667244,
        size.width * 0.03501680,
        size.height * 0.4627914);
    path_0.cubicTo(
        size.width * 0.04867855,
        size.height * 0.4107691,
        size.width * 0.05590594,
        size.height * 0.3641248,
        size.width * 0.06226047,
        size.height * 0.3219050);
    path_0.cubicTo(
        size.width * 0.06250362,
        size.height * 0.3202905,
        size.width * 0.06274548,
        size.height * 0.3186816,
        size.width * 0.06298630,
        size.height * 0.3170782);
    path_0.cubicTo(
        size.width * 0.06904341,
        size.height * 0.2767858,
        size.width * 0.07448553,
        size.height * 0.2405847,
        size.width * 0.08425788,
        size.height * 0.2075438);
    path_0.cubicTo(
        size.width * 0.1045556,
        size.height * 0.1389160,
        size.width * 0.1435152,
        size.height * 0.08398007,
        size.width * 0.2455584,
        size.height * 0.03480559);
    path_0.cubicTo(
        size.width * 0.3284935,
        size.height * -0.005161229,
        size.width * 0.4200129,
        size.height * -0.006679590,
        size.width * 0.5099251,
        size.height * 0.01683212);
    path_0.cubicTo(
        size.width * 0.5998786,
        size.height * 0.04035456,
        size.width * 0.6881731,
        size.height * 0.08892495,
        size.width * 0.7644212,
        size.height * 0.1490577);
    path_0.cubicTo(
        size.width * 0.8406641,
        size.height * 0.2091844,
        size.width * 0.9047959,
        size.height * 0.2808156,
        size.width * 0.9464496,
        size.height * 0.3503818);
    path_0.cubicTo(
        size.width * 0.9881214,
        size.height * 0.4199739,
        size.width * 1.007230,
        size.height * 0.4873799,
        size.width * 0.9936486,
        size.height * 0.5390968);
    path_0.close();

    Paint paint_0_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    paint_0_stroke.color = Color(0xffB68B4C).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_stroke);

    // Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    // paint_0_fill.color = Color(0xff000000).withOpacity(1.0);
    // canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
