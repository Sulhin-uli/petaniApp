import 'package:flutter/material.dart';

class TimeWeather extends StatelessWidget {
  const TimeWeather({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 400,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xffe7e7e7),
      ),
      // color: Colors.white
      // child: const Card(
      //   color: Colors.white,
      //   clipBehavior: Clip.antiAlias,
      // ),
    );
  }
}
