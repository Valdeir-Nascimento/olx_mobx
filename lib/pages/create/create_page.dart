import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olxmobx/components/custom_drawer/custom_drawer.dart';
import 'package:olxmobx/controllers/create_controller.dart';
import 'package:olxmobx/pages/create/componentes/category_field.dart';
import 'package:olxmobx/pages/create/componentes/cep_field.dart';
import 'package:olxmobx/pages/create/componentes/images_field.dart';
import 'package:olxmobx/pages/create/componentes/phone_field.dart';

class CreatePage extends StatelessWidget {
  final CreateController createController = CreateController();

  @override
  Widget build(BuildContext context) {
    final labelStyle = TextStyle(
        fontWeight: FontWeight.w800, color: Colors.grey, fontSize: 18);
    final contentPadding = const EdgeInsets.fromLTRB(16, 10, 12, 10);

    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text("Criar anúncio"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Card(
            //Deixa o container com a mesma borda do card
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                
                ImagesField(createController),
                
                Observer(builder: (_) {
                  return TextFormField(
                    onChanged: createController.setTitle,
                    decoration: InputDecoration(
                      contentPadding: contentPadding,
                      labelText: "Título *",
                      labelStyle: labelStyle,
                      errorText: createController.titleError,
                    ),
                  );
                }),
                
                Observer(builder: (_) {
                  return TextFormField(
                    onChanged: createController.setDescricao,
                    decoration: InputDecoration(
                      contentPadding: contentPadding,
                      labelText: "Descrição *",
                      labelStyle: labelStyle,
                      errorText: createController.descricaoError,
                    ),
                    maxLines: null,
                  );
                }),
                
                CategoryField(createController),
                
                CepField(createController),
                
                Observer(builder: (_) {
                  return TextFormField(
                    onChanged: createController.setPreco,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        errorText: createController.precoError,
                        contentPadding: contentPadding,
                        labelText: "Preço *",
                        labelStyle: labelStyle,
                        prefixText: "R\$ "),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      RealInputFormatter(centavos: true),
                    ],
                  );
                }),
                
                PhoneField(createController),
                
                Observer(builder: (_) {
                  return Container(
                      height: 50,
                      child: GestureDetector(
                        onTap: createController.invalidSendPressed,
                        child: RaisedButton(
                          child: Text("Enviar",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                          textColor: Colors.white,
                          disabledColor: Colors.orange.withAlpha(120),
                          color: Colors.orange,
                          onPressed: createController.sendPressed,
                        ),
                      ),
                    );
                }),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
