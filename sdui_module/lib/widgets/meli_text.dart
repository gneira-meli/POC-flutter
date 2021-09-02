import 'package:flutter/material.dart';
import 'package:sdui_module/models/component.dart';

class MeliText extends StatelessWidget {

  final TextComponent component;

  MeliText(this.component);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Text(
            component.text,
            style: TextStyle(fontSize: component.textSize),
          ),
    );
  }
}

