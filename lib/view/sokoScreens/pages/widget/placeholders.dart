import 'package:flutter/material.dart';

class PlaceholderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // _buildSectionTitle('Sliders'),
            _buildPlaceholder(height: 200.0), // Placeholder for sliders
            _buildSectionTitle('Brands'),
            _buildPlaceholder(height: 100.0), // Placeholder for brands
            _buildSectionTitle('Featuring Products'),
            _buildPlaceholder(height: 150.0), // Placeholder for featuring products
            _buildSectionTitle('New Products'),
            _buildPlaceholder(height: 150.0), // Placeholder for new products
            _buildSectionTitle('Best Selling Products'),
            _buildPlaceholder(height: 150.0), // Placeholder for best selling products
            _buildSectionTitle('Category-wise Products'),
            _buildPlaceholder(height: 150.0), // Placeholder for category-wise products
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildPlaceholder({double? height}) {
    return Container(
      height: height,
      color: Colors.grey[300],
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    );
  }
}