import 'package:flutter/material.dart';
import '../objects/car_item_object.dart';
import 'car_detail_screen.dart';
import 'order_screen.dart';
import 'login_screen.dart';
import 'package:flutter/cupertino.dart';
import '../constants/page_routs.dart';
import 'calendar_screen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int selectedPage = 0;
  TabController _tabController;
  PageController _pageController;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isSearching = false;

  List<CarItemObject> cars = [
    CarItemObject(
        imageName: "assets/images/bmw_sedan.png",
        carName: "BMW sedan",
        description:
            "BMW 8 Series. The BMW 8 Series is a range of grand tourers produced by BMW. The 8 Series was introduced in 1990 under the E31 model code and was only available as a two-door coupé. ... The G15 8 Series introduces an inline-six diesel engine, and a high-performance M8 model is also expected to be launched in the future.",
        backgroudColor: Colors.black),
    CarItemObject(
        imageName: "assets/images/fiat_sedan.png",
        carName: "Fiat sedan",
        description:
            "The Fiat Tipo sedan is 4532 mm long, 1497 mm tall and 1792 mm wide with a wheelbase of 2638 mm and a five-seat passenger compartment with a 520-litre trunk. The hatchback has the same wheelbase but the bodywork is 4368 mm long, 1495 mm tall and 1792 mm wide. The trunk has a capacity of 440 litres.",
        backgroudColor: Colors.red),
    CarItemObject(
        imageName: "assets/images/honda_sedan.png",
        carName: "Honda sedan",
        description:
            "Honda Civic. ... EPA guidelines for vehicle size class stipulate a car having combined passenger and cargo room of 110 to 119.9 cubic feet (3,110 to 3,400 L) is considered a mid-size car, and as such the tenth generation Civic sedan is technically a small-end mid-size car, although it still competes in the compact class.",
        backgroudColor: Colors.purple)
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 7, vsync: this);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  _makeOrder() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => OrderScreen()));
  }

  _logOut() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => LoginScreen()));
  }

  _searchPressed() {
    isSearching = !isSearching;
    setState(() {});
  }

  Widget _carSelector(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 500,
            width: Curves.easeInOut.transform(value) * 400,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              FadeRoute(page: CarDetailScreen(car: cars[selectedPage])));
        },
        child: Stack(
          children: <Widget>[
            Container(
              height: 400,
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.blue, Colors.grey], stops: [0, 1]),
                  borderRadius: BorderRadius.circular(25)),
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Hero(
                      tag: cars[index].imageName,
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage(cars[index].imageName),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 20,
                    child: Column(
                      children: <Widget>[
                        Text(
                          "starting at",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Text(cars[index].carPrice,
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Column(
                      children: <Widget>[
                        Text(cars[index].carName,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
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
            )
          ],
        ),
      ),
    );
  }

  _mainWidgetSwitcher(bool isSearching) {
    return !isSearching
        ? Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Hero(
                    tag: "drawer_button",
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: IconButton(
                          icon: Icon(Icons.menu, size: 30),
                          onPressed: () =>
                              _scaffoldKey.currentState.openDrawer()),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(right: 25.0),
                      child: IconButton(
                          icon: Icon(
                            Icons.search,
                            size: 30,
                          ),
                          onPressed: () => _searchPressed()))
                ],
              ),
              Container(
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Hatchback",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "MPV",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "SUV",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Crossover",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Coupe",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Convertible",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                child: Text("Description:",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(cars[selectedPage].description),
              )
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        onSubmitted: (String text) {
                          if (text.length == 0) {
                            _searchPressed();
                          }
                        },
                        autofocus: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Look for cars'),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(right: 25.0),
                      child: IconButton(
                          icon: Icon(
                            Icons.search,
                            size: 30,
                          ),
                          onPressed: () => _searchPressed())),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              CarDetailScreen(car: cars[selectedPage])));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 20),
                  child: Container(
                      width: double.infinity, child: Text("Sugestion 1")),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              CarDetailScreen(car: cars[selectedPage])));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 20),
                  child: Container(
                      width: double.infinity, child: Text("Sugestion 2")),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              CarDetailScreen(car: cars[selectedPage])));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 20),
                  child: Container(
                      width: double.infinity, child: Text("Sugestion 3")),
                ),
              ),
            ],
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Container(
          width: double.infinity,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      child: _mainWidgetSwitcher(isSearching))
                ],
              ),
            ),
          ),
        ), // This
        drawer: Drawer(
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.lightBlue, Colors.orange],
                    stops: [0, 1],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            child: SafeArea(
                child: Stack(
              children: <Widget>[
                Hero(
                  tag: "drawer_button",
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: IconButton(
                        icon: Icon(Icons.arrow_back, size: 30),
                        onPressed: () => Navigator.of(context).pop()),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                        child: Container(
                      width: double.infinity,
                      height: 150,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            bottom: 50,
                            child: Container(
                              color: Colors.greenAccent,
                              width: 400,
                              height: 150,
                            ),
                          ),
                          Center(
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      'https://adayinthelifeimages.com/wp-content/uploads/2016/05/brisbane-headshots-commercial-photography-09.jpg',
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    )),
                    Center(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Adam Sandler"),
                            Text("I am happy")
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          _switchToCalendar();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Center(
                                child: Text("My calendar",
                                    style: TextStyle(color: Colors.grey))),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () => _logOut(),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Center(
                                child: Text("My offering",
                                    style: TextStyle(color: Colors.grey))),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => _logOut(),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.lightBlue),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Center(
                              child: Text("View profile",
                                  style: TextStyle(color: Colors.grey))),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => _logOut(),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.cyanAccent),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Center(
                              child: Text("Logout",
                                  style: TextStyle(color: Colors.grey))),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )),
          ),
        ) // trailing comma makes auto-formatting nicer for build methods.
        );
  }
  _switchToCalendar(){
    Navigator.of(context).push(
      FadeRoute(
        page: CalendarScreen(),
      ),
    );
  }
}
