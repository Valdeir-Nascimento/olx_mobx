import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:olxmobx/components/error_box.dart';
import 'package:olxmobx/controllers/category_controller.dart';
import 'package:olxmobx/models/category_model.dart';

class CategoryPage extends StatelessWidget {

  final CategoryModel categoriaSelecionada;
  final bool showAll;

  CategoryPage({this.showAll = true, this.categoriaSelecionada});

  final CategoryController categoryController = GetIt.I.get<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categorias"),
        centerTitle: true,
      ),    
      body: Center(
        child: Card(
          elevation: 8,
          margin: const EdgeInsets.fromLTRB(32, 12, 32, 32),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Observer(builder: (_) {
            if(categoryController.error != null) {
              return ErrorBox(
                message: categoryController.error,
              );
            } else if(categoryController.categoryList.isEmpty) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final categorias = showAll ? categoryController.allCategoryList : categoryController.categoryList;
              return ListView.separated(
                itemCount: categorias.length,
                separatorBuilder: (_, __) {
                  return Divider(height: 1, color: Colors.grey);
                },
                itemBuilder: (_, index) {
                  final categoria = categorias[index];
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pop(categoria);
                    },
                    child: Container(
                      height: 50,
                      color: categoria.id == categoriaSelecionada?.id ? Colors.purple.withAlpha(50) : null,
                      alignment: Alignment.center,
                      child: Text(
                        categoria.description, 
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: categoria.id == categoriaSelecionada?.id 
                            ? FontWeight.bold : null, 
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          })
        ),
      ),
    );
  }
}
