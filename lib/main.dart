import 'package:flutter/material.dart';
import "screens/car_detail_screen.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Generic Car Shop'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class CarItemObject {
  String imageName;
  String carName;
  int carYear;
  int carPower;
  String description;

  CarItemObject({
    this.imageName,
    this.carName,
    this.carPower = 100,
    this.carYear = 2019,
    this.description = ""
  });
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int selectedPage = 0;
  TabController _tabController;
  PageController _pageController;
  List<CarItemObject> cars = [
    CarItemObject(
        imageName: "assets/images/bmw_sedan.png", carName: "BMW sedan",
    description: "BMW 8 Series. The BMW 8 Series is a range of grand tourers produced by BMW. The 8 Series was introduced in 1990 under the E31 model code and was only available as a two-door coupé. ... The G15 8 Series introduces an inline-six diesel engine, and a high-performance M8 model is also expected to be launched in the future."),
    CarItemObject(
        imageName: "assets/images/fiat_sedan.png", carName: "Fiat sedan",
        description: "The Fiat Tipo sedan is 4532 mm long, 1497 mm tall and 1792 mm wide with a wheelbase of 2638 mm and a five-seat passenger compartment with a 520-litre trunk. The hatchback has the same wheelbase but the bodywork is 4368 mm long, 1495 mm tall and 1792 mm wide. The trunk has a capacity of 440 litres."),
    CarItemObject(
        imageName: "assets/images/honda_sedan.png", carName: "Honda sedan",
        description: "Honda Civic. ... EPA guidelines for vehicle size class stipulate a car having combined passenger and cargo room of 110 to 119.9 cubic feet (3,110 to 3,400 L) is considered a mid-size car, and as such the tenth generation Civic sedan is technically a small-end mid-size car, although it still competes in the compact class.")
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 7, vsync: this);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  Widget _carSelector(int index) {
    return AnimatedBuilder(
        animation: _pageController,
        builder: (BuildContext context, Widget widget) {
          double value = 1;
          if(_pageController.position.haveDimensions){
            value = _pageController.page - index;
            value = (1-(value.abs()*0.3)).clamp(0.0, 1.0);
          }
          return Center(
            child: SizedBox(
              height: Curves.easeInOut.transform(value)*500,
              width: Curves.easeInOut.transform(value)*400,
              child: widget,
            ),
          );
        },
        child: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>CarDetailScreen(car: cars[selectedPage])));
          },
          child: Stack(
              children: <Widget>[
                Container(
                  height: 400,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(25)
                  ),
                  child: Stack(
                    children: <Widget>[
                      Hero(
                          tag: cars[index].imageName,
                          child: Center(child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage(cars[index].imageName)))
                      ),
                      Positioned(
                        top: 20,
                        right: 20,
                        child: Column(
                          children: <Widget>[
                            Text("starting at", style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),),
                            Text("169.900 kr",
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  right: 10,
                  child: RawMaterialButton(
                    padding: EdgeInsets.all(15),
                    child: Icon(Icons.add_shopping_cart, size: 30, color: Colors.white,),
                    fillColor: Colors.black,
                    shape: CircleBorder(),
                    elevation: 2.0,
                    onPressed: () => print("Add to cart"),
                  ),

                )
              ],
            ),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Icon(Icons.menu, size: 30),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: Icon(
                  Icons.shopping_cart,
                  size: 30,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text(
              "Best cars",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
          ),
          TabBar(
            controller: _tabController,
            indicatorColor: Colors.transparent,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey.withOpacity(0.6),
            labelPadding: EdgeInsets.symmetric(horizontal: 35),
            isScrollable: true,
            tabs: <Widget>[
              Tab(
                child: Text(
                  "Sedan",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  "Hatchback",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  "MPV",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  "SUV",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  "Crossover",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  "Coupe",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  "Convertible",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 450,
            width: double.infinity,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int index) {
                setState(() {
                  this.selectedPage = index;
                });
              },
              itemCount: cars.length,
              itemBuilder: (BuildContext context, int index) {
                return _carSelector(index);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Description:", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(cars[selectedPage].description),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
