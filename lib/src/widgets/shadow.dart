import 'package:flutter/material.dart';

Widget topElevation(Widget child) => Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.grey.shade200, offset: const Offset(0.0, -1.0))
      ]),
      child: child,
    );
