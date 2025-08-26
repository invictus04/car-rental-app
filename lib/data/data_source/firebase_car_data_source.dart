import 'dart:developer';

import 'package:car_rental/data/models/car.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCarDataSource{
  final FirebaseFirestore firestore;
  FirebaseCarDataSource({required this.firestore});

  Future<List<Car>> getCars() async{
    var snapShot = await firestore.collection('cars').get();
    return snapShot.docs.map((doc) => Car.fromMap(doc.data())).toList();
  }

  Future<bool> addCars(Car car) async {
    try {
      await firestore.collection('cars').add(car.toMap());
      return true;
    } catch(e){
      log('Something went wrong $e');
      return false;
    }
  }
}