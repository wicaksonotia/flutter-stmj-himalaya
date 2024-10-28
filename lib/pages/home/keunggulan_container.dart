import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sumbertugu/commons/containers/box_container.dart';

// ignore: must_be_immutable
class KeunggulanContainer extends StatelessWidget {
  KeunggulanContainer({super.key, required this.text, required this.image});
  String text, image;
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          width: 75,
          height: 90,
          padding: const EdgeInsets.only(top: 7),
          decoration: BoxDecoration(
            color: Colors.grey.shade200.withOpacity(0.5),
            borderRadius: BorderRadius.circular(7),
          ),
          child: Column(
            children: [
              BoxContainer(
                height: 50,
                width: 60,
                radius: 7,
                backgroundColor: Colors.white,
                child: Image(
                  image: AssetImage(image),
                  width: 40,
                  height: 40,
                ),
              ),
              // ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
