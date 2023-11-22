import 'package:flutter/material.dart';
import 'package:tokopedrian_mobile/screens/add_item_form.dart';
import 'package:tokopedrian_mobile/screens/item_list_page.dart';
import 'package:tokopedrian_mobile/screens/menu.dart';

class LeftDrawer extends StatelessWidget {
	const LeftDrawer({super.key});

	@override
	Widget build(BuildContext context) {
		return Drawer(
			child: ListView(
				children: [
				const DrawerHeader(
					decoration: BoxDecoration(color: Colors.black),
					child: Column(
					children: [
						Text(
						"Asdos Tracker",
						textAlign: TextAlign.center,
						style: TextStyle(
							fontSize: 30,
							fontWeight: FontWeight.bold,
							color: Colors.white,
						),
						),
						Padding(padding: EdgeInsets.all(10)),
						Text(
						"Tambahkan log asdos di sini!!",
						textAlign: TextAlign.center,
						style: TextStyle(
							fontSize: 15,
							fontWeight: FontWeight.normal,
							color: Colors.white,
						),
						),
					],
					),
				),
				ListTile(
					leading: const Icon(Icons.home_outlined),
					title: const Text('Homepage'),

					//Ketika diklik akan ke homepage
					onTap: () {
					Navigator.pushReplacement(context,
						MaterialPageRoute(builder: (context) => MyHomePage()));
					},
				),
				ListTile(
					leading: const Icon(Icons.add_shopping_cart),
					title: const Text("Tambah Item"),

					// ketika diklik akan ke forms add_item
					onTap: () {
					Navigator.push(context,
						MaterialPageRoute(builder: (context) => const AddItemForm()));
					},
				),
				ListTile(
					leading: const Icon(Icons.shopping_bag_outlined),
					title: const Text("Lihat Item"),

					// ketika diklik akan ke list item
					onTap: () {
					Navigator.push(
						context,
						MaterialPageRoute(
							builder: (context) => const ItemPage()));
					},
				),
				],
			),
		);
	}
}