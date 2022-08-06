import 'package:flutter/widgets.dart';
import 'package:grock/grock.dart';
import 'package:riverpod_example/model/product_model.dart';

class ProductRiverpod extends ChangeNotifier {
  List<ProductModel> product = [];
  List<ProductModel> favorites = [];
  List<ProductModel> basketProducts = [];
  double priceTotal = 0.0;

  void setTotalPrice(ProductModel model) {
    priceTotal += model.price;
  }

  void deleteTotalPrice(ProductModel model) {
    priceTotal -= model.price;
  }

  void addFavorite(ProductModel model) {
    if (model.isFavorite) {
      model.isFavorite = false;
      favorites.remove(model);
      notifyListeners();
    } else {
      model.isFavorite = true;
      favorites.add(model);
      notifyListeners();
    }
  }

  void addBasket(ProductModel model) {
    basketProducts.add(model);
    setTotalPrice(model);
    notifyListeners();
  }

  void deleteBasket(ProductModel model) {
    basketProducts.remove(model);
    deleteTotalPrice(model);
    notifyListeners();
  }

  void init() {
    for (var i = 0; i < 15; i++) {
      product.add(ProductModel(
          isFavorite: false,
          imagePath: i.randomImage(),
          title: 'Xiaomi ${i + 1}',
          price: 6000.0,
          description: '15mp camera, 5500 mah battery'));
    }
  }
}
