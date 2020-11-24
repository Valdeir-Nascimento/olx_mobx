import 'package:flutter/material.dart';
import 'package:olxmobx/components/custom_drawer/custom_drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        drawer: CustomDrawer(),
      ),
    );
  }
}
