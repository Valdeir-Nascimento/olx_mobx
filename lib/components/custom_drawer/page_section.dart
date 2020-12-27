import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:olxmobx/components/custom_drawer/page_tile.dart';
import 'package:olxmobx/controllers/base_controller.dart';
import 'package:olxmobx/pages/create/create_page.dart';
import 'package:olxmobx/pages/home/home_page.dart';

class PageSection extends StatelessWidget {

  final baseController = GetIt.I.get<BaseController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageTile(
          label: 'Anúncios',
          iconData: Icons.list,
          onTap: () {
            baseController.setPage(0);
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          selected: baseController.page == 0,
        ),
        PageTile(
          label: 'Inserir Anúncio',
          iconData: Icons.edit,
          onTap: () {
            baseController.setPage(1);
            Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePage()));
          },
          selected:  baseController.page == 1,
        ),
        PageTile(
          label: 'Chat',
          iconData: Icons.chat,
          onTap: () {
            baseController.setPage(2);
          },
          selected: baseController.page == 2,
        ),
        PageTile(
          label: 'Favoritos',
          iconData: Icons.favorite,
          onTap: () {
            baseController.setPage(3);
          }, 
          selected:  baseController.page == 3,
        ),
        PageTile(
          label: 'Minha conta',
          iconData: Icons.person,
          onTap: () {
            baseController.setPage(4);
          },
          selected:  baseController.page == 4,
        ),
      ],
    );
  }
}
