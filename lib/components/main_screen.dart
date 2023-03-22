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
      desc: 'Museum inside a decommissioned Russian war submarine with tours & an adjacent park with cafes. Clean and well maintained. Car parka cost 10k, entrance fee 15k/person. You can see KRI Pasopati there, it is a russian whiskey class. You can also watch the video about the Indonesian Navy at the building beside the submarine',
      location: 'Jl Pemuda Raya',
      day: 'Setiap Hari',
      time: '08:00 - 16:30',
      price: 'Rp 5.000',
      imagePath: [
        'assets/images/image_1.png',
        'assets/images/image_2.jpeg',
        'assets/images/image_3.jpeg',
        'assets/images/image_5.jpeg',
      ],
   ),
   TourismPlace(
      name: 'Kebun Binatang Surabay',
      location: 'Jl. Setail No.1, Darmo, Kec. Wonokromo, Kota SBY, Jawa Timur 60241',
      desc: 'Kebun Binatang Surabaya adalah salah satu kebun binatang yang populer di Indonesia dan terletak di Surabaya. KBS merupakan kebun binatang yang pernah terlengkap se-Asia Tenggara, di dalamnya terdapat lebih dari 230 spesies satwa yang berbeda yang terdiri lebih dari 2179 ekor satwa',
      day: 'Setiap Hari',
      time: '08:00 - 15:00',
      price: 'Rp 8.000',
      imagePath: [
        'assets/images/kebunbinatan_2.jpeg',
        'assets/images/kebunbinatan_3.jpeg',
        'assets/images/kebunbinatan_4.jpeg',
        'assets/images/kebunbinatan_1.jpeg',
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