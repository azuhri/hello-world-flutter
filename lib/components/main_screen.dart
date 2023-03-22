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
        'assets/images/kebunbinatan_3.jpeg',
        'assets/images/kebunbinatan_2.jpeg',
        'assets/images/kebunbinatan_4.jpeg',
        'assets/images/kebunbinatan_1.jpeg',
      ],
   ),
   TourismPlace(
      name: 'House of Sampoerna',
      location: 'Jl. Setail No.1, Darmo, Kec. Wonokromo, Kota SBY, Jawa Timur 60241',
      desc: 'aman Sampoerna No.6, Krembangan Utara, Kec. Pabean Cantikan, Kota SBY, Jawa Timur 60163',
      day: 'Senin - Sabtu',
      time: '08:00 - 17:00',
      price: 'Rp 15.000',
      imagePath: [
        'assets/images/house_3.jpeg',
        'assets/images/house_2.jpeg',
        'assets/images/house_4.jpeg',
        'assets/images/house_1.jpeg',
      ],
   ),
   TourismPlace(
      name: 'Kelenteng Sanggar Agung',
      location: 'Jl. Sukolilo No.100, Sukolilo Baru, Kec. Bulak, Kota SBY, Jawa Timur 60122',
      desc: 'Kelenteng Sanggar Agung atau Klenteng Hong San Tang adalah sebuah klenteng di Kota Surabaya. Alamatnya berada di Jalan Sukolilo Nomor 100, Pantai Ria Kenjeran, Surabaya. Kuil ini, selain menjadi tempat ibadah bagi pemeluk Tridharma, juga menjadi tempat tujuan wisata bagi para wisatawan.',
      day: 'Setiap Hari',
      time: '08:00 - 17:00',
      price: 'Rp 10.000',
      imagePath: [
        'assets/images/klenteng_3.jpeg',
        'assets/images/klenteng_2.jpeg',
        'assets/images/klenteng_4.jpeg',
        'assets/images/klenteng_1.png',
      ],
   ),
   TourismPlace(
      name: 'Surabaya Museum (Gedung Siola)',
      location: 'Jl. Tunjungan No.1, Genteng, Kec. Genteng, Kota SBY, Jawa Timur 60275',
      desc: 'Gedung pemerintahan & museum dengan artefak yang mempertontonkan sejarah domestik & sipil.',
      day: 'Setiap Hari',
      time: '08:00 - 17:00',
      price: 'Rp 10.000',
      imagePath: [
        'assets/images/museum_3.jpeg',
        'assets/images/museum_2.jpeg',
        'assets/images/museum_4.jpeg',
        'assets/images/museum_1.jpeg',
      ],
   ),
   TourismPlace(
      name: 'Masjid Muhammad Cheng Hoo',
      location: 'Jl. Tunjungan No.1, Genteng, Kec. Genteng, Kota SBY, Jawa Timur 60275',
      desc: 'Masjid Raya Cheng Ho Surabaya adalah sebuah Masjid bernuansa Muslim Tionghoa yang berlokasi di Jalan Gading, Ketabang, Kec. Genteng, Surabaya atau 1.000 m utara Gedung Balai Kota Surabaya.',
      day: 'Setiap Hari',
      time: '08:00 - 21:00',
      price: 'Gratis',
      imagePath: [
        'assets/images/masjid_3.jpeg',
        'assets/images/masjid_2.png',
        'assets/images/masjid_4.jpeg',
        'assets/images/masjid_1.jpeg',
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