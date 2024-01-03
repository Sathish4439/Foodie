import 'package:flutter/material.dart';
import 'package:foodapp/const.dart';
import 'package:foodapp/provider/cartprovider.dart';
import 'package:provider/provider.dart';

class Favpage extends StatefulWidget {
  const Favpage({super.key});

  @override
  State<Favpage> createState() => _FavpageState();
}

class _FavpageState extends State<Favpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primarycolor,
        body: Consumer<CartProvider>(
          builder: (context, value, child) {
             var item = value.FavProducts;
          var total = item.length;
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(
                                "Favirote",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),Container(
                        height: MediaQuery.of(context).size.height,
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
                                                                .Removefromfav(
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
                      ),],
                  ),
                )
              ],
            );
          },
        ));
  }
}
