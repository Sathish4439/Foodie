import 'package:flutter/material.dart';
import 'package:foodapp/const.dart';
import 'package:foodapp/pages/food.dart';
import 'package:foodapp/pages/foodDetail.dart';

class Hotal extends StatelessWidget {
  String img;
  String Shopname;
  Hotal({Key? key, required this.img, required this.Shopname})
      : super(key: key);

  List<String> biriyaniimg = [
    "https://static.wixstatic.com/media/91e241_25e8d84cab9849b6bd927f66ef18a9bf~mv2.jpg/v1/fill/w_1000,h_1000,al_c,q_85,enc_auto/91e241_25e8d84cab9849b6bd927f66ef18a9bf~mv2.jpg",
    "https://static.wixstatic.com/media/91e241_797097166fa04780b7a5b58395c60efa~mv2.jpg/v1/fill/w_600,h_401,al_c,lg_1,q_80,enc_auto/91e241_797097166fa04780b7a5b58395c60efa~mv2.jpg",
    "https://static.wixstatic.com/media/91e241_06fe88a0d6ce42bda1ddce75234ea3a9~mv2.jpg/v1/fill/w_1110,h_653,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/91e241_06fe88a0d6ce42bda1ddce75234ea3a9~mv2.jpg",
    "https://static.wixstatic.com/media/91e241_5d2f50985db645d4828ba0c82698d584~mv2.jpg/v1/fill/w_1110,h_740,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/91e241_5d2f50985db645d4828ba0c82698d584~mv2.jpg",
    "https://static.wixstatic.com/media/91e241_0807b60de0c04b448d4a7d3c9dde0b39~mv2.jpg/v1/fill/w_1200,h_900,al_c,q_90/91e241_0807b60de0c04b448d4a7d3c9dde0b39~mv2.webp",
    "https://static.wixstatic.com/media/91e241_5208c2011448467fb335715697f55dbf~mv2.jpg/v1/fill/w_600,h_480,al_c,lg_1,q_80,enc_auto/91e241_5208c2011448467fb335715697f55dbf~mv2.jpg",
    "https://static.wixstatic.com/media/91e241_e3131e48a4cc48169d8cc9fe1fc2219d~mv2.jpg/v1/fill/w_1110,h_624,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/91e241_e3131e48a4cc48169d8cc9fe1fc2219d~mv2.jpg",
    "https://static.wixstatic.com/media/91e241_2f253aa5e8714fb09a15a1fe2191eef8~mv2.jpg/v1/fill/w_1000,h_664,al_c,q_85,enc_auto/91e241_2f253aa5e8714fb09a15a1fe2191eef8~mv2.jpg",
    "https://static.wixstatic.com/media/91e241_c0d8755e27e043a293594b631a9c380b~mv2.jpg/v1/fill/w_864,h_576,al_c,lg_1,q_85,enc_auto/91e241_c0d8755e27e043a293594b631a9c380b~mv2.jpg"
  ];

  List<String> biriyaniname = [
    "Hyderabadi Biryani",
    "Lucknowi Biryani",
    "Dindigul Biryani",
    "Ambur Biryani",
    "Bhatkali Biryani",
    "Kolkata Biryani",
    "Sindhi Biryani",
    "Malabar Biryani",
    "Bombay biryan"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Stack(
          children: [
            Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                    ),
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(img), fit: BoxFit.cover),
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(70))),
                          height: MediaQuery.of(context).size.height / 4,
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: biriyaniimg.length,
                                itemBuilder: ((context, index) {
                                  return Foodmenu(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) => FoodDetail(
                                                    shopname: Shopname,
                                                    img: biriyaniimg[index],
                                                    name: biriyaniname[index],
                                                  ))));
                                    },
                                    img: biriyaniimg[index],
                                    name: biriyaniname[index],
                                    shopname: Shopname,
                                  );
                                })))
                      ],
                    )),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150, left: 30),
              child: FittedBox(
                child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15))),
                    height: MediaQuery.of(context).size.height / 7,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 5, bottom: 5, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                Shopname,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Row(
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
                                    width: 20,
                                  ),
                                  const Text("Fast Food"),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  const Text(
                                    "2.8%",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        color: primarycolor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Center(
                                      child: Text(
                                        "Free Delivery",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.timer,
                                    color: Colors.grey.shade900,
                                    size: 15,
                                  ),
                                  const Text(
                                    "15 - 20 min",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover, image: NetworkImage(img)),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ],
                    )),
              ),
            )
          ],
        ),
        SizedBox(
          height: 50,
        )
      ],
    ));
  }
}
