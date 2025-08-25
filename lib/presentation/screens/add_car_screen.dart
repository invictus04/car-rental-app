import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: const Text(
          'Add Cars',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildField("Model", modelController, context),
            SizedBox(height: screenHeight * 0.02),

            _buildField("Distance", distanceController, context),
            SizedBox(height: screenHeight * 0.02),

            _buildField("Fuel Capacity", fuelController, context),
            SizedBox(height: screenHeight * 0.02),

            _buildField("Price Per Hour", priceController, context),
            SizedBox(height: screenHeight * 0.04),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle Save
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Car Added Successfully!")),
                  );
                },
                child: const Text("Save"),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildField(
      String label, TextEditingController controller, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        SizedBox(
          width: screenWidth * 0.3,
          child: Text(label, style: const TextStyle(fontSize: 16)),
        ),
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: "Enter $label",
              contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            ),
          ),
        ),
      ],
    );
  }
}
