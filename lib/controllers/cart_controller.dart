import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:onesinal/models/product.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cardItem = <Product>[].obs;
  double get totalPrice => cardItem.fold(0, (sum, item) => sum + item.price);

  addToCart(Product product) {
    cardItem.add(product);
    update();
  }
}
