import 'dart:core';

class Component {

  Component._(this.viewType);

  String viewType;

  factory Component.topBar(String viewType, String title) = TopBarComponent;
  factory Component.column(String viewType, List<Component> listComponents) = ColumnComponent;
  factory Component.row(String viewType, List<Component> listComponents) = RowComponent;
  factory Component.text(String viewType, String layoutId, String text, double textSize) = TextComponent;
  factory Component.button(String viewType, String layoutId, String text) = ButtonComponent;
  factory Component.verticalScroll(String viewType, double height, List<Component> listComponents)= VerticalScrollComponent;
  factory Component.rowDetails(String viewType, String title, String description, ButtonComponent action) = RowDetailsComponent;
}

class TopBarComponent extends Component {
  TopBarComponent(viewType, this.title): super._(viewType);

  String title;
}

class ColumnComponent extends Component {
  ColumnComponent(viewType, this.listComponents): super._(viewType);
  List<Component> listComponents;
}

class RowComponent extends Component {
  RowComponent(viewType, this.listComponents): super._(viewType);
  List<Component> listComponents;
}

class TextComponent extends Component {
  TextComponent(viewType, this.layoutId, this.text, this.textSize): super._(viewType);
  String layoutId;
  String text;
  double textSize;
}

class ButtonComponent extends Component {
  ButtonComponent(viewType, this.layoutId, this.text): super._(viewType);
  String layoutId;
  String text;
}

class VerticalScrollComponent extends Component {
  VerticalScrollComponent(viewType, this.height, this.listComponents): super._(viewType);
  double height;
  List<Component> listComponents;
}

class RowDetailsComponent extends Component {
  RowDetailsComponent(viewType, this.title, this.description, this.action): super._(viewType);
  String title;
  String description;
  ButtonComponent action;
}
