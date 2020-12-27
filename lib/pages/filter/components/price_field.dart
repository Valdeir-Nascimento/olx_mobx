import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PriceField extends StatelessWidget {

  final String label;
  final int initialValue;
  final Function(int) onChanged;

  PriceField({this.label, this.onChanged, this.initialValue});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        onChanged: (text) {
          onChanged(int.tryParse(text.replaceAll(".", "")));
        },
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 14),
        initialValue: initialValue?.toString(),
        decoration: InputDecoration(
          prefix: Text("R\$ "),
          border: OutlineInputBorder(),
          isDense: true,
          labelText: label
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          RealInputFormatter(centavos: false)
        ],
      ),
    );
  }
}
