import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../controllers/create_controller.dart';
import '../../category/category_page.dart';

class CategoryField extends StatelessWidget {
  final CreateController createController;
  CategoryField(this.createController);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return ListTile(
          title: createController.category == null 
            ? Text(
                "Categoria *",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.grey,
                  fontSize: 18,
                  ),
              ) 
            : Text(
                "Categoria *",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                  fontSize: 14,
                  ),
              ), 
          subtitle: createController.category == null 
            ? null 
            : Text("${createController.category.description}", style: TextStyle(color: Colors.black, fontSize: 17),),
          trailing: Icon(Icons.keyboard_arrow_down),
          onTap: () async {
            final category = await showDialog(
              context: context,
              builder: (_) => CategoryPage(
                showAll: false,
                categoriaSelecionada: createController.category,
              ),
            );
            if (category != null) {
              createController.setCategory(category);
            }
            
          },
        );
      },
    );
  }
}
