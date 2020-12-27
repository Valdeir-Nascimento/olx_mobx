import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:olxmobx/components/custom_drawer/custom_drawer.dart';
import 'package:olxmobx/controllers/home_controller.dart';
import 'components/search_dialog.dart';
import 'components/top_bar.dart';

class HomePage extends StatelessWidget {
  final homeController = GetIt.I.get<HomeController>();

  openSearch(BuildContext context) async {
    final search = await showDialog(
        context: context,
        builder: (_) => SearchDialog(
              currentSearch: homeController.search,
            ));

    if (search != null) {
      homeController.setSearch(search);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Observer(builder: (_) {
            if (homeController.search.isEmpty) {
              return Container();
            }
            return GestureDetector(
              onTap: () => openSearch(context),
              child: LayoutBuilder(
                builder: (_, constraints) {
                  //Editando o campo de pesquisar
                  return Container(
                    width: constraints.biggest.width,
                    child: Text(homeController.search),
                  );
                }
              )
            );

          }),
          actions: [
            Observer(builder: (_) {
              if(homeController.search.isEmpty)
                return IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => openSearch(context),
                );
              
              return IconButton(
                icon: Icon(Icons.close), 
                onPressed: () {
                  homeController.setSearch("") ;
                }
              ); 

            })
          ],
        ),
        drawer: CustomDrawer(),
        body: Column(
          children: [
            TopBar()
          ],
        ),
      ),
    );
  }
}
