import 'package:flutter/material.dart';
import 'package:initial_project/model/tourism_place.dart';
import 'package:initial_project/components/detail_screen.dart';

import 'list_item.dart';


class TourismList extends StatefulWidget{
  final List<TourismPlace> doneTourismPlaceList;

  const TourismList({
    Key? key,
    required this.doneTourismPlaceList
  }) : super(key: key);

  @override
  _TourismListState createState() => _TourismListState(doneTourismPlaceList);
}

class _TourismListState extends State<TourismList> {
  List<TourismPlace> doneTourismPlaceList = [];
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
  
  _TourismListState(this.doneTourismPlaceList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                    value ? doneTourismPlaceList.add(place) : doneTourismPlaceList.remove(place)
                  }
                });
              },
            ),
        );
      },
        itemCount: tourismPlaceList.length,
      );
  }
}