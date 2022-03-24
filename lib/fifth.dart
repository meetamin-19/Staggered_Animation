import 'package:flutter/material.dart';
import 'package:untitled4/third.dart';
import 'main.dart';

class FifthScreen extends StatefulWidget {
  const FifthScreen({Key? key}) : super(key: key);

  @override
  State<FifthScreen> createState() => _FifthScreenState();
}

class _FifthScreenState extends State<FifthScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Center(
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * .51,
                  width: MediaQuery.of(context).size.width * .87,
                  child: Image.asset("assets/images/thirdwoborder.png"))),
          Center(
              child: Hero(
            tag: 9,
            child: Transform.rotate(
                angle: 0,
                child: CustomPaint(
                  size: Size(MediaQuery.of(context).size.width * .77,
                      (MediaQuery.of(context).size.height * .51).toDouble()),
                  //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: ThirdPainter(),
                )),
          )),
          Positioned(
              right: 10,
              bottom: 10,
              child: TextButton(
                onPressed: () {
                  Navigator.push(context, FadeRoute(page: ThirdScreen()));
                },
                child: Text("Next", style: TextStyle(color: Color(0xffB68B4C))),
              ))
        ],
      ),
    );
  }
}

//Add this CustomPaint widget to the Widget Tree

//Copy this CustomPainter code to the Bottom of the File
class ThirdPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.9829147, size.height * 0.3229493);
    path_0.cubicTo(
        size.width * 1.012675,
        size.height * 0.4406744,
        size.width * 0.9963520,
        size.height * 0.5964545,
        size.width * 0.9355600,
        size.height * 0.7286702);
    path_0.cubicTo(
        size.width * 0.8747493,
        size.height * 0.8609302,
        size.width * 0.7696160,
        size.height * 0.9692706,
        size.width * 0.6220747,
        size.height * 0.9927146);
    path_0.cubicTo(
        size.width * 0.4744533,
        size.height * 1.016169,
        size.width * 0.3367387,
        size.height * 0.9618393,
        size.width * 0.2283765,
        size.height * 0.8720338);
    path_0.cubicTo(
        size.width * 0.1200163,
        size.height * 0.7822304,
        size.width * 0.04118960,
        size.height * 0.6570867,
        size.width * 0.01142328,
        size.height * 0.5393383);
    path_0.cubicTo(
        size.width * -0.003440533,
        size.height * 0.4805391,
        size.width * 0.002545691,
        size.height * 0.4345581,
        size.width * 0.02265523,
        size.height * 0.3953594);
    path_0.cubicTo(
        size.width * 0.04277547,
        size.height * 0.3561395,
        size.width * 0.07708000,
        size.height * 0.3236195,
        size.width * 0.1190589,
        size.height * 0.2917992);
    path_0.cubicTo(
        size.width * 0.1400475,
        size.height * 0.2758901,
        size.width * 0.1629344,
        size.height * 0.2601712,
        size.width * 0.1869085,
        size.height * 0.2438816);
    path_0.cubicTo(
        size.width * 0.1899456,
        size.height * 0.2418182,
        size.width * 0.1930003,
        size.height * 0.2397463,
        size.width * 0.1960707,
        size.height * 0.2376617);
    path_0.cubicTo(
        size.width * 0.2172285,
        size.height * 0.2233044,
        size.width * 0.2391323,
        size.height * 0.2084404,
        size.width * 0.2612104,
        size.height * 0.1925822);
    path_0.cubicTo(
        size.width * 0.3117440,
        size.height * 0.1562856,
        size.width * 0.3632347,
        size.height * 0.1147514,
        size.width * 0.4089973,
        size.height * 0.06199873);
    path_0.cubicTo(
        size.width * 0.4693787,
        size.height * 0.02188922,
        size.width * 0.5316480,
        size.height * 0.003466956,
        size.width * 0.5919973,
        size.height * 0.002002922);
    path_0.cubicTo(
        size.width * 0.6524027,
        size.height * 0.0005374905,
        size.width * 0.7109947,
        size.height * 0.01605977,
        size.width * 0.7639520,
        size.height * 0.04397822);
    path_0.cubicTo(
        size.width * 0.8698933,
        size.height * 0.09983023,
        size.width * 0.9531573,
        size.height * 0.2052353,
        size.width * 0.9829147,
        size.height * 0.3229493);
    path_0.close();

    Paint paint_0_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    paint_0_stroke.color = Color(0xffB68B4C).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_stroke);

    // Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    // paint_0_fill.color = Color(0xff000000).withOpacity(1.0);
    // canvas.drawPath(path_0,paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
