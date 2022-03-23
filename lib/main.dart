import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled4/second.dart';





void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var swipeDirection;

  @override
  Widget build(BuildContext context) {
    return StaggerDemo();
    //   GestureDetector(
    //   onPanUpdate: (details) async {
    //     swipeDirection = details.delta.dx > 0 ? 'left' : 'right';
    //   },
    //   onPanEnd: (details) async {
    //     if (swipeDirection == null || swipeDirection == 'left') {
    //       return;
    //     }
    //     else if (swipeDirection == 'right') {
    //       Navigator.push(context, FadeRoute(page: SecondPage()));
    //     }
    //   },
    //   child: Scaffold(
    //     backgroundColor: Colors.black,
    //     body: Stack(
    //       children: [
    //         Column(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: <Widget>[
    //             InkWell(
    //               onTap: () {
    //                 Navigator.of(context).push(FadeRoute(page: SecondPage()));
    //               },
    //               child: Center(
    //                 child: Padding(
    //                   padding: EdgeInsets.only(
    //                       top: MediaQuery
    //                           .of(context)
    //                           .size
    //                           .height * .15),
    //                   child: SizedBox(
    //                     height: MediaQuery
    //                         .of(context)
    //                         .size
    //                         .height * .47,
    //                     width: MediaQuery
    //                         .of(context)
    //                         .size
    //                         .width * .92,
    //                     child: Stack(
    //                       children: [
    //                         Positioned(
    //                           left: MediaQuery.of(context).size.width *.2,
    //                           top: MediaQuery.of(context).size.height * .3,
    //                           child: Hero(
    //                             tag: 11,
    //                             child: Container(
    //                               color: Colors.transparent,
    //                               height: 10,
    //                               width: 10,
    //                             ),
    //                           ),
    //                         ),
    //
    //                         // Image.asset("assets/images/first.png")
    //
    //                         CustomPaint(
    //                           size: Size(MediaQuery
    //                               .of(context)
    //                               .size
    //                               .width,
    //                               (MediaQuery
    //                                   .of(context)
    //                                   .size
    //                                   .width * 1.0270935960591132).toDouble()),
    //                           //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
    //                           painter: FirstPicPainter(),
    //                         ),
    //
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //         buildPositioned(context, SecondPage())
    //       ],
    //     ), // This trailing comma makes auto-formatting nicer for build methods.
    //   ),
    // );
  }
}

Positioned buildPositioned(BuildContext context, Widget route) {
  return Positioned(
      bottom: 5,
      right: 5,
      child: TextButton(
        child: const Text(
          "Next",
          style: TextStyle(
              color: Color(0xffB68B4C),
              fontSize: 18,
              fontWeight: FontWeight.w400),
        ),
        onPressed: () {
          Navigator.of(context).push(FadeRoute(page: route));
        },
      ));
}


class FadeRoute extends PageRouteBuilder {
  final Widget page;

  FadeRoute({required this.page})
      : super(
    pageBuilder: (BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,) =>
    page,
    transitionDuration: const Duration(milliseconds: 400),
    transitionsBuilder: (BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,) =>
        FadeTransition(
          opacity: animation,
          child: child,
          alwaysIncludeSemantics: true,
        ),
  );
}

class SecondPage extends StatelessWidget {

  var swipeDirection;

  SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) async {
        swipeDirection = details.delta.dx > 0 ? 'left' : 'right';
      },
      onPanEnd: (details) async {
        if (swipeDirection == null) {
          return;
        }
        else if (swipeDirection == 'left') {
          Navigator.pop(context);
        }
        else if (swipeDirection == 'right') {
          Navigator.push(context, FadeRoute(page: ThirdPage()));
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: MediaQuery
                        .of(context)
                        .size
                        .height * .08),
                    child: SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.58,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * .9,
                      child: Hero(
                          tag: 11,
                          child:

                          // Image.asset("assets/images/second.png")

                        CustomPaint(
                            size: Size(MediaQuery
                                .of(context)
                                .size
                                .width, (MediaQuery
                                .of(context)
                                .size
                                .width * 1.4109589041095891).toDouble()),
                            //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                            painter: SecondCustomPainter(),
                          )),
                    ),
                  ),
                ),
              ],
            ),
            buildPositioned(context, ThirdPage())
          ],
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {

  var swipeDirection;

  ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) async {
        swipeDirection = details.delta.dx > 0 ? 'left' : 'right';
      },
      onPanEnd: (details) async {
        if (swipeDirection == null || swipeDirection == 'right') {
          return;
        }
        else if (swipeDirection == 'left') {
          Navigator.pop(context);
        }
      },

      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
          Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery
                  .of(context)
                  .size
                  .height * .12),
              child: Center(
                child: SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * .51,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * .87,
                  child: CustomPaint(
                    size: Size(MediaQuery
                        .of(context)
                        .size
                        .width,
                        (MediaQuery
                            .of(context)
                            .size
                            .width * 1.0270935960591132).toDouble()),
                    //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                    painter: FirstPicPainter(),
                  ),
                ),
              ),
            )
              ],
            ),
            buildPositioned(context, MyHomePage())
          ],
        ),
      ),
    );
  }
}


//Copy this CustomPainter code to the Bottom of the File
class FirstPicPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.4149064, size.height);
    path_0.cubicTo(size.width * 0.6821404, size.height, size.width,
        size.height * 0.6137290, size.width, size.height * 0.3528777);
    path_0.cubicTo(
        size.width, size.height * 0.09202614, size.width * 0.7711281, 0,
        size.width * 0.5038941, 0);
    path_0.cubicTo(size.width * 0.2366586, 0, 0, size.height * 0.1582585, 0,
        size.height * 0.4191103);
    path_0.cubicTo(
        0, size.height * 0.6799616, size.width * 0.1476709, size.height,
        size.width * 0.4149064, size.height);
    path_0.close();

    Paint paint_0_fill = Paint()
      ..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xffC4C4C4).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


//Copy this CustomPainter code to the Bottom of the File
class SecondCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.3725726, size.height * 0.9987748);
    path_0.cubicTo(
        size.width * 0.6698137, size.height * 0.9987748, size.width * 0.9999699,
        size.height * 0.6633883, size.width * 0.9999699,
        size.height * 0.4521728);
    path_0.cubicTo(
        size.width * 0.9999699, size.height * 0.2409553, size.width * 0.4073973,
        size.height * -0.1456678, size.width * 0.1164077,
        size.height * 0.05702641);
    path_0.cubicTo(size.width * -0.01577986, size.height * 0.1491035,
        size.width * -0.006224411, size.height * 0.2350272,
        size.width * 0.007594740, size.height * 0.3592893);
    path_0.cubicTo(size.width * 0.01242556, size.height * 0.4027301,
        size.width * 0.01777740, size.height * 0.4508544,
        size.width * 0.01777740, size.height * 0.5055631);
    path_0.cubicTo(size.width * 0.01777740, size.height * 0.7167786,
        size.width * 0.07532932, size.height * 0.9987748,
        size.width * 0.3725726, size.height * 0.9987748);
    path_0.close();

    Paint paint0Fill = Paint()
      ..style = PaintingStyle.fill;
    paint0Fill.color = Color(0xffC4C4C4).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

