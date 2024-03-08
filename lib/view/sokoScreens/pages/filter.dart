// 
import 'package:flutter/material.dart';

class WhichFilter {
  String option_key;
  String name;

  WhichFilter(this.option_key, this.name);

  static List<WhichFilter> getWhichFilterList() {
    return <WhichFilter>[
      WhichFilter('product', 'product'),
      WhichFilter('sellers', 'sellers'),
      WhichFilter('brands', 'brands'),
    ];
  }
}


class Filter extends StatelessWidget {
  const Filter({super.key});

  @override
  // ignore: override_on_non_overriding_member
  Widget build(BuildContext context) {
    return Container();
  }
}