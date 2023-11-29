import 'package:flutter/material.dart';
import 'package:sport_updates/style/color.dart';


const shimmerGradient = LinearGradient(
  colors: [
    // Color(0xffebebf4),
    kBlack,
    // Color(0xfff4f4f4),
    Color.fromARGB(255, 63, 63, 63),
    kBlack,
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);
