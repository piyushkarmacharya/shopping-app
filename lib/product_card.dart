import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String imageURL;
  final Color bgColor;
  const ProductCard({
    super.key,
    required this.bgColor,
    required this.title,
    required this.price,
   required this.imageURL
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style:Theme.of(context).textTheme.titleMedium,),
          const SizedBox(height: 5,),
          Text("Rs.$price",style:Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 5,),
          Center(
            child: Image.asset(
              imageURL,
              height: 175,
            ),
          ),
           // Image(),
        ],
      ),
    );
  }
}
