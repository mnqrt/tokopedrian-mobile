import 'package:flutter/material.dart';
import 'package:tokopedrian_mobile/screens/shoplist_form.dart';
import 'package:tokopedrian_mobile/screens/show_product.dart';


class ShopItem {
  final String name;
  final IconData icon;

  ShopItem(this.name, this.icon);
}

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  Color getButtonColor(ShopItem item) {
    // Fungsi ini akan mengembalikan warna latar belakang sesuai dengan nama tombol
    switch (item.name) {
      case "Lihat Produk":
        return Colors.amber;
      case "Tambah Produk":
        return Colors.lime;
      case "Logout":
        return Colors.redAccent;
      default:
        return Colors.indigo; 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: getButtonColor(item), // Menggunakan fungsi getButtonColor
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
          // Navigate ke route yang sesuai (tergantung jenis tombol)
          if (item.name == "Tambah Produk") {
            // TODO: Gunakan Navigator.push untuk melakukan navigasi ke MaterialPageRoute yang mencakup ShopFormPage.
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ShopFormPage()),
            );
          }

          if (item.name == "Lihat Produk") {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductListPage(products: productList)),
            );
          }
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), // Set the border radius here
            color: getButtonColor(item),
          ),
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}