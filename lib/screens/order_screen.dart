import 'package:flutter/material.dart';

//import 'package:stripe_payment/stripe_payment.dart';
import '../objects/car_item_object.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../constants/page_routs.dart';

class OrderScreen extends StatefulWidget {
  dynamic car;

  OrderScreen({this.car = "1"});

  @override
  State<StatefulWidget> createState() => OrderScreenState();
}

class OrderScreenState extends State<OrderScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  int currentPage = 0;
  final _pageViewController = PageController(initialPage: 0);
  bool hasOrder = false;
  Widget loadingWidget = SizedBox(
    height: 1,
  );
  bool _rememberMeCheckboxValue = false;

  _isLoading() {}

  _placeOrder() {
    if (hasOrder) {
      loadingWidget = LoadingIndicator(
        indicatorType: Indicator.ballPulse,
        color: Colors.white,
      );
    } else {
      loadingWidget = SizedBox(
        height: 1,
      );
    }
    hasOrder = !hasOrder;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            //gradient: LinearGradient(colors: [Colors.blue, Colors.grey], stops: [0, 1]),
            color: Color.fromRGBO(220, 225, 231, 1)),
        height: double.infinity,
        width: double.infinity,
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 15,
                child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Color.fromRGBO(124, 131, 142, 1),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();

                      print("Pop");
                    }),
              ),
              PageView.builder(
                  onPageChanged: (page) {
                    currentPage = page;
                    setState(() {});
                  },
                  controller: _pageViewController,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int page) {
                    currentPage = page;
                    print("page: $page");
                    if (page == 0) {
                      return Center(
                        child: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: PageView(
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Making order",
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(124, 131, 142, 1),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 19),
                                    ),
                                    Form(
                                      key: _formKey,
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 30.0, vertical: 10),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                  labelText: "Name",
                                                  labelStyle: TextStyle(
                                                      color: Colors.grey)),
                                              validator: (input) => input
                                                      .isEmpty
                                                  ? "Please enter a valid email"
                                                  : null,
                                              onSaved: (input) => print(input),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 30.0, vertical: 10),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                  labelText: "Delivery address",
                                                  labelStyle: TextStyle(
                                                      color: Colors.grey)),
                                              validator: (input) => input
                                                      .isEmpty
                                                  ? "Please enter a valid email"
                                                  : null,
                                              onSaved: (input) => print(input),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 30.0, vertical: 10),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                  labelText: "Town",
                                                  labelStyle: TextStyle(
                                                      color: Colors.grey)),
                                              validator: (input) => input
                                                      .isEmpty
                                                  ? "Please enter a valid email"
                                                  : null,
                                              onSaved: (input) => print(input),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 30.0, vertical: 10),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                  labelText: "Area code",
                                                  labelStyle: TextStyle(
                                                      color: Colors.grey)),
                                              validator: (input) => input
                                                      .isEmpty
                                                  ? "Please enter a valid email"
                                                  : null,
                                              onSaved: (input) => print(input),
                                            ),
                                          ),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 30.0,
                                                      vertical: 10),
                                              child: Row(
                                                children: <Widget>[
                                                  Checkbox(
                                                      value:
                                                          _rememberMeCheckboxValue,
                                                      onChanged: (value) {
                                                        _rememberMeCheckboxValue =
                                                            value;
                                                        setState(() {});
                                                      }),
                                                  Text("Remember me")
                                                ],
                                              )),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30.0, vertical: 10),
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "0000-0000-0000-0000",
                                              labelStyle: TextStyle(
                                                  color: Colors.grey)),
                                          validator: (input) => input.isEmpty
                                              ? "Please enter a valid email"
                                              : null,
                                          onSaved: (input) => print(input),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30.0, vertical: 10),
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Name on the Card",
                                              labelStyle: TextStyle(
                                                  color: Colors.grey)),
                                          validator: (input) => input.isEmpty
                                              ? "Please enter a valid email"
                                              : null,
                                          onSaved: (input) => print(input),
                                        ),
                                      ),
                                    ),
                                    AnimatedSwitcher(
                                      duration: Duration(milliseconds: 600),
                                      child: ConstrainedBox(
                                        constraints: BoxConstraints(
                                            maxHeight: 40, maxWidth: 70),
                                        child: loadingWidget,
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.all(15),
                                        child: Column(
                                          children: <Widget>[
                                            InkWell(
                                              onTap: () => _placeOrder(),
                                              child: Container(
                                                margin: EdgeInsets.all(10),
                                                height: 50,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        109, 130, 159, 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25)),
                                                child: Center(
                                                    child: Text(
                                                  "Place order",
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        197, 206, 205, 1),
                                                  ),
                                                )),
                                              ),
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                              ],
                            )),
                      );
                    } else if (page == 1) {
                      return Text("Hello1");
                    } else {
                      return Text("Hello2");
                    }
                  }),
              Positioned(
                top: 50,
                left: 10,
                right: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      decoration: BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                      height: currentPage == 0 ? 20 : 5,
                      width: 20,
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      decoration: BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                      height: currentPage == 1 ? 20 : 5,
                      width: 20,
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      decoration: BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                      height: currentPage == 2 ? 20 : 5,
                      width: 20,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
