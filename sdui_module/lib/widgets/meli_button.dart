import 'package:flutter/material.dart';
import 'package:sdui_module/models/component.dart';

class MeliButton extends StatelessWidget {

  final ButtonComponent component;
  final Function() onPressed;

  MeliButton({required this.component, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(component.text)
    );
  }
}

