import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:olxmobx/controllers/base_controller.dart';
import 'package:olxmobx/controllers/user_manager_controller.dart';
import 'package:olxmobx/pages/login/login_page.dart';

class CustomDrawerHeader extends StatelessWidget {

  final UserManagerController userManagerController = GetIt.I.get<UserManagerController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Fechando o drawer
        Navigator.of(context).pop();
        if(userManagerController.isLoggedIn) {
          GetIt.I<BaseController>().setPage(4);
        }else {
          Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
        }

      },
      child: Container(
        height: 120,
        color: Colors.purple,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Icon(
              Icons.person,
              color: Colors.white,
              size: 40,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    userManagerController.isLoggedIn 
                      ? userManagerController.user.nome
                      : "Acesse sua conta agora!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    userManagerController.isLoggedIn 
                      ? userManagerController.user.email 
                      : "Clique aqui",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
