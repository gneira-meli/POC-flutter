import 'package:flutter/material.dart';
import 'package:sdui_module/models/component.dart';

class MeliTopBar extends StatelessWidget {

  final TopBarComponent component;

  MeliTopBar(this.component);

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(component.title));
  }
}

