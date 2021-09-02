import 'package:sdui_module/models/component.dart';

class StorageData {

  static List<Component> getData() {
    Component column = Component.column(
        "column",
        [
          Component.topBar("topBar", "Review example"),
          Component.text("","", "Escolha onde quer receber o cartão", 24),
          Component.verticalScroll(
              "verticalScroll",
              200,
              [
                Component.rowDetails(
                    "CardRowAddress",
                    "Av. Paulista, 1408",
                    "Apartamento 44, Bloco 2, ...",
                    ButtonComponent("button", "button", "Edit")
                ),
                Component.rowDetails(
                    "CardRowAddress",
                    "Av. Rivadavia, 6433",
                    "Apartamento 193, Bloco 2, ...",
                    ButtonComponent("", "button2", "Edit")
                )
              ]
          ),
          Component.button("", "buttonAdd", "Adicionar novo endereço")
        ]
    );

    return [column];
  }
}