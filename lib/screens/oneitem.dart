import 'package:tokopedrian_mobile/models/Item.dart';
import 'package:flutter/material.dart';


class ItemDetailPage extends StatelessWidget {
	final Product item;

	const ItemDetailPage({Key? key, required this.item}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
		appBar: AppBar(
			title: Text(item.fields.name),
			backgroundColor: Colors.orange.shade800,
			foregroundColor: Colors.white,
		),
		body: Padding(
			padding: const EdgeInsets.all(16.0),
			child: Column(
			crossAxisAlignment: CrossAxisAlignment.start,
			children: [
				Text(
				'Name: ${item.fields.name}',
				style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
				),
				SizedBox(height: 10),
				Text('Amount: ${item.fields.amount}'),
				SizedBox(height: 10),
				Text('Description: ${item.fields.description}'),
			],
			),
		),
		);
	}
}