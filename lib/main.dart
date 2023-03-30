import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:initial_project/components/detail_wisata.dart';
import 'package:initial_project/components/tambah_wisata.dart';
import 'package:initial_project/env.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tempat Wisata',
      home: Navigator(
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(
                builder: (context) => HomePage(),
              );
            case '/add':
              return MaterialPageRoute(
                builder: (context) => AddData(),
              );
            default:
              return null;
          }
        },
        initialRoute: '/',
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _places = [];
  String endpoint = EnvirontmentVariable.endpoint;
  Future<void> _getPlaces() async {
    String url = '${endpoint}/api/v1/wisata'; // ganti dengan URL endpoint API tempat wisata yang ingin diakses
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      setState(() {
        _places = data["data"];
      });
    } else {
      print("Gagal mendapatkan data");
    }
  }

  @override
  void initState() {
    super.initState();
    _getPlaces();
  }

  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Tempat Wisata'),
  //       actions: [
  //         IconButton(
  //           icon: Icon(Icons.add),
  //           onPressed: () {
  //             Navigator.pushNamed(context, '/add').then((value) => setState(() => 
  //               _getPlaces()
  //             ));
  //           },
  //         ),
  //       ],
  //     ),
  //     body: ListView.builder(
  //       itemCount: widget._places.length,
  //       itemBuilder: (context, index) {
  //         return ListTile(
  //           leading: CircleAvatar(
  //             backgroundImage: NetworkImage(widget._places[index]['link_image']),
  //           ),
  //           title: Text(widget._places[index]['nama']),
  //           subtitle: Text(widget._places[index]['alamat']),
  //           trailing: Icon(Icons.arrow_forward_ios),
  //           onTap: () {
  //             Navigator.push(context, MaterialPageRoute(builder: (context) {
  //               return DetailWisata(id: widget._places[index]['id'].toString());
  //             }));
  //           },
  //         );
  //       },
  //     ),
  //   );
  // }
 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Tempat Wisata'),
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, '/add').then((value) => setState(() => 
              _getPlaces()
            ));
          },
        ),
      ],
    ),
    body: FutureBuilder(
      future: _getPlaces(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          return ListView.builder(
            itemCount: _places.length,
            itemBuilder: (context, index) {
              return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(_places[index]['link_image']),
                  ),
                  title: Text(_places[index]['nama']),
                  subtitle: Text(_places[index]['alamat']),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return DetailWisata(id: _places[index]['id'].toString());
                    }));
                  },
              );
            },
          );
        }
      },
    ),
  );
}
}