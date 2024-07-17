import 'package:flutter/material.dart';
import 'package:shop_app/global_variables.dart';
import 'package:shop_app/product_card.dart';
import 'package:shop_app/product_details_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const ["All", "Adidas", "Nike", "Bata"];
  late String selectedFilter;

  @override
  void initState() {
    // TODO: implement initState
    selectedFilter = filters[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        width: 3,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(40),
      ),
    );
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Shoes\nCollection",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {});
                        selectedFilter = filter;
                      },
                      child: Chip(
                        backgroundColor: selectedFilter == filter
                            ? Colors.blueAccent
                            : Colors.grey,
                        side: BorderSide(
                          color: selectedFilter == filter
                              ? Colors.blueAccent
                              : Colors.grey,
                        ),
                        label: Text(filter),
                        labelPadding: const EdgeInsets.all(12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                          25,
                        )),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: products.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ProdutDetailsPage(
                              product: product,
                            );
                          },
                        ),
                      );
                    },
                    child: ProductCard(
                      title: product["title"] as String,
                      price: product["price"] as double,
                      image: product["imageUrl"] as String,
                      backgroundColor: index % 2 == 0
                          ? const Color.fromRGBO(216, 240, 253, 1)
                          : Colors.grey,
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
