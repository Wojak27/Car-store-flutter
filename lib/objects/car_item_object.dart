import 'package:flutter/material.dart';

class CarItemObject {
  String imageName;
  String carName;
  int carYear;
  int carPower;
  String description;
  Color backgroudColor;

  CarItemObject({
    this.imageName,
    this.carName,
    this.carPower = 100,
    this.carYear = 2019,
    this.description = "",
    this.backgroudColor = Colors.green
  });
}