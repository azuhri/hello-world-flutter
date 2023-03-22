import 'package:flutter/material.dart';
import 'package:initial_project/model/tourism_place.dart';
import 'package:initial_project/provider/done_tourism_provider.dart';
import 'package:provider/provider.dart';

class DoneTourismList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final List<TourismPlace> doneTourismPlaceList =
      Provider.of<DoneTourismProvider>(
      context,
      listen: false,
    ).doneTourismPlaceList;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wisata Telah Dikunjungi'),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        final place = doneTourismPlaceList[index];
        return Card(
          color: Colors.white60,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                place.name,
                style: const TextStyle(fontSize: 16.0),
              ),
              const Icon(Icons.done_outline),
            ],
          ),
        );
       },
       itemCount: doneTourismPlaceList.length,
      ),
    );
  }
}