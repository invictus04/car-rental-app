import 'package:bloc/bloc.dart';
import 'package:car_rental/presentation/bloc/car_event.dart';
import 'package:car_rental/presentation/bloc/car_state.dart';

import '../../domain/use_case/get_car_use_case.dart';

class CarBloc extends Bloc<CarEvent,CarState> {
  final GetCarsUseCase getCarsUseCase;

  CarBloc({required this.getCarsUseCase}) : super(CarsLoading()){
    on<LoadCars>((event, emit) async{
      emit(CarsLoading());
      try{
        final cars = await getCarsUseCase.call();
        emit(CarsLoaded(cars));
      }catch(e){
        emit(CarError(e.toString()));
      }

    });
  }
}