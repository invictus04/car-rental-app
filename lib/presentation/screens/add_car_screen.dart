import 'package:car_rental/presentation/bloc/car_bloc.dart';
import 'package:car_rental/presentation/bloc/car_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/car.dart';
import '../bloc/car_event.dart';

class AddCarScreen extends StatelessWidget {
  AddCarScreen({super.key});

  final modelController = TextEditingController();
  final distanceController = TextEditingController();
  final fuelController = TextEditingController();
  final priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff1F1F1F), Color(0xffF2F3F3)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: BlocListener<CarBloc, CarState>(
            listener: (context, state) {
              if (state is CarAdded ) {
                modelController.clear();
                distanceController.clear();
                fuelController.clear();
                priceController.clear();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text("✅ Car Added Successfully!")),
                );
              } else if (state is CarError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text("❌ Something went wrong")),
                );
              }
            },
            child: SingleChildScrollView(
              padding: EdgeInsets.all(screenWidth * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "🚗 Add New Car",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),

                  _buildField("Model", modelController, Icons.directions_car),
                  SizedBox(height: screenHeight * 0.02),

                  _buildField(
                      "Distance (km)", distanceController, Icons.speed),
                  SizedBox(height: screenHeight * 0.02),

                  _buildField("Fuel Capacity (L)", fuelController,
                      Icons.local_gas_station),
                  SizedBox(height: screenHeight * 0.02),

                  _buildField("Price Per Hour", priceController,
                      Icons.attach_money),
                  SizedBox(height: screenHeight * 0.04),

                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ).merge(
                        ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.transparent,
                          ),
                          elevation: MaterialStateProperty.all(0),
                          overlayColor: MaterialStateProperty.all(
                            Colors.white.withOpacity(0.1),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (modelController.text.trim().isEmpty ||
                            distanceController.text.trim().isEmpty ||
                            fuelController.text.trim().isEmpty ||
                            priceController.text.trim().isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("⚠️ Please fill in all fields before saving."),
                            ),
                          );
                          return;
                        }
                        final car = Car(
                          model: modelController.text,
                          distance: double.tryParse(
                              distanceController.text.trim()) ??
                              0,
                          fuelCapacity: double.tryParse(
                              fuelController.text.trim()) ??
                              0,
                          pricePerHour: double.tryParse(
                              priceController.text.trim()) ??
                              0,
                        );

                        context.read<CarBloc>().add(AddCar(car));
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                          width: 250,
                          height: 50,
                          alignment: Alignment.center,
                          child: const Text(
                            "Save Car",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField(
      String label, TextEditingController controller, IconData icon) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: TextField(
          controller: controller,
          style: const TextStyle(fontSize: 16),
          decoration: InputDecoration(
            labelText: label,
            prefixIcon: Icon(icon, color: Colors.black),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }


}
