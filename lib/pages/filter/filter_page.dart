import 'package:flutter/material.dart';
import 'package:olxmobx/controllers/filter_controller.dart';

import 'components/orderby_field.dart';
import 'components/price_range_field.dart';

class FilterPage extends StatelessWidget {

  FilterController filterController = FilterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filtrar Busca"),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                OrderByField(filterController),
                PriceRangeField(filterController)
              ],
            ),
          )
        ),
      ),
    );
  }
}
