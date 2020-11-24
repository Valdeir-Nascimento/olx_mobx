import 'package:flutter/material.dart';

class PageTile extends StatelessWidget {
  final String label;
  final IconData iconData;
  final VoidCallback onTap;
  final bool selected;

  const PageTile({
    Key key,
    this.label,
    this.iconData,
    this.onTap,
    this.selected,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label, style: TextStyle(color: selected ? Colors.purple : Colors.black45, fontWeight: FontWeight.w700),),
      leading: Icon(iconData, color: selected ? Colors.purple : Colors.black45),
      onTap: onTap,
    );
  }
}
