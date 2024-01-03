import 'package:flutter/material.dart';
import 'package:foodapp/const.dart';
import 'package:foodapp/pages/finalpage.dart';
import 'package:foodapp/provider/cartprovider.dart';
import 'package:provider/provider.dart';

import '../provider/product.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  bool ispressed = false;

  void toggleIsPressed() {
    setState(() {
      ispressed = !ispressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    int total = 1;
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: Consumer<CartProvider>(
        builder: (context, value, child) {
          var item = value.Products;
          var total = item.length;

          return ListView(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(color: primarycolor),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Cart",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            const Row(
                              children: [
                                Icon(Icons.location_on_outlined,
                                    color: Colors.white),
                                Text(
                                  "Deliver to Karur 639005",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 2,
                        decoration: BoxDecoration(
                          color: primarycolor,
                        ),
                        child: ListView.builder(
                            itemCount: item.length,
                            itemBuilder: ((context, index) {
                              var prod = item[index];

                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.white)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "FROM",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                prod.shopname,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: Colors.white)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.timer,
                                                        color: Colors.white,
                                                        size: 15,
                                                      ),
                                                      const Text(
                                                        "15 - 20 min",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                height: 100,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(
                                                            prod.img))),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "QTY:1",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    prod.name,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Text(
                                                        " \u{20B9} 250",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      SizedBox(
                                                        width: 50,
                                                      ),
                                                      IconButton(
                                                          onPressed: () {
                                                            showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return AlertDialog(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .white,
                                                                      content:
                                                                          Text(
                                                                        " Canclled ",
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                      ),
                                                                      actions: [
                                                                        ElevatedButton(
                                                                            onPressed:
                                                                                () {
                                                                              setState(() {
                                                                                Navigator.pop(context);
                                                                              });
                                                                            },
                                                                            child:
                                                                                Icon(Icons.done)),
                                                                      ]);
                                                                });
                                                            value
                                                                .RemovefromCart(
                                                                    prod);
                                                          },
                                                          icon: Icon(
                                                            Icons.delete,
                                                            color: Colors.white,
                                                          ))
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                        ]),
                                  ),
                                ),
                              );
                            })),
                      ),
                      Container(
                          height: 200,
                          decoration: BoxDecoration(
                            color: primarycolor,
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(50)),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade300,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Icon(
                                          Icons.delivery_dining,
                                          size: 35,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Free delivery",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade300,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Icon(
                                          Icons.read_more,
                                          size: 35,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Promo Code",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ))
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            "Total  \u{20B9}" + (250 * total).toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Finalpage()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(10)),
                        height: 50,
                        width: 200,
                        child: const Center(
                          child: Text(
                            "CHECK OUT",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
