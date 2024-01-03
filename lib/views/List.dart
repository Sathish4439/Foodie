import 'package:flutter/material.dart';
import 'package:foodapp/provider/cartprovider.dart';
import 'package:foodapp/provider/product.dart';
import 'package:provider/provider.dart';

class Hotals extends StatefulWidget {
  void Function()? onTap;
  String img;
  String name;
  String Shopname;

  Hotals({
    Key? key,
    required this.img,
    required this.Shopname,
    required this.name,
    required this.onTap,
  }) : super(key: key);

  @override
  State<Hotals> createState() => _HotalsState();
}

class _HotalsState extends State<Hotals> {
  bool ispressed = false;

  void toggleIsPressed() {
    setState(() {
      ispressed = !ispressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartprovider = Provider.of<CartProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: widget.onTap,
        child: FittedBox(
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.img))),
                  height: 100,
                  width: 100,
                 
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow.shade900,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "4.2",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text("Fast Food"),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "2.8%",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.timer,
                            color: Colors.grey,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "15 - 20 min",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "2.4KM",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          toggleIsPressed();
                          // var item = product(
                          //     Price: "250",
                          //     img: widget.img,
                          //     name: widget.name,
                          //     shopname: widget.Shopname);
                          // cartprovider.AddTofav(item);
                        },
                        icon: Icon(
                          ispressed ? Icons.favorite : Icons.favorite_border,
                          color: Colors.red,
                        ),
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
