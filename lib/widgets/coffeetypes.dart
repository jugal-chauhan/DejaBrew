import 'package:dejabrew/helpers/screen_navigation.dart';
import 'package:flutter/material.dart';
import 'package:dejabrew/screens/home/details_page.dart';
import 'package:dejabrew/models/coffeetype.dart';

const Color gld = const Color(0xFFd8a349);

List<Coffeetype> coffeetypesList = [
  Coffeetype(
      coffeedef:
          "Our dark, rich espresso balanced with steamed milk and a light layer of foam",
      name: "Coffee Misto",
      price: 149,
      brandName: "Coffeeshop",
      isFavorite: false),
  Coffeetype(
      coffeedef:
          "Rich, full-bodied espresso with bittersweet milk sauce and steamed milk",
      name: "Caffe Latte",
      price: 179,
      brandName: "Brownshop",
      isFavorite: false),
  Coffeetype(
      coffeedef: "A coffee drink consisting of espresso and a milk foam mixture",
      name: "Cappicino",
      price: 190,
      brandName: "Coffeeshop",
      isFavorite: false),
  Coffeetype(
      coffeedef: "The espresso is added into the hot water rather than all the water.",
      name: "Expresso",
      price: 130,
      brandName: "Coffeeshop",
      isFavorite: false),
];

class Coffeetypes extends StatefulWidget {
  @override
  _CoffeetypesState createState() => _CoffeetypesState();
}

class _CoffeetypesState extends State<Coffeetypes> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 410.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: coffeetypesList.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Container(
                height: 300.0,
                width: 225.0,
                child: Column(
                  children: <Widget>[
                    Stack(children: [
                      Container(height: 335.0),
                      Positioned(
                        top: 75.0,
                        child: Container(
                          padding: EdgeInsets.only(left: 10.0, right: 20.0),
                          height: 260.0,
                          width: 225.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              color: Color(0xFF00704A)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 60.0),
                                Text(
                                  coffeetypesList[index].brandName + '\'s',
                                  style: TextStyle(
                                      fontFamily: 'nunito',
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  coffeetypesList[index].name,
                                  style: TextStyle(
                                      fontFamily: 'varela',
                                      fontSize: 32.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  coffeetypesList[index].coffeedef,
                                  style: TextStyle(
                                      fontFamily: 'nunito',
                                      fontSize: 14.0,
                                      // fontWeight: FontWeight.w300,
                                      color: Colors.white),
                                ),
                                SizedBox(height: 10.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      '₹${coffeetypesList[index].price}',
                                      style: TextStyle(
                                          fontFamily: 'varela',
                                          fontSize: 25.0,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFd8a349)),
                                    ),
                                    Container(
                                      height: 40.0,
                                      width: 40.0,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          color: Colors.white),
                                      child: Center(
                                        child: IconButton(
                                            icon: Icon(Icons.favorite),
                                            onPressed: () {
                                              this.setState(() {
                                                coffeetypesList[index]
                                                        .isFavorite =
                                                    !coffeetypesList[index]
                                                        .isFavorite;
                                              });
                                            },
                                            color: coffeetypesList[index]
                                                    .isFavorite
                                                ? Colors.red
                                                : Colors.grey,
                                            iconSize: 15.0),
                                      ),
                                    )
                                  ],
                                )
                              ]),
                        ),
                      ),
                      Positioned(
                        left: 60.0,
                        top: 25.0,
                        child: Container(
                          height: 100.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/starbucks.png'),
                                fit: BoxFit.contain),
                          ),
                        ),
                      )
                    ]),
                    SizedBox(height: 20.0),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsPage(
                                      coffeetype: coffeetypesList[index],
                                    )));
                      },
                      child: Container(
                        height: 50.0,
                        width: 225.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: gld),
                        child: Center(
                          child: Text(
                            'Order Now',
                            style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
