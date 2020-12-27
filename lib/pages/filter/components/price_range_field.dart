import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olxmobx/controllers/filter_controller.dart';
import 'package:olxmobx/pages/filter/components/price_field.dart';
import 'package:olxmobx/pages/filter/components/section_title.dart';

class PriceRangeField extends StatelessWidget {
  final FilterController filterController;

  PriceRangeField(this.filterController);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: "Preço"),
        Row(
          children: [
            PriceField(
              label: "Min",
              onChanged: filterController.setMinPrice,
              initialValue: filterController.minPrice,
            ),
            const SizedBox(width: 10),
            PriceField(
              label: "Max",
              onChanged: filterController.setMaxPrice,
              initialValue: filterController.maxPrice,
            ),
          ],
        ),
        Observer(builder: (_) {
          if(filterController.priceError != null) {
            return Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(filterController.priceError, style: TextStyle(color: Colors.red, fontSize: 12),),
            );
          }
          return Container();

        })
      ],
    );
  }
}
