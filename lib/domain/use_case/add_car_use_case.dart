import 'package:car_rental/domain/repositories/car_repository.dart';

import '../../data/models/car.dart';

class AddCarUseCase {
  final CarRepository repository;
  AddCarUseCase(this.repository);

  Future<bool> call(Car car) async{
    return await repository.addCars(car);
  }

}