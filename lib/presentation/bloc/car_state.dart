import '../../data/models/car.dart';

abstract class CarState{}

class CarsLoading extends CarState{}

class CarsLoaded extends CarState{
  final List<Car> cars;
  CarsLoaded(this.cars);
}

class CarError extends CarState{
  final String error;
  CarError(this.error);
}