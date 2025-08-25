import 'package:car_rental/data/models/car.dart';
import 'package:car_rental/domain/repositories/car_repository.dart';

import '../data_source/firebase_car_data_source.dart';

class CarRepositoryImpl implements CarRepository {
  final FirebaseCarDataSource firebaseCarDataSource;

  CarRepositoryImpl(this.firebaseCarDataSource);

  @override
  Future<List<Car>> fetchCars() {
    return firebaseCarDataSource.getCars();
  }

}