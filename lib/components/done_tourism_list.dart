import 'package:flutter/material.dart';
import 'package:initial_project/model/tourism_place.dart';

class DoneTourismList extends StatelessWidget {
  final List<TourismPlace> doneTourismPlaceList;
  const DoneTourismList({
    Key? key,
    required this.doneTourismPlaceList
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wisata Telah Dikunjungi'),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        final TourismPlace place = doneTourismPlaceList[index];
        return Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Image.asset(place.imagePath[0]),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      place.name,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      place.location,
                      style: TextStyle(
                         fontSize: 10.0,
                         fontFamily: 'poppins',
                      ),
                    ),
                  ],
                ),
              )
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

