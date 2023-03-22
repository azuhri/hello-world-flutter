import 'package:flutter/material.dart';
import 'package:initial_project/model/tourism_place.dart';
import 'package:initial_project/components/detail_screen.dart';
import 'package:initial_project/provider/done_tourism_provider.dart';
import 'package:provider/provider.dart';
import 'package:initial_project/provider/done_tourism_provider.dart';

import 'list_item.dart';


class TourismList extends StatefulWidget{
  const TourismList({Key? key}) : super(key: key);

  @override
  _TourismListState createState() => _TourismListState();
}

class _TourismListState extends State<TourismList> {
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
            child: Consumer<DoneTourismProvider>(
               builder: (ctx, DoneTourismProvider data, widget) {
                  return  ListItem(
                            place: place,
                            isDone: data.doneTourismProvider.contains(place),
                            onCheckboxClick: (bool? value) {
                              data.complete(place, value!);
                            },
                          );
               }
            ),
        );
      },
        itemCount: tourismPlaceList.length,
      );
  }
}