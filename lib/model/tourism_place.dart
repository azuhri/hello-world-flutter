class TourismPlace{
  String name;
  String location;
  List imagePath;
  String day;
  String time;
  String price;
  String desc;

  TourismPlace({
    required this.name,
    required this.location,
    required this.imagePath,
    required this.day,
    required this.time,
    required this.price,
    required this.desc,
  });
}

var tourismPlaceList = [
  TourismPlace(
      name: 'Surabaya Submarine Monument',
      location: 'Jl Pemuda Raya',
      desc: 'Surabaya submarine monument',
      day: 'Setiap Hari',
      time: '08:00 - 16:30',
      price: 'Rp 5.000',
      imagePath: [
        'assets/images/image_1.png',
        'assets/images/image_1.png',
        'assets/images/image_1.png',
        'assets/images/image_1.png',
      ],
   ),
];