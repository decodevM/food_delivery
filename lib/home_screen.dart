import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/category.dart';
import 'package:food_delivery/product_card.dart';
import 'package:food_delivery/product_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _categories = [
    'Pizza',
    'Burgers',
    'Kebab',
    'Desert',
    'Salad',
  ];
  final List<ProductModel> _products = [
    ProductModel(price: 14.99, name: 'Vegetarian Pizza', image: '1.jpg'),
    ProductModel(price: 18.50, name: 'Four Cheese Pizza', image: '2.jpg'),
    ProductModel(price: 12.00, name: 'Tomato Pizza', image: '3.jpg'),
  ];
  int _selectedIndex = -1;

  void _changeSelectedIndex(int index) {
    if (_selectedIndex == index) {
      _selectedIndex = -1;
    } else {
      _selectedIndex = index;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: ((context, innerBoxIsScrolled) => [
              CupertinoSliverNavigationBar(
                largeTitle: const Text('Food Delivery',
                    style: TextStyle(color: Colors.orange)),
                automaticallyImplyLeading: false,
                trailing: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: const Icon(
                    CupertinoIcons.shopping_cart,
                    color: Colors.orange,
                  ),
                ),
              ),
            ]),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) =>
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () => _changeSelectedIndex(index),
                        child: Category(
                          title: _categories[index],
                          isSelected: _selectedIndex == index ? true : false,
                        ),
                      ),
                  itemCount: _categories.length),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Free Delivery',
                style: TextStyle(
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              // height: 300,
              height: MediaQuery.of(context).size.height * .6,
              child: ListView.builder(
                  padding: const EdgeInsets.only(left: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: _products.length,
                  itemBuilder: (BuildContext context, int index) => ProductCard(
                      price: _products[index].price,
                      productName: _products[index].name,
                      image: _products[index].image)),
            ),
          ],
        ),
      ),
    );
  }
}
