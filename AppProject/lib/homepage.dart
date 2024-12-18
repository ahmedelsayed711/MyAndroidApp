import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, String>> phones = [
    {
      'name': 'iPhone 14',
      'price': '30000 EGP',
      'image': 'assets/WhatsApp Image 2024-12-17 at 22.14.22_670544ca.jpg',
      'description': 'The latest iPhone model with A15 Bionic chip.',
    },
    {
      'name': 'Samsung Galaxy S22',
      'price': '25000 EGP',
      'image': 'assets/WhatsApp Image 2024-12-17 at 22.14.12_0e11010c.jpg',
      'description': 'Powerful camera and AMOLED display.',
    },
    {
      'name': 'OnePlus 9',
      'price': '17000 EGP',
      'image': 'assets/WhatsApp Image 2024-12-17 at 22.15.53_68442a19.jpg',
      'description': 'Fast charging and great performance.',
    },
    {
      'name': 'Google Pixel 7',
      'price': '48050 EGP',
      'image': 'assets/WhatsApp Image 2024-12-17 at 22.15.12_8c2d43ef.jpg',
      'description': 'Smartphone with advanced AI-powered features.',
    },
    {
      'name': 'Xiaomi Mi 11',
      'price': '10050 EGP',
      'image': 'assets/WhatsApp Image 2024-12-17 at 22.16.41_cbaab82d.jpg',
      'description': 'Flagship phone with Snapdragon 888.',
    },
    {
      'name': 'Xiaomi 14 T',
      'price': '12650 EGP',
      'image': 'assets/WhatsApp Image 2024-12-17 at 22.18.25_4052b0da.jpg',
      'description': 'Flagship phone with Snapdragon 888.',
    },
    // Add more phones as needed...
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Store'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Display two items per row
            crossAxisSpacing: 16.0, // Space between items horizontally
            mainAxisSpacing: 16.0, // Space between items vertically
          ),
          itemCount: phones.length,
          itemBuilder: (context, index) {
            return PhoneCard(phones[index]);
          },
        ),
      ),
    );
  }
}

class PhoneCard extends StatelessWidget {
  final Map<String, String> phone;

  const PhoneCard(this.phone, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            phone['image']!,
            height: 120,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          Text(
            phone['name']!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            phone['price']!,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Navigate to product detail page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(phone),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: const Size(double.infinity, 40),
            ),
            child: const Text('Buy Now'),
          ),
        ],
      ),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final Map<String, String> phone;

  const ProductDetailPage(this.phone, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(phone['name']!),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              phone['image']!,
              height: 250,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(
              phone['name']!,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              phone['price']!,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Description:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              phone['description']!,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement purchase or add to cart action here
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Purchased ${phone['name']}')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Buy Now'),
            ),
          ],
        ),
      ),
    );
  }
}
