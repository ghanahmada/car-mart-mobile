import 'package:flutter/material.dart';
import 'package:car_mart_mobile/screens/menu.dart';
import 'package:car_mart_mobile/screens/carlist_form.dart';
import 'package:car_mart_mobile/screens/data_mobil.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.indigo,
              ),
              child: Column(
                children: [
                  Text(
                    'Car Mart',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Text(
                    "Catat seluruh keperluan belanjamu di sini!",
                    textAlign: TextAlign.center, 
                    style: TextStyle(
                      fontSize: 15.0, 
                      color: Colors.white, 
                      fontWeight: FontWeight.normal, 
                    ),
                  ),
                ],
              ),
            ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Mobil'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              /*
              TODO: Buatlah routing ke ShopFormPage di sini,
              setelah halaman ShopFormPage sudah dibuat.
              */
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CarFormPage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.directions_car),
            title: const Text('Lihat Mobil'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              /*
              TODO: Buatlah routing ke ShopFormPage di sini,
              setelah halaman ShopFormPage sudah dibuat.
              */
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DataMobilPage(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}