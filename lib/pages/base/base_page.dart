import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:olxmobx/controllers/base_controller.dart';
import 'package:olxmobx/pages/create/create_page.dart';
import 'package:olxmobx/pages/home/home_page.dart';

class BasePage extends StatefulWidget {
  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  final baseController = GetIt.I.get<BaseController>();
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();

    reaction(
      (_) => baseController.page,
      (page) => pageController.jumpToPage(page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        //bloqueia a rolagem
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomePage(),
          CreatePage(),
          Container(color: Colors.purple),
          Container(color: Colors.red),
          Container(color: Colors.grey),
        ],
      ),
    );
  }
}
