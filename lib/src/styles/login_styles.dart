import 'dart:ui';

import 'package:flutter/material.dart';

class LoginStyles {
  final TextStyle style1 = const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final TextStyle style2 = const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black);
  final TextStyle styleButton = const TextStyle(fontSize: 16, color: Colors.black);

  ButtonStyle styleEdgeButton (BuildContext context){
    return ElevatedButton.styleFrom(
        primary: Theme.of(context).primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        )
    );
  }
}