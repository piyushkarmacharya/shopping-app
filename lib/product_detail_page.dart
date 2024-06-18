import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_provider.dart';


class ProductDetailPage extends StatefulWidget {
  final Map<String, dynamic> product;
  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  String selectedSize = "";
  void onTap(){
    if(selectedSize!=""){
        Provider.of<CartProvider>(context,listen: false).addProduct({
        'id':widget.product['id'],
        'company':widget.product['company'],
        'title':widget.product['title'],
        'price':widget.product['price'],
        'size':selectedSize,
        'imageURL':widget.product['imageURL'],
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Product added..."),),
      );
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Select Size please"),),
      );
    }
    
    print(Provider.of<CartProvider>(context,listen:false).cart);
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.product['title'].toString(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(widget.product['imageURL'],),
          ),
          const Spacer(flex: 2,),
          Container(
            height: 250,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(245, 247, 249, 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,0,16),
                  child: Text(
                    "Rs.${widget.product['price']}",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    itemCount: widget.product['size'].length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              selectedSize=widget.product['size'][i].toString();
                            });
                          },
                          child: Chip(
                            label: Text(widget.product['size'][i].toString()),
                            backgroundColor: selectedSize==widget.product['size'][i].toString()?Theme.of(context).colorScheme.primary:null,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton.icon(
                    onPressed: onTap,
                    icon: Icon(Icons.shopping_cart,color: Colors.black),
                    
                    label: Text(
                      "Add To Cart",
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
