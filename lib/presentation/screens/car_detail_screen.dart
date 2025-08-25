import 'package:car_rental/presentation/widgets/card_car.dart';
import 'package:car_rental/presentation/widgets/more_card.dart';
import 'package:flutter/material.dart';

import '../../data/models/car.dart';
import 'maps_detail_screen.dart';

class CarDetailScreen extends StatefulWidget {
  final Car car;
  const CarDetailScreen({super.key, required this.car});

  @override
  State<CarDetailScreen> createState() => _CarDetailScreenState();
}

class _CarDetailScreenState extends State<CarDetailScreen> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 2))..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.9, end: 1.1).animate( CurvedAnimation(parent: _animationController!, curve: Curves.easeInOut),)
    ..addListener((){setState(() {

    });});
    _animationController!.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController!.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.info), Text('Information')],
        ),
      ),
      body: Column(
        children: [
          CardCar(
            car: Car(
              model: widget.car.model,
              distance: widget.car.distance,
              fuelCapacity: widget.car.fuelCapacity,
              pricePerHour: widget.car.pricePerHour,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xffF3F3F3),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('assets/user.png'),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Raj vardhan Singh',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('\$4,256', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: GestureDetector(
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MapsDetailScreen(car:widget.car),));
                    },
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Transform.scale(
                          scale: _animation!.value,
                          alignment: Alignment.center,
                          child: Image.asset('assets/maps.png', fit: BoxFit.cover,),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                MoreCard(
                  car: Car(
                    model: widget.car.model + "-1",
                    distance: widget.car.distance+100,
                    fuelCapacity: widget.car.fuelCapacity+100,
                    pricePerHour: widget.car.pricePerHour+10,
                  ),
                ),
                SizedBox(height: 8,),
                MoreCard(
                  car: Car(
                    model: widget.car.model + "-2",
                    distance: widget.car.distance+200,
                    fuelCapacity: widget.car.fuelCapacity+200,
                    pricePerHour: widget.car.pricePerHour+20,
                  ),
                ),
                SizedBox(height: 8,),
                MoreCard(
                  car: Car(
                    model: widget.car.model + "-3",
                    distance: widget.car.distance+300,
                    fuelCapacity: widget.car.fuelCapacity+300,
                    pricePerHour: widget.car.pricePerHour+30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
