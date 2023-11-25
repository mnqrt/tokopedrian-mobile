import 'package:flutter/material.dart';
import 'package:tokopedrian_mobile/models/Item.dart';
import 'package:tokopedrian_mobile/screens/item_list_page.dart';
import 'package:tokopedrian_mobile/widgets/item_card.dart';
import 'package:tokopedrian_mobile/widgets/left_drawer.dart';

class MyHomePage extends StatelessWidget {
	MyHomePage({Key? key}) : super(key: key);

	final List<ShopItem> items = [
		ShopItem("Lihat Item",  Icons.checklist, const Color(0xFF1A46BD)),
		ShopItem("Tambah Item", Icons.add_shopping_cart, const Color(0xFF0F286B)),
		ShopItem("Logout", Icons.logout, const Color(0xFF091840)),
	];

	@override
	Widget build(BuildContext context) {
		return Scaffold(
		appBar: AppBar(
			title: const Center(
			child: Text(
				'Asdos Tracker',
				style: TextStyle(color: Colors.white),
			),
			),
			backgroundColor: Color.fromARGB(221, 67, 182, 54),
			foregroundColor: Colors.white,
		),
		drawer: const LeftDrawer(),
		body: SingleChildScrollView(
			// Widget wrapper yang dapat discroll
			child: Padding(
			padding: const EdgeInsets.all(10.0), // Set padding dari halaman
			child: Column(
				// Widget untuk menampilkan children secara vertikal
				children: <Widget>[
				const Padding(
					padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
					// Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
					child: Text(
					'Welcome to Asdos Tracker', // Text yang menandakan toko
					textAlign: TextAlign.center,
					style: TextStyle(
						fontSize: 30,
						fontWeight: FontWeight.bold,
					),
					),
				),
				// Grid layout
				GridView.count(
					// Container pada card kita.
					primary: true,
					padding: const EdgeInsets.all(20),
					crossAxisSpacing: 10,
					mainAxisSpacing: 10,
					crossAxisCount: 3,
					shrinkWrap: true,
					children: items.map((ShopItem item) {
					// Iterasi untuk setiap item
					return ShopCard(item);
					}).toList(),
				),
				],
			),
			),
		),
		);
	}
}