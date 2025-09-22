import 'package:flutter/material.dart';
import 'product_details_screen.dart';
import 'consultation_screen.dart';
import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> products = [
    {"name": "كريم تفتيح", "price": "20\$", "image": "assets/product1.jpeg"},
    {"name": "سيروم البشرة", "price": "30\$", "image": "assets/product2.jpg"},
    {"name": "كريم تجديد", "price": "25\$", "image": "assets/product3.jpg"},
    {"name": "كريم تجديد", "price": "40\$", "image": "assets/product4.jpg"},
    {"name": "كريم تجديد", "price": "50\$", "image": "assets/product5.jpg"},
    {"name": "كريم تجديد", "price": "60\$", "image": "assets/product2.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('متجر الجمال'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => CartScreen()));
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => ConsultationScreen()));
              },
              icon: const Icon(Icons.medical_services),
              label: const Text('حجز استشارة لدى الدكتورة'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.pink,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: products.length,
                itemBuilder: (_, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  ProductDetailsScreen(product: product)));
                    },
                    child: Card(
                      elevation: 4,
                      child: Column(
                        children: [
                          Expanded(
                              child: Image.asset(product['image']!,
                                  fit: BoxFit.cover)),
                          const SizedBox(height: 8),
                          Text(product['name']!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          Text(product['price']!),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
