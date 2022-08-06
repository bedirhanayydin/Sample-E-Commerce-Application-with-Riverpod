import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/riverpod/riverpod_management.dart';

import '../../components/product_widget_item.dart';

class Home extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(productRiverPod);
    var read = ref.read(productRiverPod);
    var bottomwatch = ref.watch(bottomNavBarRiverpod);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
            child: Text(
              'Ürünler',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: 16,
                  ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              itemBuilder: (context, index) {
                return ProductWidget(
                  model: watch.product[index],
                  setFavorite: () {
                    read.addFavorite(watch.product[index]);
                  },
                  setBasket: () {
                    read.addBasket(watch.product[index]);
                  },
                  currentIndex: bottomwatch.currentIndex,
                );
              },
              itemCount: read.product.length,
            ),
          ),
        ],
      ),
    );
  }
}
