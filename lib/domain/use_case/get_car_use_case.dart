import 'package:car_rental/data/models/car.dart';
import 'package:car_rental/domain/repositories/car_repository.dart';

class GetCarsUseCase{
    final CarRepository carRepository;
    GetCarsUseCase(this.carRepository);

    Future<List<Car>> call() async{
      return await carRepository.fetchCars();
    }
}