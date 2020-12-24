import 'package:flutter/material.dart';
import 'package:olxmobx/components/custom_drawer/custom_drawer.dart';
import 'components/search_dialog.dart';

class HomePage extends StatelessWidget {

  openSearch(BuildContext context) async {
    final search = await showDialog(
      context: context,
      builder: (_) => SearchDialog(currentSearch: 'Valdeir',)
    );

    print(search);

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                openSearch(context);
              }
            )
          ],

        ),
        drawer: CustomDrawer(),
      ),
    );
  }
}
