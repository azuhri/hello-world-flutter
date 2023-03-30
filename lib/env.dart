class EnvirontmentVariable {
  // deklarasi variabel global
  static String endpoint = 'https://8fee-103-24-58-33.ap.ngrok.io';

  // private constructor
  EnvirontmentVariable._privateConstructor();

  // instance dari singleton class
  static final EnvirontmentVariable _instance = EnvirontmentVariable._privateConstructor();

  // factory method untuk mengembalikan instance dari singleton class
  factory EnvirontmentVariable() {
    return _instance;
  }
}
