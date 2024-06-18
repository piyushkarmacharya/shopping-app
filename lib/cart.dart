import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_provider.dart';


class Cart extends StatelessWidget {
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text("Cart"),
        ),
        body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final cartItem = cart[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(cartItem["imageURL"].toString()),
                radius: 30,
              ),
              title: Text(
                cartItem["title"].toString(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              subtitle: Text(cartItem["size"].toString()),
              trailing: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Remove from Cart"),
                            content: Text(
                                "Are you sure you want to remove this product from cart?"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("No")),
                              TextButton(
                                  onPressed: () {
                                    Provider.of<CartProvider>(context,
                                            listen: false)
                                        .removeProduct(cartItem);
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Yes")),
                            ],
                          );
                        });
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
            );
          },
        ),
      ),
    );
  }
}
