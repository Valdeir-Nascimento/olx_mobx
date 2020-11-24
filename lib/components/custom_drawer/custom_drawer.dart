import 'package:flutter/material.dart';
import 'package:olxmobx/components/custom_drawer/custom_drawer_header.dart';
import 'package:olxmobx/components/custom_drawer/page_section.dart';
class CustomDrawer extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    return ClipRRect(
      borderRadius: BorderRadius.horizontal(right: Radius.circular(50)),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Drawer(
          child: ListView(
            children: [
              CustomDrawerHeader(),
              PageSection()
            ],
          ),
        ),
      ),
    );
  }
}
