import 'package:flutter/material.dart';
import 'package:initial_project/components/detail_screen.dart';
import 'package:initial_project/components/done_tourism_list.dart';
import 'package:initial_project/model/tourism_place.dart';
import 'package:initial_project/components/list_item.dart';

class MainScreen extends StatefulWidget{
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<TourismPlace> doneTourismPlaceList = [];
  final List<TourismPlace> tourismPlaceList = [
    TourismPlace(
      name: 'Surabaya Submarine Monument',
      location: 'Jl Pemuda Raya',
      imagePath: [
        'assets/images/image_1.png',
        'assets/images/image_1.png',
        'assets/images/image_1.png',
        'assets/images/image_1.png',
      ],
   ),
  ];

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WISATA SURABAYA'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (ctx) {
                  return DoneTourismList(doneTourismPlaceList: doneTourismPlaceList);
                }),);
            },
            icon: const Icon(Icons.done_outline)
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          final TourismPlace place = tourismPlaceList[index];
          return InkWell(
             onTap: () {
                  Navigator.push(ctx, MaterialPageRoute(builder: (context) {
                  return DetailScreen(place: place);
              }));
            },
            child: ListItem(
              place: place,
              isDone: doneTourismPlaceList.contains(place),
              onCheckboxClick: (bool? value) {
                setState(() {
                  if(value!=null) {
                    value ? doneTourismPlaceList.add(place) : doneTourismPlaceList.remove(place);
                  }
                });
              },
            ),
        );
      },
        itemCount: tourismPlaceList.length,
      ),
    );
  }
}