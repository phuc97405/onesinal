import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:onesinal/models/product.dart';
import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;
  var price = 0.0.obs;

  // var _googleSignIn = GoogleSignIn();
  // var googleAccount = Rx<GoogleSignInAccount?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  handleSignIn() async {
    // googleAccount.value = await _googleSignIn.signIn();
  }

  handleLogout() async {
    // googleAccount.value = await _googleSignIn.signOut();
    // print(googleAccount.value);
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));

    var productionResult = [
      Product(
          id: 1,
          productName: 'FirshProp',
          productImage: 'abc',
          productDecription: 'some decription about product',
          price: 30),
      Product(
          id: 2,
          productName: 'TwoProp',
          productImage: 'gsg',
          productDecription: 'some decription about product',
          price: 40),
      Product(
          id: 3,
          productName: 'threeProp',
          productImage: '3333',
          productDecription: 'some decription about product',
          price: 50)
    ];

    products.value = productionResult;
  }

  @override
  void onClose() {
    super.onClose();
  }
}
