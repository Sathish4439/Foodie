import 'package:flutter/material.dart';
import 'package:foodapp/const.dart';
import 'package:foodapp/pages/cartpage.dart';
import 'package:foodapp/provider/cartprovider.dart';
import 'package:provider/provider.dart';

import '../provider/product.dart';

class FoodDetail extends StatefulWidget {
  String img;
  String name;
  String shopname;
  FoodDetail(
      {Key? key, required this.img, required this.name, required this.shopname})
      : super(key: key);

  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  bool ispressed = false;

  void toggleIsPressed() {
    setState(() {
      ispressed = !ispressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartprovider = Provider.of<CartProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: Column(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 1.8,
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(300),
                              bottomRight: Radius.circular(300)),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(widget.img)),
                          color: Colors.red,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              "weight",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Row(
                              children: [
                                Text(
                                  "1",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Icon(
                                  Icons.balance,
                                  weight: 50,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                              "Calories",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Row(
                              children: [
                                Text(
                                  "576",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Icon(
                                  Icons.dinner_dining,
                                  weight: 50,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                              "Quantity",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  "1",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Icon(
                                  Icons.person_2_rounded,
                                  weight: 50,
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        Text(
                          " \u{20B9}250",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Biryani, a beloved rice dish, blends fragrant Basmati rice with marinated meat and a medley of spices, enhanced by caramelized onions. This harmonious combination creates biryani bliss, offering delightful flavors in every bite.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: IconButton(
                    onPressed: () {
                      toggleIsPressed();
                      var item = product(
                        shopname: widget.shopname,
                        Price: Text("250").toString(),
                        img: widget.img,
                        name: widget.name);
                    cartprovider.FavProducts.add(item);
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: ((context) => Cartpage())));
                    },
                    icon: Icon(
                      ispressed ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    var item = product(
                        shopname: widget.shopname,
                        Price: Text("250").toString(),
                        img: widget.img,
                        name: widget.name);
                    cartprovider.Products.add(item);
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => Cartpage())));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(10)),
                    height: 50,
                    width: 200,
                    child: const Center(
                      child: Text(
                        "ADD TO CART",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
