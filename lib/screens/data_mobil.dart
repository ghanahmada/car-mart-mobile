import 'package:flutter/material.dart';
import 'package:car_mart_mobile/main.dart';
import 'package:car_mart_mobile/screens/carlist_form.dart';
import 'package:car_mart_mobile/widgets/left_drawer.dart';
import 'package:car_mart_mobile/widgets/globals.dart' as globals;

class DataMobilPage extends StatefulWidget {
  const DataMobilPage({super.key});

  @override
  State<DataMobilPage> createState() => _DataMobilPage();
}

class _DataMobilPage extends State<DataMobilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Mobil'),
      ),
      drawer: const LeftDrawer(),
      body: Center(
          child: ListView.builder(
            itemCount: globals.listMobil.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.circular(5.0),
                    shadowColor: Colors.blueGrey,
                    child: ListTile(
                      title: Text(globals.listMobil[index].name),
                      subtitle: Text(globals.listMobil[index].description),
                      trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Jumlah : ${globals.listMobil[index].amount}")
                          ]),
                    )),
              );
            }),
          )),
    );
  }
}