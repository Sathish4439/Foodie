import 'package:flutter/material.dart';
import 'package:foodapp/const.dart';
import 'package:foodapp/pages/Hotal.dart';
import 'package:foodapp/pages/cartpage.dart';
import 'package:foodapp/pages/favpage.dart';
import 'package:foodapp/views/List.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  List<String> item = [
    "All",
    "Pepperoni",
    "Mushrooms",
    "Sausage",
    "Onions",
    "Bacon",
    "Extra Cheese",
  ];

  List<String> Hotalimg = [
    "https://marketplace.canva.com/EAFYecj_1Sc/1/0/1600w/canva-cream-and-black-simple-elegant-catering-food-logo-2LPev1tJbrg.jpg",
    "https://marketplace.canva.com/EAFpeiTrl4c/1/0/1600w/canva-abstract-chef-cooking-restaurant-free-logo-9Gfim1S8fHg.jpg",
    "https://www.shutterstock.com/image-vector/vintage-logo-restaurant-food-drink-600nw-1431394568.jpg",
    "https://cdn.logojoy.com/wp-content/uploads/2018/05/01105727/8_big33-768x591.png",
    "https://99designs-blog.imgix.net/blog/wp-content/uploads/2019/04/attachment_93742997-e1554228382773.png?auto=format&q=60&fit=max&w=930",
    "https://www.logopeople.in/wp-content/uploads/2022/10/bahama-eats-N-YC-USA-1.png",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoVpWNp0EAuCXTDO3q765pVKH-QRwuXT-LOT1ktefD_lCNdXQrbGjhfP7LKRUpPyBRqGA&usqp=CAU"
  ];

  List<String> Hotalname = [
    "Fauget catering",
    "Master Chef",
    "Rosto cafe",
    "Ray's",
    "Skeeter's",
    "Burgitos",
    "Buns & Guns"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundcolor,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => Cartpage())));
              },
              icon: const Icon(Icons.shopping_bag)),
          const SizedBox(
            width: 10,
          ),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => Favpage())));
              },
              icon: const Icon(Icons.favorite)),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text(
                        "Hii, ",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Sathish",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const Row(
                    children: [
                      Icon(Icons.location_on_outlined),
                      Text(
                        "Deliver to Karur 639005",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Stack(
                      children: [
                        Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(42),
                                  bottomLeft: Radius.circular(42)),
                              color: primarycolor),
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: ((context, index) {
                                if(index==0)
                                {
                                  
                                }
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                        height: 80,
                                        width: 80,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white),
                                        child: Center(
                                            child: FittedBox(
                                                child: Text(
                                          item[index],
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        )))),
                                  ),
                                );
                              })),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: Hotalname.length,
                  itemBuilder: ((context, index) {
                    return Hotals(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => Hotal(
                                      img: Hotalimg[index],
                                      Shopname: Hotalname[index],
                                    ))));
                      },
                      name: Hotalname[index],
                      img: Hotalimg[index],
                      Shopname: Hotalname[index],
                    );
                  })),
            )
          ],
        ),
      ),
    );
  }
}
