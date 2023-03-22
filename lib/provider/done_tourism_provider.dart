import 'package:flutter/foundation.dart';
import 'package:initial_project/model/tourism_place.dart';


class DoneTourismProvider with ChangeNotifier {
  final List<TourismPlace> _doneTourismPlaceList = [];

  List<TourismPlace> get doneTourismProvider => _doneTourismPlaceList;

  void complete(TourismPlace place, bool isDone) {
    isDone 
          ? _doneTourismPlaceList.add(place)
          : _doneTourismPlaceList.remove(place);
    notifyListeners();         
  }
}