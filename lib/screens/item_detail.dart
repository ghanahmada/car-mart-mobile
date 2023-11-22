import 'package:car_mart_mobile/models/item.dart';
import 'package:flutter/material.dart';

class ItemDetailScreen extends StatelessWidget {
  final Item item;

  ItemDetailScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.fields.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${item.fields.name}'),
            Text('Amount: ${item.fields.amount}'),
            Text('Price: ${item.fields.price}'),
            Text('Category: ${item.fields.category}'),
            Text('Description: ${item.fields.description}'),
            // Add other attributes
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the item list screen
                Navigator.pop(context);
              },
              child: Text('Back to Item List'),
            ),
          ],
        ),
      ),
    );
  }
}