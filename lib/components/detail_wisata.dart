
import 'package:flutter/material.dart';
import 'package:initial_project/env.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class DetailWisata extends StatefulWidget {
  final String id;
  const DetailWisata({Key? key, required this.id }) : super(key: key);

  @override
  _DetailWisataState createState() => _DetailWisataState();
}

class _DetailWisataState extends State<DetailWisata> {
  @override
  void initState() {
    super.initState();
    _DetailPlaces();
  }
  List _place = [];
  String endpoint = EnvirontmentVariable.endpoint;
  Future<void> _DetailPlaces() async {
    String url = "${endpoint}/api/v1/wisata/${widget.id}"; // menggunakan widget.id untuk mengakses atribut id
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      setState(() {
        _place = [data["data"]];
      });
    } else {
      print("Gagal mendapatkan data");
    }
  }

  Widget _buildDetail() {
    if(_place.isEmpty) {
      return Center(child: CircularProgressIndicator());
    } else {
      return SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 100.0,
              width: 50.0,
              child: Image.network(
                  _place[0]['link_image'],
                  fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0, bottom: 16.0),
              child: Text(
                '${_place[0]['nama']}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5.0, right: 5.0, left: 10.0, bottom: 5.0),
              child: Text(
                'Alamat: ',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 2.0, right: 10.0, left: 10.0, bottom: 2.0),
              child: Text(
                '${_place[0]['alamat']}',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Poppins',
                  
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5.0, right: 5.0, left: 10.0, bottom: 5.0),
              child: Text(
                'Deskripsi: ',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 2.0, right: 10.0, left: 10.0, bottom: 2.0),
              child: Text(
                'Deskripsi: ${_place[0]['deskripsi']}',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Wisata'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: _place.isEmpty ? Center(child: CircularProgressIndicator()) : _buildDetail(),
    );
  }
}