import 'package:beauty_store_ui/screens/cart.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Map<String, String> product;
  ProductDetailsScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product['name']!)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(product['image']!, height: 250),
            const SizedBox(height: 20),
            Text(product['name']!,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text('السعر: ${product['price']!}',
                style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                cartItems.add(product);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text('${product['name']} تمت إضافته إلى السلة')),
                );
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50)),
              child: const Text('أضف للسلة'),
            )
          ],
        ),
      ),
    );
  }
}
