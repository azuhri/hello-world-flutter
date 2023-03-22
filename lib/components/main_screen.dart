import 'package:flutter/material.dart';
import 'package:initial_project/components/detail_screen.dart';
import 'package:initial_project/components/done_tourism_list.dart';
import 'package:initial_project/components/tourism_list.dart';
import 'package:initial_project/model/tourism_place.dart';
import 'package:initial_project/components/list_item.dart';

class MainScreen extends StatefulWidget{
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WISATA SURABAYA'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                ctx,
                MaterialPageRoute(builder: (ctx) {
                  return DoneTourismList();
                }),);
            },
            icon: const Icon(Icons.done_outline)
          )
        ],
      ),
      body: const TourismList(),
    );
  }
}