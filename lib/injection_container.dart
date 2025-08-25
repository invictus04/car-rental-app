import 'package:car_rental/presentation/bloc/car_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

import 'data/data_source/firebase_car_data_source.dart';
import 'data/repo/car_repository_impl.dart';
import 'domain/repositories/car_repository.dart';
import 'domain/use_case/get_car_use_case.dart';

GetIt getIt = GetIt.instance;

void initInjection(){
  try {
    getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
    getIt.registerLazySingleton<FirebaseCarDataSource>(() => FirebaseCarDataSource(firestore: getIt<FirebaseFirestore>()));
    getIt.registerLazySingleton<CarRepository>(() => CarRepositoryImpl(getIt<FirebaseCarDataSource>()));
    getIt.registerLazySingleton<GetCarsUseCase>(() => GetCarsUseCase(getIt<CarRepository>()));
    getIt.registerFactory(()=> CarBloc(getCarsUseCase: getIt<GetCarsUseCase>()));
  } catch (e) {
    // TODO
  }

}