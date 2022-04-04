import 'package:flutter/material.dart';
import 'package:untitled4/main.dart';

import 'fourth.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen>
    with TickerProviderStateMixin {
  var swipeDirection;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 900), vsync: this);
    _playAnimation();
  }

  @override
  void dispose() {
    reverseAnimation();
    _controller.dispose();
    super.dispose();
  }

  Future<void> _playAnimation() async {
    try {
      await _controller
          .forward()
          .orCancel;
      // await _controller
      //     .reverse()
      //     .orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  Future<void> reverseAnimation() async {
    try {
      await _controller
          .reverse()
          .orCancel;
    } on TickerCanceled {

    }
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) async {
        swipeDirection = details.delta.dx > 0 ? 'right' : 'left';
      },
      onPanEnd: (details) async {
        if (swipeDirection == null || swipeDirection == 'right') {
          return;
        }
        else if (swipeDirection == 'left') {
          Navigator.push(context, FadeRoute(page: const FourthScreen())).then((
              value) => null);
        }
      },
      child: Stack(
        children: [
          StaggeredAnimation2(controller: _controller, final_height: MediaQuery
              .of(context)
              .size
              .height * .5, final_width: MediaQuery
              .of(context)
              .size
              .width * .9),
          // Center(
          //   child: Hero(
          //     tag: 9,
          //     child: CustomPaint(
          //       size: Size(MediaQuery.of(context).size.width * .9,
          //           (MediaQuery.of(context).size.height * .5).toDouble()),
          //       painter: FirstPainter(),
          //     ),
          //   ),
          // ),
          // Center(
          //     child: Hero(
          //       tag: 8,
          //       child: SizedBox(
          //           height: MediaQuery.of(context).size.height * .5,
          //           width: MediaQuery.of(context).size.width * .89,
          //           child: Image.asset("assets/images/firstwoborder.png")),
          //     )),
          Positioned(
              right: 10,
              bottom: 10,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context, FadeRoute(page: const FourthScreen()));
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

class StaggeredAnimation2 extends StatelessWidget {

  StaggeredAnimation2({
    Key? key,
    required this.controller,
    required this.final_height,
    required this.final_width,
  })
      :

  // Each animation defined here transforms its value during the subset
  // of the controller's duration defined by the animation's interval.
  // For example the opacity animation transforms its value during
  // the first 10% of the controller's duration.

        rotation = Tween(begin: -0.5, end: 0.0).animate(CurvedAnimation(
            parent: controller,
            curve: Interval(.1, .6, curve: Curves.easeOutCubic))),
        opacity = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.0,
              .7,
              curve: Curves.ease,
            ),
          ),
        ),
        width = Tween<double>(
          begin: 200.0,
          end: final_width,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.1,
              0.8,
              curve: Curves.easeOutCubic,
            ),
          ),
        ),
        height = Tween<double>(begin: 200.0, end: final_height).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.1,
              0.8,
              curve: Curves.easeOutCubic,
            ),
          ),
        ),
        super(key: key);

  final Animation<double> controller;
  final Animation<double> opacity;
  final Animation<double> width;
  final Animation<double> height;
  final Animation<double> rotation;
  final double final_height;
  final double final_width;

  // This function is called each time the controller "ticks" a new frame.
  // When it runs, all of the animation's values will have been
  // updated to reflect the controller's current value.
  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: Hero(
              tag: 9,
              child: CustomPaint(
                size: Size(MediaQuery
                    .of(context)
                    .size
                    .width * .9,
                    MediaQuery
                        .of(context)
                        .size
                        .height * 0.51),
                //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                painter: FirstPainter(),
              ),
            ),
          ),
          Center(
            child: Opacity(
              opacity: opacity.value,
              child: Container(
                width: width.value,
                height: height.value,
                child: Transform.rotate(
                    angle: rotation.value,
                    child: Image.asset("assets/images/firstwoborder.png")),
              ),
            ),
          ),
        ],
      ),

    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }

}
