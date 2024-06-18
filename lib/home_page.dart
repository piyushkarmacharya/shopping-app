import 'package:flutter/material.dart';
import 'package:shop_app/cart.dart';
import 'package:shop_app/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currindex=0;
  List <Widget> pages=[const ProductList(),Cart()];
  @override
  Widget build(BuildContext context) {
    //creating variable for storing border style to reuse it
    

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currindex,
        selectedFontSize: 0,
        unselectedFontSize: 0,

        onTap: (value){
          setState(() {
            currindex=value;
          });
        },
        items:const [
          
          BottomNavigationBarItem(

            label: '',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body:IndexedStack(
        index: currindex,
        children: pages,
      ),
    );
  }
}
