import 'package:car_rental/data/models/car.dart';
import 'package:car_rental/presentation/widgets/card_car.dart';
import 'package:flutter/material.dart';

class CarListScreen extends StatelessWidget {
  CarListScreen({super.key});

  final List<Car> cars = [
    Car(model: 'Fortuner GR',
        distance: 870,
        fuelCapacity: 50,
        pricePerHour: 45),
    Car(model: 'Fortuner GR',
        distance: 870,
        fuelCapacity: 50,
        pricePerHour: 45),
    Car(model: 'Fortuner GR',
        distance: 870,
        fuelCapacity: 50,
        pricePerHour: 45),
    Car(model: 'Fortuner GR',
        distance: 870,
        fuelCapacity: 50,
        pricePerHour: 45),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Your Car', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder:(context, index) {
          return CardCar(car: cars[index]);
      },),
    );
  }
}
