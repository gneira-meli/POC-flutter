import 'package:flutter/material.dart';
import 'package:sdui_module/models/component.dart';

import 'package:sdui_module/render_widgets.dart';

class MeliVerticalScroll extends StatelessWidget {
  final VerticalScrollComponent component;

  MeliVerticalScroll(this.component);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: component.height,
        child: ListView.builder(
            itemBuilder: _buildItem,
            itemCount: component.listComponents.length));
  }

  Widget _buildItem(BuildContext context, int index) {
    return Card(
      child: component.listComponents[index].render(),
    );
  }
}
