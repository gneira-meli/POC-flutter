

import 'package:flutter/cupertino.dart';
import 'package:sdui_module/widgets/meli_button.dart';
import 'package:sdui_module/widgets/meli_row_detail.dart';
import 'package:sdui_module/widgets/meli_text.dart';
import 'package:sdui_module/widgets/meli_top_bar.dart';
import 'package:sdui_module/widgets/meli_vertical_scroll.dart';

import 'models/component.dart';

extension ExtendedRenderComponent on Component {

  Widget render() {

    switch(this.runtimeType){

      case ColumnComponent:
        return Column(children: (this as ColumnComponent).listComponents.map((e) => e.render()).toList());

      case VerticalScrollComponent:
        return MeliVerticalScroll(this as VerticalScrollComponent);

      case RowComponent:
        return Row(children: (this as ColumnComponent).listComponents.map((e) => e.render()).toList());

      case TopBarComponent:
        return MeliTopBar(this as TopBarComponent);

      case TextComponent:
        return MeliText(this as TextComponent);

      case ButtonComponent:
        return MeliButton(component : this as ButtonComponent, onPressed: (){});

      case RowDetailsComponent:
        return MeliRowDetails(component : this as RowDetailsComponent);

    }

    return SizedBox();
  }
}