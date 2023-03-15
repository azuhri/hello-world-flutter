import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
        body: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Image.asset('assets/images/image_4.jpg'),
                  Container(
                    margin: EdgeInsets.only(top: 16.0),
                    child: Text(
                      "Surabaya Submarine Monument",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25.0, bottom: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(Icons.calendar_today, size: 25.0,),
                            Text('Open everyday', style: TextStyle(
                                fontSize: 10.0
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(Icons.access_time_outlined, size: 25.0),
                            Text('08:00 - 16:00', style: TextStyle(
                                fontSize: 10.0
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(Icons.attach_money, size: 25.0),
                            Text('Rp 10.000', style: TextStyle(
                                fontSize: 10.0
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0, bottom: 16.0),
                    child: Text(
                      "Museum inside a decommissioned Russian war submarine with tours & an adjacent park with cafes. Clean and well maintained. Car parka cost 10k, entrance fee 15k/person. You can see KRI Pasopati there, it is a russian whiskey class. You can also watch the video about the Indonesian Navy at the building beside the submarine",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  Container(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.network(
                              'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg'
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.asset(
                              'assets/images/image_1.png'
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.asset(
                                'assets/images/image_2.jpeg'
                            ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.asset(
                                'assets/images/image_3.jpeg'
                            ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.asset(
                                'assets/images/image_4.jpg'
                            ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.asset(
                                'assets/images/image_5.jpeg'
                            ),
                        ),
                      ],
                    )
                  )
                ]
            )
        )
    );
  }
}