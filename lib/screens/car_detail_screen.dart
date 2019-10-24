import 'package:flutter/material.dart';
import '../main.dart';
import 'order_screen.dart';
import '../objects/car_item_object.dart';
import 'home_page.dart';

class CarDetailScreen extends StatefulWidget {
  CarItemObject car;

  CarDetailScreen({this.car});

  @override
  CarDetailScreenState createState() => CarDetailScreenState();
}

class CarDetailScreenState extends State<CarDetailScreen> {

  _makeOrder(){
    Navigator.push(context, MaterialPageRoute(builder: (_)=> OrderScreen()));
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[


                Positioned(
                  child: Container(
                    height: 500,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [Colors.blue,Colors.grey], stops: [0,1]),
                    ),
                    child: Hero(
                        tag: widget.car.imageName,
                        child: Stack(children: <Widget>[
                          Center(child: Image(image: AssetImage(widget.car.imageName)))
                        ],)),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 10,
                  child: SafeArea(child: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
                    Navigator.pop(context);
                  }, ))
                ),
                Positioned(top: 30, left: width/2-20,
                  child: SafeArea(child: Text("Hello"),),),
                Positioned(top: 400,left: 20,child: RawMaterialButton(
                  padding: EdgeInsets.all(15),
                  child: Icon(Icons.add_shopping_cart, size: 30, color: Colors.white,),
                  fillColor: Colors.black,
                  shape: CircleBorder(),
                  elevation: 2.0,
                  onPressed: () => _makeOrder(),
                ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
