import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesinal/controllers/cart_controller.dart';
import 'package:onesinal/controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Expanded(child: GetX<ShoppingController>(builder: (controller) {
        return ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        cartController.addToCart(controller.products[index]);
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                              controller.products[index].price.toString() +
                                  ' Vnd')),
                    )
                  ],
                ),
              );
            });
      })),
      GetX<CartController>(builder: (controller) {
        return Text('Total amount:  ${controller.totalPrice}');
      }),
      GetX<CartController>(builder: (controller) {
        return Text(controller.cardItem.length.toString());
      }),
      SizedBox(
        height: 100,
      ),
      GestureDetector(
        onTap: () {
          shoppingController.handleSignIn();
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                offset: Offset(0, 10), color: Colors.black38, blurRadius: 20)
          ], borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: Text('Login With Gmail'),
        ),
      ),
      // Obx(
      //   () => shoppingController.googleAccount.value == null
      //       ? Container()
      //       : Column(
      //           children: [
      //             CircleAvatar(
      //               backgroundImage: Image.network(
      //                       shoppingController.googleAccount.value!.photoUrl!)
      //                   .image,
      //               radius: 100,
      //             ),
      //             Text(shoppingController.googleAccount.value!.displayName
      //                 .toString()),
      //             Text(shoppingController.googleAccount.value!.email.toString())
      //           ],
      //         ),
      // ),
      ActionChip(
          avatar: Icon(Icons.logout),
          label: Text('Logout'),
          onPressed: () {
            shoppingController.handleLogout();
          }),
      Spacer()
    ]));
  }
}
