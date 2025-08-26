import 'package:car_rental/data/models/car.dart';

abstract class CarRepository {
  Future<List<Car>> fetchCars();
  Future<bool> addCars(Car car);
}