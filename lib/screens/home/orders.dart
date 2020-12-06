import 'package:dejabrew/models/coffeetype.dart';
import 'package:dejabrew/screens/home/thanks.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Orders());
}

class Orders extends StatefulWidget {
  final Coffeetype coffeetype;
  Orders({
    @required this.coffeetype,
  });

  @override
  _OrdersState createState() => _OrdersState(coffeetype: coffeetype);
}

class _OrdersState extends State<Orders> {
  final Coffeetype coffeetype;

  _OrdersState({
    @required this.coffeetype,
  });

  int quantity = 1;
  // int price = coffeetype.price;

  void _incrementCounter() {
    setState(() {
      quantity++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (quantity != 1) quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'My Orders',
            style: TextStyle(
              fontFamily: 'nunito',
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 40.0,
              //fontStyle: FontStyle.italic,
            ),
          ),
          backgroundColor: Colors.pink[800],
        ),
        body: SafeArea(
          child: Container(
            color: Colors.pink[50],
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 10.0),
                  // height: 70.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 12.0, 5.0, 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Text(
                                coffeetype.name,
                                style: TextStyle(
                                  color: Colors.pink[50],
                                  fontSize: 25.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  15.0, 5.0, 15.0, 5.0),
                            ),
                            Container(
                              child: Text(
                                '₹${coffeetype.price}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                        ),
                        Container(
                          child: Text(
                            'Quantity',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                            ),
                          ),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FlatButton(
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  ),
                                color: Colors.black54,
                                onPressed: _decrementCounter),
                            Text(
                              '$quantity',
                              style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.white
                              ),
                              
                            ),
                            FlatButton(
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  ),
                                color: Colors.black54,
                                onPressed: _incrementCounter),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                
                Container(
                  padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 30.0),
                  child: Text(
                    'Total : ₹ ${(coffeetype.price * quantity).toString()}',
                    style: TextStyle(
                      fontFamily: 'varela',
                      //fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 25.0,
                    ),
                  ),
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.pink[800])),
                  onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Thanks()))
                  },
                  color: Colors.white,
                  textColor: Colors.pink[800],
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10.0),
                  child: Text("Place Order".toUpperCase(),
                      style: TextStyle(fontSize: 22)),
                ),
                Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
