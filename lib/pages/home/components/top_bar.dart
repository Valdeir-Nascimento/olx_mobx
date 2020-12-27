import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:olxmobx/controllers/home_controller.dart';
import 'package:olxmobx/pages/category/category_page.dart';
import 'package:olxmobx/pages/filter/filter_page.dart';
import 'package:olxmobx/pages/home/components/bar_button.dart';

class TopBar extends StatelessWidget {
  final homeController = GetIt.I.get<HomeController>();
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Observer(builder: (_) {
          return BarButton(
            label: homeController.categorySelected?.description ?? "Categorias",
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[400]))),

            onTap: () async {
              final category = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => CategoryPage(showAll: true, categoriaSelecionada: homeController.categorySelected)
                  )
                );

              if(category != null) {
                homeController.setCategoy(category);
              }  

            },
          );
        }),
        
        BarButton(
          label: "Filtros",
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey[400]),
              left: BorderSide(color: Colors.grey[400]),
            )
          ),
           onTap: () {
             Navigator.of(context).push(MaterialPageRoute(builder: (_) => FilterPage()));
           },
        ),

        
      ],
    );
  }
}
