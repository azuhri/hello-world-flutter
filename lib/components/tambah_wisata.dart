import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:initial_project/env.dart';

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  @override
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();
  final TextEditingController _linkImageController = TextEditingController();


  Future<void> _addData() async {
    String endpoint = EnvirontmentVariable.endpoint;
    String url = "${endpoint}/api/v1/wisata";
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
    Map<String, dynamic> body = {
      "nama": _namaController.text,
      "alamat": _alamatController.text,
      "deskripsi": _deskripsiController.text,
      "link_image": _linkImageController.text,
      
    };

    var response = await http.post(Uri.parse(url), headers: headers, body: jsonEncode(body));
    var json = jsonDecode(response.body);
    if (json['status']) {
      // Jika berhasil menambahkan data, tampilkan pesan sukses
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Data berhasil ditambahkan")),
      );

      // setState(() {
      //   // Bersihkan nilai pada text controller
      // });
        _namaController.clear();
        _alamatController.clear();
        _deskripsiController.clear();
        _linkImageController.clear();

        Navigator.pop(context, true);
    } else {
      // Jika gagal menambahkan data, tampilkan pesan error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.pink.shade100,
          content: Text(
            "${json['message']}",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.pinkAccent.shade700,
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
              fontFamily: 'Poppins',
            ),
          )
        ),
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Data"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(
                  labelText: "Nama Wisata",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _alamatController,
                decoration: InputDecoration(
                  labelText: "Alamat Wisata",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _deskripsiController,
                decoration: InputDecoration(
                  labelText: "Deskripsi Wisata",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _linkImageController,
                decoration: InputDecoration(
                  labelText: "Link Gambar Wisata",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _addData,
                child: Text("Tambah"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}