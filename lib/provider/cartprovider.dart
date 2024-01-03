import 'package:flutter/material.dart';
import 'package:foodapp/provider/product.dart';

class CartProvider extends ChangeNotifier {
  List<product> _products = [];
  List<product> _favproduct = [];

  List<product> get Products => _products;
  List<product> get FavProducts => _favproduct;
  void AddTofav(product prod) {
    FavProducts.add(prod);
  }

  void Removefromfav(product prod) {
    FavProducts.remove(prod);
  }

  void AddToCart(product prod) {
    Products.add(prod);
  }

  void RemovefromCart(product prod) {
    Products.remove(prod);
  }
}
