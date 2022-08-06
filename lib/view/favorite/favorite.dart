import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/product_widget_item.dart';
import '../../riverpod/riverpod_management.dart';

class Favorite extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var productRead = ref.watch(productRiverPod);
    var basketRead = ref.watch(bottomNavBarRiverpod);

    return Scaffold(
      body: productRead.favorites.isEmpty
          ? Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Henüz favoriniz bulunmuyor.', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
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
                    'Favoriler',
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
                        model: productRead.favorites[index],
                        setFavorite: () {
                          productRead.addFavorite(productRead.favorites[index]);
                        },
                        setBasket: () {
                          productRead.addBasket(productRead.favorites[index]);
                        },
                        currentIndex: 1,
                      );
                    },
                    itemCount: productRead.favorites.length,
                  ),
                ),
              ],
            ),
    );
  }
}
