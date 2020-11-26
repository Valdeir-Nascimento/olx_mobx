import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olxmobx/controllers/cep_controller.dart';

class CepField extends StatelessWidget {
  final CepController cepController = CepController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          onChanged: cepController.setCep,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            CepInputFormatter()
          ],
          decoration: InputDecoration(
            labelText: "CEP *",
            labelStyle: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.grey,
              fontSize: 18,
            ),
            contentPadding: const EdgeInsets.fromLTRB(16, 10, 12, 10),
          ),
        ),
        Observer(builder: (_) {
          if(cepController.endereco == null && cepController.error == null && !cepController.loading) {
            return Container();
          } else if(cepController.endereco == null && cepController.error == null) {
            return LinearProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.purple),
              backgroundColor: Colors.transparent,
            );
          } else if(cepController.error != null) {
            return Container(
              color: Colors.red.withAlpha(100),
              height: 50,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              child: Text(
                cepController.error,
                style: TextStyle(fontWeight: FontWeight.w600, color: Colors.red),
              ),
            );
          } else {
            final endereco = cepController.endereco;
            return Container(
              color: Colors.purple.withAlpha(150),
              height: 50,
              alignment: Alignment.center,
              child: Text("Localização: ${endereco.bairro}, ${endereco.cidade.nome} - ${endereco.estado.sigla}",
               style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
               textAlign: TextAlign.center
              ),
            );
          }
        }),
      ],
    );
  }
}
