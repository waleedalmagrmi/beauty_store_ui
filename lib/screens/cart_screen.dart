import 'package:beauty_store_ui/screens/cart.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('سلة المشتريات')),
      body: cartItems.isEmpty
          ? const Center(
              child: Text('السلة فارغة', style: TextStyle(fontSize: 20)))
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final product = cartItems[index];
                return ListTile(
                  leading: Image.asset(product['image']!, width: 50),
                  title: Text(product['name']!),
                  subtitle: Text(product['price']!),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      cartItems.removeAt(index);

                      (context as Element).markNeedsBuild();
                    },
                  ),
                );
              },
            ),
    );
  }
}
