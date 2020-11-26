import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:olxmobx/components/custom_drawer/custom_drawer.dart';
import 'package:olxmobx/controllers/create_controller.dart';
import 'package:olxmobx/pages/create/componentes/category_field.dart';
import 'package:olxmobx/pages/create/componentes/cep_field.dart';
import 'package:olxmobx/pages/create/componentes/images_field.dart';


class CreatePage extends StatelessWidget {

  final CreateController createController = CreateController();

  @override
  Widget build(BuildContext context) {
    final labelStyle = TextStyle(fontWeight: FontWeight.w800, color: Colors.grey, fontSize: 18);
    final contentPadding = const EdgeInsets.fromLTRB(16, 10, 12, 10);

    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text("Criar anúncio"),
        centerTitle: true,
      ),
      body: Card(
        //Deixa o container com a mesma borda do card
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ImagesField(createController),
            TextFormField(
              decoration: InputDecoration(
                contentPadding: contentPadding,
                labelText: "Título *",
                labelStyle: labelStyle,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                contentPadding: contentPadding,
                labelText: "Descrição *",
                labelStyle: labelStyle,
              ),
              maxLines: null,
            ),
            CategoryField(createController),
            CepField(),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: contentPadding,
                labelText: "Preço *",
                labelStyle: labelStyle,
                prefixText: "R\$ "
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                RealInputFormatter(centavos: true),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
