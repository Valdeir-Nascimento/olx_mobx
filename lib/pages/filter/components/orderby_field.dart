import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olxmobx/controllers/filter_controller.dart';
import 'package:olxmobx/enums/orderby_enum.dart';
import 'package:olxmobx/pages/filter/components/section_title.dart';

class OrderByField extends StatelessWidget {
  final FilterController filterController;

  OrderByField(this.filterController);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      
      children: [
        SectionTitle(
          title: "Ordernar Por",
        ),
        Observer(builder: (_) {
          return Row(
            children: [
              buildButtonOption("Data", OrderByEnum.DATA),
              const SizedBox(width: 12),
              buildButtonOption("Preço", OrderByEnum.PRECO),
            ],
          );
        })
      ],
    );
  }

  Widget buildButtonOption(String title, OrderByEnum option) {
    return GestureDetector(
      onTap: () {
        filterController.setOrderBy(option);
      },
      child: Container(
        height: 44,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: filterController.orderBy == option
                ? Colors.purple
                : Colors.transparent,
            border: Border.all(
                color: filterController.orderBy == option
                    ? Colors.purple
                    : Colors.black38)),
        child: Text(
          title,
          style: TextStyle(
              color: filterController.orderBy == option
                  ? Colors.white
                  : Colors.black),
        ),
      ),
    );
  }
}
