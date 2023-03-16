class TourismPlace{
  String name;
  String location;
  List imagePath;

  TourismPlace({
    required this.name,
    required this.location,
    required this.imagePath,
  });
}

var tourismPlaceList = [
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