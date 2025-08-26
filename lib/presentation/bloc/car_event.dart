import 'package:car_rental/data/models/car.dart';

abstract class CarEvent{}

class LoadCars extends CarEvent{}

class AddCar extends CarEvent{
  final Car car;
  AddCar(this.car);
}