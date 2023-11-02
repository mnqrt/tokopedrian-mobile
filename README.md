>1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
Stateless adalah jenis widget yang bersifat final (tidak dapat diubah setelah dideklarasikan) Stateless dapat dianggap sebagai tampilan yang statis. Sedangkan Stateful merupakan jenis widget yang isinya dapat berubah berdasarkan perilaku dari user, contohnya adalah counter yang bertambah setiapkali tombol dipencet.

>2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
* MyHomePage (class): Halaman utama aplikasi.
* Scaffold: Kerangka untuk menyusun elemen-elemen tampilan.
* AppBar: Bagian atas pada aplikasi dengan judul "Tokopedrian".
* body: Bagian utama halaman dengan kontennya.
* SingleChildScrollView: Area konten yang bisa di-scroll.
* Padding: Menambahkan jarak di sekitar kontennya.
* Column: Menampilkan elemen-elemen secara vertikal.
* Text: Menampilkan teks "PBP Shop" sebagai judul toko.
* GridView.count: Menampilkan elemen-elemen dalam tampilan kotak seperti kisi.
* ShopItem (class): Menyimpan informasi tentang item dengan nama dan ikon.
* ShopCard (class): Membuat kartu yang menampilkan ikon dan teks untuk item-item dalam kisi.


>3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)
Saya membuat aplikasi dengan `flutter create tokopedrian_mobile`, kemudian didalam `tokopedrian_mobile` saya menjalankan `flutter run -d mobile`. Setelahnya saya merapikan struktur pada proyek saya dengan memisahkan aplikasi utama pada `main.dart` dengan aplikasi lainnya pada `menu.dart`. Karena data yang saya tampilkan semuanya bersifat statik, saya mengubah semua stateful widget menjadi stateless widget. 

>3a. Membuat tiga tombol sederhana dengan ikon dan teks:
Hal ini saya lakukan dengan membuat `list` dengan 3 elemen diamana tiap elemen merepresentasikan setiap `ShopItem`
```dart=
final List<ShopItem> items = [
    ShopItem("Lihat Produk", Icons.checklist),
    ShopItem("Tambah Produk", Icons.add_shopping_cart),
    ShopItem("Logout", Icons.logout),
  ]; 
 ```

>3b. Memunculkan Snackbar:
Saya membuat class `ShopCard` dimana saya menambahkan fungsi `onTap()` kita menampilkan Snackbar. Berikut adalah implementasinya
```dart=
onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        }
```
