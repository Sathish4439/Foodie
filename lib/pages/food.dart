import 'package:flutter/material.dart';
import 'package:foodapp/pages/cartpage.dart';
import 'package:foodapp/provider/product.dart';
import 'package:provider/provider.dart';

import '../provider/cartprovider.dart';

class Foodmenu extends StatelessWidget {
  String name;
  String img;
  String shopname;
  void Function()? onTap;

  Foodmenu(
      {Key? key,
      required this.img,
      required this.name,
      required this.onTap,
      required this.shopname})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartprovider = Provider.of<CartProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FittedBox(
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(img), fit: BoxFit.cover)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                       Row(
                        children: [
                          Text(
                            "\u2022 Rice",
                            style: TextStyle(fontSize: 15,),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "\u2022 Chikken",
                            style: TextStyle(fontSize: 15,),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "\u2022 masala",
                            style: TextStyle(fontSize: 15, ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "21 reviews",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("\u{20B9} 250",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                          SizedBox(
                            width: 135,
                          ),
                          TextButton(
                              onPressed: () {
                                var item = product(
                                    shopname: shopname,
                                    Price: Text("250").toString(),
                                    img: img,
                                    name: name);
                                cartprovider.Products.add(item);
                              //   Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: ((context) => Cartpage())));
                               },
                              child: Text(
                                "  Add to cart",
                                style: TextStyle(color: Colors.red),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
