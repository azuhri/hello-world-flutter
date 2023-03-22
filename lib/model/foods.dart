class Food{
  String name;
  String location;
  String desc;
  String likes;
  String price;
  List imagePath;

  Food({
    required this.name,
    required this.location,
    required this.likes,
    required this.price,
    required this.desc,
    required this.imagePath,
  });
}

var foods = [
  Food(
      price: "12.000",
      likes: "10",
      name: 'Rendang',
      desc : 'Rendang adalah masakan daging yang berasal dari Minangkabau Sumatra Barat Indonesia. Proses memasak rendang dengan suhu rendah dalam waktu lama, menggunakan santan dan aneka rempah-rempah khas indonesia yang sedikit pedas sehingga menambah ke khas an dan kelezatannya.',
      location: 'Sumatera Barat',
      imagePath: [
        'assets/images/rendang_1.jpeg',
        'assets/images/rendang_2.jpeg',
        'assets/images/rendang_3.jpeg',
        'assets/images/rendang_4.jpeg',
      ],
   ),
  Food(
    price: "25.000",
    likes: "150",
    name: 'Soto Betawi',
    desc : 'Soto Betawi merupakan soto yang khas dari daerah DKI Jakarta. Seperti halnya Soto Madura dan Soto Sulung, soto Betawi juga menggunakan jeroan. Selain jeroan, sering kali organ-organ lain juga disertakan, seperti mata, terpedo, dan juga hati. Daging sapi juga menjadi bahan campuran dalam soto Betawi.',
    location: 'Jakarta (Betawi)',
    imagePath: [
      'assets/images/soto_betawi_1.jpeg',
      'assets/images/soto_betawi_2.jpeg',
      'assets/images/soto_betawi_3.jpeg',
      'assets/images/soto_betawi_4.png',
    ],
  ),
  Food(
    price: "15.000",
    likes: "71",
    name: 'Gudeg',
    desc : 'Soto Betawi merupakan soto yang khas dari daerah DKI Jakarta. Seperti halnya Soto Madura dan Soto Sulung, soto Betawi juga menggunakan jeroan. Selain jeroan, sering kali organ-organ lain juga disertakan, seperti mata, terpedo, dan juga hati. Daging sapi juga menjadi bahan campuran dalam soto Betawi.',
    location: 'Jogjakarta',
    imagePath: [
      'assets/images/gudeg_1.jpeg',
      'assets/images/gudeg_2.jpeg',
      'assets/images/gudeg_3.jpeg',
      'assets/images/gudeg_4.jpeg',
    ],
  ),
  Food(
    price: "20.000",
    likes: "819",
    name: 'Kerak Telor',
    desc : 'Soto Betawi merupakan soto yang khas dari daerah DKI Jakarta. Seperti halnya Soto Madura dan Soto Sulung, soto Betawi juga menggunakan jeroan. Selain jeroan, sering kali organ-organ lain juga disertakan, seperti mata, terpedo, dan juga hati. Daging sapi juga menjadi bahan campuran dalam soto Betawi.',
    location: 'Jakarta Betawi',
    imagePath: [
      'assets/images/kerak_telor_1.png',
      'assets/images/kerak_telor_2.jpeg',
      'assets/images/kerak_telor_3.jpeg',
      'assets/images/kerak_telor_4.jpeg',
    ],
  ),
  Food(
    price: "18.000",
    likes: "10",
    name: 'Sate Padang',
    desc : 'Sate Padang memakai bahan daging sapi, lidah, biji atau jeroan (jantung, usus, dan tetelan)[1] dengan bumbu kuah kacang kental yang ditambah dengan cabai yang banyak sehingga rasanya pedas.',
    location: 'Sumatera Barat',
    imagePath: [
      'assets/images/sate_padang_1.jpeg',
      'assets/images/sate_padang_2.jpeg',
      'assets/images/sate_padang_3.jpeg',
      'assets/images/sate_padang_4.jpeg',
    ],
  ),
  Food(
    price: "35.000",
    likes: "10",
    name: 'Martabak Bangka',
    desc : 'Martabak manis merupakan makanan khas Bangka Belitung. Nama asli martabak manis adalah Hok Lo Pan. Makanan ini diciptakan oleh orang-orang Hakka Bangka. Hok Lo Pan ini sendiri berarti kue orang Hok Lo. Itulah kenapa martabak manis juga sering dikenal dengan sebutan martabak Bangka',
    location: 'Bangka',
    imagePath: [
      'assets/images/martabak_bangka_2.jpeg',
      'assets/images/martabak_bangka_4.jpeg',
      'assets/images/martabak_bangka_2.jpeg',
      'assets/images/martabak_bangka_4.jpeg',
    ],
  ),
  
];