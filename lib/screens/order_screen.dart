import 'package:flutter/material.dart';
//import 'package:stripe_payment/stripe_payment.dart';

class OrderScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => OrderScreenState();
}

class OrderScreenState extends State<OrderScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.green, Colors.grey], stops: [0, 1]),
        ),
        height: double.infinity,
        width: double.infinity,
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 25,
                child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ),
              Center(
                  child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Making order",
                      style: TextStyle(color: Colors.white),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(10),
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Center(child:Text("Hello",style: TextStyle(color: Colors.white),)),
                          )
                        ],
                      )
                    )
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
