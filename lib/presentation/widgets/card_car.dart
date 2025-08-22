import 'package:car_rental/data/models/car.dart';
import 'package:car_rental/presentation/screens/car_detail_screen.dart';
import 'package:flutter/material.dart';

class CardCar extends StatelessWidget {
  final Car car;

  const CardCar({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CarDetailScreen(car:car),));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color(0xffF3F3F3),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 5
            )
          ]
        ),
        child: Column(
          children: [
            Image.asset('assets/car_image.png', height: 120),
            SizedBox(height: 10),
            Text(
              car.model,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/gps.png'),
                        SizedBox(width: 5,),
                        Text('${car.distance.toStringAsFixed(0)}km')
                      ],
                    ),
                    SizedBox(width: 10,),
                    Row(
                      children: [
                        Image.asset('assets/pump.png'),
                        SizedBox(width: 5,),
                        Text('${car.fuelCapacity.toStringAsFixed(0)}L')
                      ],
                    ),
                  ],
                ),
                Text('\$ ${car.pricePerHour.toStringAsFixed(2)}/h', style: TextStyle(fontSize: 16),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
