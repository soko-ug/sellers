import 'package:flutter/material.dart';

class Product {
  final int id;
  final String name;
  final String thumbnailImage;
  final String mainPrice;

  Product({
    required this.id,
    required this.name,
    required this.thumbnailImage,
    required this.mainPrice,
  });
}

class FeaturedProductsGrid extends StatelessWidget {
  final List<Map<String, dynamic>> productsData;

  FeaturedProductsGrid({required this.productsData});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productsData.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemBuilder: (context, index) {
        final product = Product(
          id: productsData[index]['id'],
          name: productsData[index]['name'],
          thumbnailImage: productsData[index]['thumbnail_image'],
          mainPrice: productsData[index]['main_price'],
        );

        return _buildProductItem(product);
      },
    );
  }

  Widget _buildProductItem(Product product) {
    return GestureDetector(
      onTap: () {
        // Handle product tap
      },
      child: Card(
        elevation: 2.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.thumbnailImage,
              height: 150.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Price: ${product.mainPrice}',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(
//         title: Text('Featured Products'),
//       ),
//       body:  ),
//   ));
// }
