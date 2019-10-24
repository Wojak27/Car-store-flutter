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
  _makeOrder() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => OrderScreen()));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Positioned(
                  child: Container(
                    height: 500,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.blue, Colors.grey], stops: [0, 1]),
                    ),
                    child: Hero(
                        tag: widget.car.imageName,
                        child: Stack(
                          children: <Widget>[
                            Center(
                                child: Image(
                                    image: AssetImage(widget.car.imageName)))
                          ],
                        )),
                  ),
                ),
                Positioned(
                    top: 20,
                    left: 10,
                    child: SafeArea(
                        child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ))),
                Positioned(
                  top: 60,
                  right: 50,
                  child: SafeArea(
                    child: Text(
                      widget.car.carName,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
                Positioned(
                  top: 400,
                  left: 20,
                  child: RawMaterialButton(
                    padding: EdgeInsets.all(15),
                    child: Icon(
                      Icons.add_shopping_cart,
                      size: 30,
                      color: Colors.white,
                    ),
                    fillColor: Colors.black,
                    shape: CircleBorder(),
                    elevation: 2.0,
                    onPressed: () => _makeOrder(),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  right: 50,
                  child: SafeArea(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Starting at:",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          widget.car.carPrice,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 10),
              child: Text(
                "Description",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 10),
              child: Text(
                "The BMW 3 Series is a compact executive car manufactured by the German automaker BMW since May 1975. It is the successor to the 02 Series and has been produced in seven different generations. The first generation of the 3 Series was only available as a 2-door sedan (saloon), however the model range has since expanded to include a 4-door sedan, 2-door convertible, 2-door coupé, 5-door station wagon, 5-door hatchback (Gran Turismo) and 3-door hatchback body styles. Since 2013, the coupé and convertible models have been marketed as the 4 Series, therefore the 3 Series range no longer includes these body styles. The 3 Series is BMW's best-selling model, accounting for around 30% of the BMW brand's annual total sales (excluding motorbikes).[1] The BMW 3 Series has won numerous awards throughout its history. The M version of the 3 series, M3, debuted with the E30 M3 in 1986.[2] ",
                style: TextStyle(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 10),
              child: Text(
                "Specs",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 10),
              child: Text(
                "Description",
                style: TextStyle(),
              ),
            ),
            SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}
