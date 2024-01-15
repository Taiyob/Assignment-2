import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List cartItems = [
    {
      "image": "assets/images/cart1.png",
      "productName": "Pullover",
      "productColor": "Black",
      "productSize": "L",
      "price": 51
    },
    {
      "image": "assets/images/cart2.png",
      "productName": "T-Shirt",
      "productColor": "Gray",
      "productSize": "L",
      "price": 30
    },
    {
      "image": "assets/images/cart3.png",
      "productName": "Sport Dress",
      "productColor": "Black",
      "productSize": "M",
      "price": 43
    }
  ];
  Map<int, int> quantities = {};
  @override
  Widget build(BuildContext context) {
    int totalAmount = calculateTotalAmount();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F9F9),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.search,
              size: 24,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Container(
        color: const Color(0xFFF9F9F9),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'My Bag',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  int count = quantities[index] ?? 1;
                  return Padding(
                    padding:
                    const EdgeInsets.only(top: 18, right: 18, left: 18,),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  cartItems[index]["image"],
                                  fit: BoxFit.fitHeight,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 220,
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              cartItems[index]["productName"]
                                              as String,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Column(
                                              children: [
                                                Icon(Icons.more_vert),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            'Color:',
                                            style: TextStyle(
                                              color: Color(0xFF9B9B9B),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            cartItems[index]["productColor"]
                                            as String,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 18,
                                          ),
                                          const Text(
                                            'Size:',
                                            style: TextStyle(
                                              color: Color(0xFF9B9B9B),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                              cartItems[index]["productSize"]
                                              as String,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          FloatingActionButton(
                                            onPressed: () {
                                              if (count > 1) {
                                                count--;
                                                updateQuantity(index, count);
                                              }
                                            },
                                            backgroundColor: Colors.white,
                                            mini: true,
                                            shape: CircleBorder(),
                                            elevation: 4.0,
                                            heroTag: null,
                                            materialTapTargetSize:
                                            MaterialTapTargetSize
                                                .shrinkWrap,
                                            child: const Text(
                                              '-',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 32),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(count.toString()),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          FloatingActionButton(
                                            onPressed: () {
                                              count++;
                                              updateQuantity(index, count);
                                              if(count == 5){
                                                showDialog(context: context, builder: (context){
                                                  return AlertDialog(
                                                    title: Text(cartItems[index]["productName"]
                                                    as String,),
                                                    content: Text('You select five items already and Total Amount ${totalAmount}'),
                                                    actions: [
                                                      ElevatedButton(onPressed: (){}, child: Text('Close')),
                                                    ],
                                                  );
                                                });
                                              }
                                            },
                                            backgroundColor: Colors.white,
                                            mini: true,
                                            shape: CircleBorder(),
                                            elevation: 4.0,
                                            heroTag: null,
                                            materialTapTargetSize:
                                            MaterialTapTargetSize
                                                .shrinkWrap,
                                            child: const Text(
                                              '+',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 32),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 80,
                                          ),
                                          Text(
                                            '\$${((cartItems as List)[index]["price"] * count)}',
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total Amount',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                  Text('\$$totalAmount',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Center(
                child: Container(
                  width: 350,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        mySnakbar(context, 'Thank you for your checkout and your total amount is ${totalAmount}');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // Background color
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(25), // Border radius
                        ),
                      ),
                      child: const Text(
                        'CHECK OUT',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updateQuantity(int index, int newQuantity) {
    setState(() {
      quantities[index] = newQuantity;
    });
  }

  int calculateTotalAmount() {
    int total = 0;
    for (int i = 0; i < cartItems.length; i++) {
      int count = quantities[i] ?? 1;
      total += (cartItems[i]["price"] as int) * count;
    }
    return total;
  }
  mySnakbar(context,msg){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}