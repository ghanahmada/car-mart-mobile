## Ghana Ahmada Yudistira (2206824760 - PBP B)

![image](images/car-mart-mobile.png)

## Tugas 7

### 1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?

**Stateless Widget** adalah tipe widget yang tetap tidak berubah setelah dibuat. Dalam konteks ini, setelah suatu Stateless Widget menggambarkan data tertentu, widget tersebut tidak dapat mengubah data tersebut atau melakukan perubahan pada dirinya sendiri berdasarkan perubahan data. Penggunaan Stateless Widget tepat ketika komponen atau tampilan tidak membutuhkan pembaruan berdasarkan perubahan data. Stateless Widget memiliki keunggulan dalam efisiensinya karena tidak menyimpan informasi status (state) internal.

Contoh penggunaan Stateless Widget terjadi ketika sebuah widget hanya menampilkan teks statis atau gambar yang tidak mengalami perubahan, tanpa ada kebutuhan untuk mengubahnya berdasarkan masukan atau interaksi pengguna.

Di sisi lain, **Stateful Widget** adalah tipe widget yang dapat mengalami perubahan dan memperbarui tampilannya berdasarkan perubahan data atau respons terhadap interaksi pengguna. Stateful Widget sangat berguna ketika suatu komponen memerlukan pembaruan yang dinamis sehubungan dengan input, respons terhadap tindakan pengguna, atau perubahan data eksternal. Widget ini memungkinkan perubahan dalam tampilan dan memperbarui ulang widget ketika terjadi perubahan pada data yang terkait.

Sebagai contoh penggunaan Stateful Widget, Anda dapat membayangkan sebuah formulir pengguna yang mengubah tampilan berdasarkan input yang diberikan oleh pengguna, atau sebuah daftar item yang perlu diperbarui secara dinamis berdasarkan perubahan data yang diterima dari sumber eksternal. Dalam kedua contoh tersebut, Stateful Widget memungkinkan pengembang untuk mengelola dan menanggapi perubahan dengan fleksibilitas, memastikan bahwa tampilan aplikasi selalu up-to-date dan sesuai dengan data yang relevan.

### 2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
### 2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.

Di dalam berkas `main.dart`, aplikasi Flutter dibangun menggunakan `MaterialApp` sebagai landasan utama. `MaterialApp` bertanggung jawab mengatur tema dan navigasi global aplikasi. `ThemeData` digunakan untuk memberikan tema yang seragam di seluruh aplikasi. `ColorScheme.fromSeed` digunakan untuk menghasilkan skema warna berdasarkan warna benih yang diberikan. Hal ini menciptakan tampilan yang konsisten dan estetis secara visual.

`AppBarTheme` secara spesifik mengonfigurasi tampilan `AppBar` di seluruh aplikasi dengan menetapkan latar belakang (background color) menjadi warna indigo yang sama dengan tema keseluruhan. Widget utama aplikasi, `MyApp`, menggambarkan inti dari aplikasi. Itu mengarahkan pengguna ke `MyHomePage`, yang berfungsi sebagai halaman utama. `MyHomePage` adalah widget stateless yang menggunakan `Scaffold` sebagai kerangka dasar. Di dalam `Scaffold`, digunakan `GridView.count` untuk membuat tata letak grid yang menampung elemen-elemen seperti `ShopCard`. `ShopCard` adalah representasi visual dari `ShopItem`, dengan judul dan ikon.

Setiap `ShopCard` diinteraksikan dengan pengguna dan dibungkus dalam `Material` dan `InkWell` untuk memberikan efek visual dan umpan balik saat disentuh. Ketika diklik, `ShopCard` menampilkan `SnackBar` sebagai respons. Widget lain seperti `Column` dan `Padding` digunakan untuk menyusun dan memberikan ruang antar elemen-elemen. `Container`, `Center`, `Icon`, dan `Text` digunakan untuk menampilkan informasi dan ikonografi dengan cara yang estetis dan memberikan fokus pada pengalaman pengguna.


### 3. Implementasi

#### Membuat program Flutter baru dengan tema *inventory*
Masuk ke direktori tugas dan jalankan command 
```sh
flutter create car_mart_mobile

cd car_mart_mobile

flutter run
```
Base program flutter bernama `car_mart_mobile` sudah terbuat dan bisa langsung dimodifikasi sesuai keinginan.

#### Membuat tiga tombol sederhana dengan ikon dan teks
1. Buat berkas Dart baru dengan nama menu.dart dalam direktori lib.

2. Pada awal berkas menu.dart, tambahkan baris kode import 'package:flutter/material.dart'; untuk mengimpor paket Material Design, yang menyediakan berbagai widget yang digunakan dalam aplikasi Flutter.

3. Pindahkan kelas MyHomePage dari berkas main.dart ke dalam berkas menu.dart. Kelas MyHomePage ini akan bertanggung jawab untuk menampilkan tampilan utama dari aplikasi.

4. Hapus kelas _MyHomePageState karena pada tahap ini kita akan membuat widget yang tidak memiliki status (stateless).

5. Buat kelas `ShopItem` dan `ShopCard` untuk membuat tombol dan snackbar yang dibutuhkan
    ```java
    class ShopItem {
    final String name;
    final IconData icon;
    final Color color;

    ShopItem(this.name, this.icon, this.color);
    }

    class ShopCard extends StatelessWidget {  //CLASS SHOPCARD
        final ShopItem item;

        const ShopCard(this.item, {super.key}); // Constructor

        @override
        Widget build(BuildContext context) {
            return Material(
            color: item.color,
            child: InkWell(
                // Area responsive terhadap sentuhan
                onTap: () {
                // Memunculkan SnackBar ketika diklik
                ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                        content: Text("Kamu telah menekan tombol ${item.name}!")));
                },
                child: Container(
                // Container untuk menyimpan Icon dan Text
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
    ```
6. Modifikasi `MyHomePage` untuk menampilkan tiga tombol yang dibutuhkan

    ```java
    class MyHomePage extends StatelessWidget {
        MyHomePage({Key? key}) : super(key: key);
        final List<ShopItem> items = [
        ShopItem("Lihat Item", Icons.checklist, Color(0xFF006CA5)),
        ShopItem("Tambah Item", Icons.add_shopping_cart, Color(0xFF0496C7)),
        ShopItem("Logout", Icons.logout, Color(0xFF04BADE)),
    ];

        @override
        Widget build(BuildContext context) {
            // This method is rerun every time setState is called, for instance as done
            // by the _incrementCounter method above.
            //
            // The Flutter framework has been optimized to make rerunning build methods
            // fast, so that you can just rebuild anything that needs updating rather
            // than having to individually change instances of widgets.
            return Scaffold(
            appBar: AppBar(
                title: const Text(
                'Libshop',
                ),
            ),
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
                        'Library Shop', // Text yang menandakan toko
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
    ```

#### Memunculkan Snackbar dengan tulisan sesuai widget yang diklik
Menambahkan widget `InkWell` yang menampilkan ikon dan teks dari `item` saat ditekan. Saat tombol ditekan, kode memunculkan Snackbar dengan pesan `"Kamu telah menekan tombol [nama item]!"`.

```java
...
child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
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
...
```

## Tugas 8


### 1. Jelaskan perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()`, disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!

`Navigator.push()` berfungsi untuk menambahkan halaman baru ke dalam tumpukan navigasi, memungkinkan pengguna kembali ke halaman sebelumnya melalui tombol kembali pada perangkat. Sebagai contoh, ketika pengguna ingin melihat detail suatu item dari daftar, mereka dapat membuka halaman detail, yang kemudian akan dimasukkan ke dalam tumpukan navigasi.

Sementara `Navigator.pushReplacement()` digunakan untuk menggantikan halaman saat ini dengan halaman baru. Dengan kata lain, saat pengguna menekan tombol kembali, mereka akan langsung kembali ke halaman sebelumnya sebelum halaman saat ini. Contohnya adalah ketika pengguna menyelesaikan tugas pada halaman saat ini dan ingin kembali ke halaman sebelumnya, halaman saat ini akan diganti dengan halaman baru yang menampilkan pesan sukses atau ringkasan dari tugas yang telah selesai.

### 2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!

Widget layout di Flutter merupakan elemen yang berfungsi untuk mengatur susunan atau tata letak dari widget lainnya. Berikut beberapa widget layout pada Flutter beserta situasi penggunaannya:

1. **Row dan Column:** Widget ini digunakan untuk menyusun tata letak secara horizontal (Row) atau vertikal (Column). Widget-widget yang ditempatkan di dalam Row atau Column akan diatur secara berurutan dari kiri ke kanan (Row) atau dari atas ke bawah (Column).

2. **Container:** Widget ini berguna untuk membuat kotak yang dapat diatur ukurannya, warna, dan dekorasinya. Selain itu, Container dapat digunakan untuk mengatur jarak antar widget dengan properti seperti padding dan margin.

3. **Stack:** Widget ini berguna untuk menumpuk widget di atas satu sama lain. Widget-widget yang ditempatkan di dalam Stack akan ditumpuk sesuai dengan urutan penempatannya.

4. **Expanded:** Widget ini digunakan untuk mengisi ruang kosong yang tersisa pada Row atau Column. Widget yang ditempatkan di dalam Expanded akan diberikan ukuran yang tersisa setelah widget lainnya mendapatkan ukuran.

5. **GridView:** Widget ini berguna untuk menampilkan daftar widget dalam bentuk grid. GridView dapat digunakan untuk menampilkan daftar yang berisi banyak item dengan ukuran yang sama.

6. **ListView:** Widget ini digunakan untuk menampilkan daftar widget secara berurutan. ListView dapat digunakan untuk menampilkan daftar yang panjang atau tidak terbatas.

7. **Wrap:** Widget ini digunakan untuk menampilkan daftar widget dalam bentuk baris yang dapat melintasi beberapa baris. Widget-widget yang ditempatkan di dalam Wrap akan diatur secara berurutan dari kiri ke kanan dan dari atas ke bawah.

8. **SizedBox:** Widget ini berguna untuk membuat kotak kosong dengan ukuran tertentu. SizedBox dapat digunakan untuk memberikan jarak antar widget atau untuk membuat widget dengan ukuran yang spesifik.

### 3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!

elemen-elemen input yang digunakan pada tugas saya adalah `TextFormField` untuk Nama Mobil, Jumlah, dan Deskripsi. Masing-masing digunakan untuk memasukkan informasi tentang mobil yang ingin ditambahkan, dan setiap elemen memiliki validasi yang sesuai untuk memastikan data yang dimasukkan sesuai dengan kebutuhan aplikasi.

### 4. Bagaimana penerapan clean architecture pada aplikasi Flutter?

*Clean Architecture* adalah suatu pendekatan dalam pengembangan perangkat lunak yang dirancang untuk memisahkan konsep dan tanggung jawab dalam aplikasi. Pada umumnya, *Clean Architecture* mengusulkan pembagian kode ke dalam lapisan-lapisan yang independen dan terpisah. Pada aplikasi Flutter, kita dapat menerapkan *Clean Architecture* dengan mengikuti prinsip-prinsip utamanya. Berikut adalah panduan umumnya:

1. Pemisahan Lapisan:
- Domain Layer (Core): Ini adalah lapisan inti yang berisi aturan bisnis, entitas, dan objek nilai. Lapisan ini tidak boleh bergantung pada lapisan lain.

- Data Layer: Lapisan ini bertanggung jawab untuk mengakses dan menyimpan data. Repositori yang berkomunikasi dengan data lokal atau eksternal berada di sini.

- Presentation Layer: Lapisan ini adalah tampilan aplikasi, seperti UI dan logika presentasi. Ini berkomunikasi dengan lapisan Domain untuk mendapatkan data dan menerapkan logika bisnis.

2. Dependency Rule:

- Lapisan yang lebih dalam (misalnya, Domain dan Data) tidak boleh bergantung pada lapisan yang lebih luar (misalnya, Presentation).

- Aturan ini memastikan bahwa perubahan di lapisan luar tidak mempengaruhi lapisan dalam.

3. Entity, Use Case, dan Interface:

- Entity: Mewakili objek inti dalam domain bisnis.

- Use Case (Interactor): Mengandung logika bisnis dan menghubungkan antara lapisan Domain dan Data. Ini berisi aturan bisnis dan menggunakan repositori untuk mendapatkan atau menyimpan data.

- Interface: Berisi kontrak untuk repositori dan use case agar dapat diimplementasikan oleh lapisan Data.

Contoh struktur proyek Flutter dengan *Clean Architecture* dapat terlihat seperti berikut:

```css
lib/
  ├── core/
  │   ├── entities/
  │   ├── usecases/
  │   └── repositories/
  ├── data/
  │   ├── repositories/
  │   ├── models/
  │   └── datasources/
  ├── presentation/
  │   ├── pages/
  │   ├── widgets/
  │   └── blocs/
  └── main.dart

```
- `core`: Lapisan Domain
- `data`: Lapisan Data
- `presentation`: Lapisan Presentation

### 5. Implementasi 

####  Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru 
Saya membuat sebuah direktori baru dalam proyek Flutter Anda dengan nama `screens`. Di dalam direktori tersebut, saya menambahkan sebuah file baru dengan nama `carlist_form.dart`. Di dalam file tersebut, saya membuat Stateful Widget yang diberi nama `CarFormPage`.

Lalu, saya menambahkan global key untuk form dengan menggunakan final _formKey = GlobalKey<FormState>();. Selanjutnya, buat elemen-elemen input yang dibutuhkan, seperti `name`, `amount`, dan `description`.

Selanjutnya, saya menyusun form di dalam bagian body dari `Scaffold`. Tambahkan validasi untuk semua elemen input yang dibuat. Setelah itu, tambahkan tombol `Save` yang, ketika ditekan, akan menampilkan sebuah dialog yang memberitahu bahwa data berhasil disimpan.

#### Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama.
Pada bagian onTap pada CarCard, saya memanfaatkan fungsi dari widget navigator yaitu `Navigator.push()` untuk menambahkan halaman baru ke dalam tumpukan navigasi.

```python
if (item.name == "Tambah Item") {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const CarFormPage()));
  }
```

#### Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru.
Pada file `carlist_form.dart`, saya membuat `AlertDialog` untuk menampilkan detail input yang diberikan pada 3 input variabel seperti berikut.

```python
onPressed: () {
    if (_formKey.currentState!.validate()) {
            showDialog(
                context: context,
                builder: (context) {
                return AlertDialog(
                    title: const Text('Mobil berhasil tersimpan'),
                    content: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                        Text('Nama: $_name'),
                        Text('Jumlah: $_amount'),
                        Text('Deskripsi: $_description'),
                        ],
                    ),
                    ),
                    actions: [
                    TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                        onPressed(context);
                        },
                    ),
                    ],
                );
              }
            ),
        }
    }
```

#### Membuat sebuah drawer pada aplikasi
dalam direktori widgets tambahkan file dart baru dengan nama `left_drawer.dart`. buatlah drawer header. Lalu buatlah widget `ListTile` untuk menyimpan menu-menu yang akan ditampilkan pada drawer. Jangan lupa gunakan widget navigator untuk mengarahkan pengguna ke halaman yang diinginkan.