import 'package:flutter/material.dart';
import 'package:car_mart_mobile/widgets/left_drawer.dart';
import 'package:car_mart_mobile/screens/carlist_form.dart';
import 'package:car_mart_mobile/widgets/car_card.dart';


class MyHomePage extends StatelessWidget {
      MyHomePage({Key? key}) : super(key: key);
      final List<CarItem> items = [
      CarItem(1, "Lihat Mobil", Icons.checklist, Color(0xFF006CA5)),
      CarItem(2, "Tambah Mobil", Icons.add_shopping_cart, Color(0xFF0496C7)),
      CarItem(3, "Logout", Icons.logout, Color(0xFF04BADE)),
  ];

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
                'Car Mart',
                ),
                backgroundColor: Colors.indigo,
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
                        'Car Shop', // Text yang menandakan toko
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
                        children: items.map((CarItem item) {
                        // Iterasi untuk setiap item
                        return CarCard(item);
                        }).toList(),
                    ),
                    ],
                ),
                ),
            ),
        );
    }
}

