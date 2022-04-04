// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that
// can be found in the LICENSE file.

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

import 'fourth.dart';

class StaggerAnimation extends StatelessWidget {
  StaggerAnimation({
    Key? key,
    required this.controller,
    required this.final_height,
    required this.final_width,
  })  :
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
              .8,
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
          Positioned(
            left: 40,
            top: 140,
            child: Hero(
              tag: 9,
              child: CustomPaint(
                size: Size(MediaQuery.of(context).size.width * .8,
                    MediaQuery.of(context).size.height * 0.6),
                //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                painter: SecondPainter(),
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
                    child: Image.asset("assets/images/secondwoborder.png")),
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
