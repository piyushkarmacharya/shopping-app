import 'package:flutter/material.dart';
import 'package:shop_app/global_variables.dart';
import 'package:shop_app/product_card.dart';
import 'package:shop_app/product_detail_page.dart';

class ProductList extends StatefulWidget{
  const ProductList({super.key});
  @override
  State<ProductList> createState()=>_ProductListState();
}

class _ProductListState extends State<ProductList>{
  final List<String> filter = ["All", "Nike", "Jordan", "Adidas"];
  late String selectedFilter;
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedFilter = filter[0];
  }
  
  @override
  Widget build(BuildContext context){
    const borderr = OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(50),
        ));
    return SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Shoes\nCollection",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: borderr,
                      focusedBorder: borderr,
                      enabledBorder: borderr,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filter.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedFilter = filter[index];
                          });
                        },
                        child: Chip(
                          backgroundColor: selectedFilter == filter[index]
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.background,
                          label: Text(filter[index]),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          side: const BorderSide(
                            color: Color.fromRGBO(245, 247, 249, 1),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    );
                  })),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, i) {
                  final product = products[i];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ProductDetailPage(product: product);
                          },
                        ),
                      );
                    },
                    child: ProductCard(
                      title: product['title'].toString(),
                      price: product['price'] as double,
                      imageURL: product['imageURL'].toString(),
                      bgColor: i % 2 == 0
                          ? const Color.fromRGBO(216, 240, 253, 1)
                          : Theme.of(context).colorScheme.background,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      );
  }
}