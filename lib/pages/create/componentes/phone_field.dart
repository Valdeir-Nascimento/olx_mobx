import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olxmobx/controllers/create_controller.dart';

class PhoneField extends StatelessWidget {
  final CreateController createController;
  PhoneField(this.createController);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Row(
        children: [
          Observer(builder: (_) {
            return Checkbox(
              value: createController.hidePhone,
              onChanged: createController.setHidePhone,
            );
          }),
          Expanded(
            child: Text(
              "Ocultar o meu telefone neste anúncio",
            ),
          )
        ],
      ),
    );
  }
}
