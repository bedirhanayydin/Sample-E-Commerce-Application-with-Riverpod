import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/product_widget_item.dart';
import '../../riverpod/riverpod_management.dart';

class Basket extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var productRead = ref.watch(productRiverPod);
    return Scaffold(
      body: productRead.basketProducts.isEmpty
          ? Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Henüz sepetinizde ürün bulunmuyor.',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                OutlinedButton(
                    onPressed: () {
                      ref.watch(bottomNavBarRiverpod).setCurrentIndex(0);
                    },
                    child: const Text('Ürünlere Git', style: TextStyle(fontSize: 15)))
              ],
            ))
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                  child: Text(
                    'Sepetim',
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
                        model: productRead.basketProducts[index],
                        setFavorite: () {
                          productRead.addFavorite(productRead.basketProducts[index]);
                        },
                        setBasket: () {
                          productRead.deleteBasket(productRead.basketProducts[index]);
                        },
                        currentIndex: 2,
                      );
                    },
                    itemCount: productRead.basketProducts.length,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.grey.shade300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Toplam Tutar: ${productRead.priceTotal} ₺",
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      OutlinedButton(onPressed: () {}, child: const Text('Sipariş ver'))
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
