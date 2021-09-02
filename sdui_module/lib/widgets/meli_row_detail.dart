import 'package:flutter/material.dart';
import 'package:sdui_module/models/component.dart';

class MeliRowDetails extends StatelessWidget {
  final RowDetailsComponent component;

  MeliRowDetails({required this.component});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: false, onChanged: (b) {}),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                component.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                component.description,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        OutlinedButton(
          onPressed: () {},
          child: Text("Edit"),
        ),
      ],
    );
  }
}
