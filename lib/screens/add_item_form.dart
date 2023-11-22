import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tokopedrian_mobile/screens/item_list_page.dart';
import 'package:tokopedrian_mobile/screens/menu.dart';
import 'package:tokopedrian_mobile/widgets/left_drawer.dart';
import 'package:tokopedrian_mobile/models/Item.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class AddItemForm extends StatefulWidget {
	const AddItemForm({super.key});

	@override
	State<AddItemForm> createState() => _AddItemState();
}

class _AddItemState extends State<AddItemForm> {
	final _formKey = GlobalKey<FormState>();
	String _name = "";
	int _amount = 0;
  int _price = 0;
	String _description = "";

	@override
	Widget build(BuildContext context) {
		final request = context.watch<CookieRequest>();
		return Scaffold(
		appBar: AppBar(
			title: const Center(
			child: Text(
				"TAMBAH ITEM",
			),
			),
			backgroundColor: Colors.black87,
			foregroundColor: Colors.white,
		),
		// tempat drawer
		drawer: const LeftDrawer(),

		//nampilin body page
		body: Form(
			key: _formKey,
			child: SingleChildScrollView(
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
				Padding(
					padding: const EdgeInsets.all(8),
					child: TextFormField(
					decoration: InputDecoration(
						hintText: "Nama Produk",
						labelText: "Nama Produk",
						border: OutlineInputBorder(
							borderRadius: BorderRadius.circular(5))),
					// isi dari formnya
					onChanged: (String? value) {
						setState(() {
						_name = value!;
						});
					},
					validator: (String? value) {
						if (value == null || value.isEmpty) {
						return "Nama tidak boleh kosong!";
						}
						return null;
					},
					),
				),
        Padding(
					padding: const EdgeInsets.all(8.0),
					child: TextFormField(
					decoration: InputDecoration(
						hintText: "Harga Produk",
						labelText: "Harga Produk",
						border: OutlineInputBorder(
						borderRadius: BorderRadius.circular(5.0),
						),
					),

					// ketika disi formnya, variabelnya akan selalu diisi
					onChanged: (String? value) {
						setState(() {
						_price = int.parse(value!);
						});
					},
					validator: (String? value) {
						if (value == null || value.isEmpty) {
						return "Jumlah item tidak boleh kosong!";
						}
						if (int.tryParse(value) == null) {
						return "Jumlah item harus berupa integer!";
						}
						return null;
					},
					),
				),
				Padding(
					padding: const EdgeInsets.all(8.0),
					child: TextFormField(
					decoration: InputDecoration(
						hintText: "Jumlah Produk",
						labelText: "Jumlah Produk",
						border: OutlineInputBorder(
						borderRadius: BorderRadius.circular(5.0),
						),
					),

					// ketika disi formnya, variabelnya akan selalu diisi
					onChanged: (String? value) {
						setState(() {
						_amount = int.parse(value!);
						});
					},
					validator: (String? value) {
						if (value == null || value.isEmpty) {
						return "Jumlah item tidak boleh kosong!";
						}
						if (int.tryParse(value) == null) {
						return "Jumlah item harus berupa integer!";
						}
						return null;
					},
					),
				),
				Padding(
					padding: const EdgeInsets.all(8.0),
					child: TextFormField(
					decoration: InputDecoration(
						hintText: "Deskripsi",
						labelText: "Deskripsi",
						border: OutlineInputBorder(
						borderRadius: BorderRadius.circular(5.0),
						),
					),
					onChanged: (String? value) {
						setState(() {
						_description = value!;
						});
					},
					validator: (String? value) {
						if (value == null || value.isEmpty) {
						return "Deskripsi tidak boleh kosong";
						}
						return null;
					},
					),
				),

				Align(
					alignment: Alignment.bottomCenter,
					child: Padding(
					padding: const EdgeInsets.all(8),
					child: ElevatedButton(
						style: ButtonStyle(
						backgroundColor:
							MaterialStateProperty.all(Colors.black87),
						),
						child: const Text(
						"Save",
						style: TextStyle(color: Colors.white),
						),
						onPressed: () async {
							if (_formKey.currentState!.validate()) {
								// Kirim ke Django dan tunggu respons
								// TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
								final response = await request.postJson(
								"http://127.0.0.1:8000/create-flutter/",
								jsonEncode(<String, String>{
									'name': _name,
                  'price': _price.toString(),
									'amount': _amount.toString(),
									'description': _description,
									// TODO: Sesuaikan field data sesuai dengan aplikasimu
								}));
								if (response['status'] == 'success') {
									ScaffoldMessenger.of(context)
										.showSnackBar(const SnackBar(
									content: Text("Item baru berhasil disimpan!"),
									));
									Navigator.pushReplacement(
										context,
										MaterialPageRoute(builder: (context) => MyHomePage()),
									);
								} else {
									ScaffoldMessenger.of(context)
										.showSnackBar(const SnackBar(
										content:
											Text("Terdapat kesalahan, silakan coba lagi."),
									));
								}
							}
						},
					),
					),
				)
				],
			),
			),
		),
		);
	}
}