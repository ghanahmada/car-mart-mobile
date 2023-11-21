import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:car_mart_mobile/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:car_mart_mobile/widgets/left_drawer.dart';
import 'package:car_mart_mobile/widgets/globals.dart' as globals;
import 'package:car_mart_mobile/screens/data_mobil.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class CarFormPage extends StatefulWidget {
    const CarFormPage({super.key});

    @override
    State<CarFormPage> createState() => _CarFormPageState();
}

class Car {
  late String name;
  late int price;
  late int amount;
  late String category;
  late String description;

  Car(
      {required this.name, 
      required this.price,
      required this.amount,
      required this.category, 
      required this.description});
}

class _CarFormPageState extends State<CarFormPage> {
    final _formKey = GlobalKey<FormState>();
    String _name = "";
    int _amount = 0;
    int _price = 0;
    String _category = "";
    String _description = "";

  //   onPressed(BuildContext context) {
  //   var data =
  //     Car(name: _name, price: _price, amount: _amount, category: _category, description: _description);
  //   globals.listMobil.add(data);
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(builder: (context) => const DataMobilPage()),
  //   );
  // }

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();

        return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Add New Item',
            ),
          ),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),
        // TODO: Tambahkan drawer yang sudah dibuat di sini
        drawer: const LeftDrawer(),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Name",
                      labelText: "Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _name = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Name cannot be empty!";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Price",
                      labelText: "Price",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // TODO: Tambahkan variabel yang sesuai
                    onChanged: (String? value) {
                      setState(() {
                        _price = int.parse(value!);
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Price cannot be empty!";
                      }
                      if (int.tryParse(value) == null) {
                        return "Price must be numerical!";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Amout",
                      labelText: "Amout",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // TODO: Tambahkan variabel yang sesuai
                    onChanged: (String? value) {
                      setState(() {
                        _amount = int.parse(value!);
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Amount cannot be empty!";
                      }
                      if (int.tryParse(value) == null) {
                        return "Amount must be numerical!";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Category",
                      labelText: "Category",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        // TODO: Tambahkan variabel yang sesuai
                        _category = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Category cannot be empty!";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Description",
                      labelText: "Description",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        // TODO: Tambahkan variabel yang sesuai
                        _description = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Description cannot be empty!";
                      }
                      return null;
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.indigo),
                      ),
                      onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                              // Kirim ke Django dan tunggu respons
                              // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                              // final response = await request.postJson(
                              // "http://localhost:8000/create-flutter/",
                              // jsonEncode(<String, String>{
                              //     'name': _name,
                              //     'price': _price.toString(),
                              //     'amount': _amount.toString(),
                              //     'category': _category,
                              //     'description': _description,
                              //     // TODO: Sesuaikan field data sesuai dengan aplikasimu
                              // }));
                              final http.Response response = await http.post(
                                  Uri.parse("http://localhost:8000/create-flutter/"),
                                  headers: <String, String>{
                                    'Content-Type': 'application/json',
                                  },
                                  body: jsonEncode(<String, String>{
                                    'name': _name,
                                    'price': _price.toString(),
                                    'amount': _amount.toString(),
                                    'category': _category,
                                    'description': _description,
                                  }),
                                );
                              if (response.statusCode == 200) {
                              // Successful response
                              final Map<String, dynamic> responseBody = jsonDecode(response.body);

                              if (responseBody['status'] == 'success') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Produk baru berhasil disimpan!"),
                                  ),
                                );
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => MyHomePage()),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Terdapat kesalahan, silakan coba lagi."),
                                  ),
                                );
                              }
                            }
                          }
                      },
                      child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
             )
          ),
        ),
      );
    }
}