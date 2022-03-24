import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class StaggerAnimation extends StatefulWidget {
  StaggerAnimation({Key? key, required this.controller});

  final Animation<double> controller;

  @override
  State<StaggerAnimation> createState() => _StaggerAnimationState();
}

class _StaggerAnimationState extends State<StaggerAnimation> {
  late final Animation<double> opacity;
  late final Animation<double> opacity_border;
  late final Animation<double> rotation;
  late final Animation<double> rotation_border;
  late final Animation<double> width;
  late final Animation<double> width_border;
  late final Animation<double> height;
  late final Animation<double> height_border;

  Widget _buildAnimation(BuildContext context, Widget? child) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          child: SizedBox(
            width: h * 0.6,
            height: w * 0.8,
            child: Opacity(
                opacity: opacity.value,
                child: Hero(
                    tag: 8,
                    child: Image.asset("assets/images/secondwoborder.png"))),
          ),
        ),
        Center(
          child: SizedBox(
              width: w * .78,
              height: h * .65,
              child:
                  Hero(tag: 9, child: Image.asset("assets/images/border.png"))),
          // ),
        )
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    opacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
          parent: widget.controller,
          curve: const Interval(
            0.2,
            0.8,
            curve: Curves.easeInCirc,
          )),
    );
    opacity_border = Tween<double>(
      begin: 1.0,
      end: 1,
    ).animate(CurvedAnimation(
        parent: widget.controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeInCirc)));
    width_border = Tween<double>(
      begin: 150.0,
      end: 320.0,
    ).animate(
      CurvedAnimation(
        parent: widget.controller,
        curve: Curves.ease,
      ),
    );
    width = Tween<double>(
      begin: 300.0,
      end: 300,
    ).animate(
      CurvedAnimation(
        parent: widget.controller,
        curve: Curves.ease,
      ),
    );
    height_border = Tween<double>(begin: 400, end: 440).animate(
      CurvedAnimation(
        parent: widget.controller,
        curve: const Interval(0.3, 1.0, curve: Curves.ease),
      ),
    );
    height = Tween<double>(begin: 200, end: 420).animate(
      CurvedAnimation(
        parent: widget.controller,
        curve: Interval(0.0, 0.8, curve: Curves.ease),
      ),
    );
    rotation_border = Tween(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(
          parent: widget.controller,
          curve: Interval(0.2, .9, curve: Curves.easeInCirc)),
    );
    rotation = Tween(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(
          parent: widget.controller,
          curve: Interval(0.2, 0.6, curve: Curves.easeIn)),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: widget.controller,
    );
  }
}

class StaggerDemo extends StatefulWidget {
  const StaggerDemo({Key? key}) : super(key: key);

  @override
  _StaggerDemoState createState() => _StaggerDemoState();
}

class _StaggerDemoState extends State<StaggerDemo>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
      // await _controller.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 8.0; // 1.0 is normal animation speed.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Staggered Animation'),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          _playAnimation();
        },
        child: Center(
          child: StaggerAnimation(controller: _controller.view),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: StaggerDemo(),
    ),
  );
}
