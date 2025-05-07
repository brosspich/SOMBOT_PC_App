import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sombot_pc/data/models/product_model.dart';
import 'package:sombot_pc/router/app_route.dart';
import 'package:sombot_pc/utils/colors.dart';
import 'package:sombot_pc/utils/list_catigory.dart';
import 'package:sombot_pc/utils/text_style.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> _orders = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  Future<void> fetchOrders() async {
    try {
      var snapshot =
          await FirebaseFirestore.instance.collection('Product Master').get();

      List<Map<String, dynamic>> orders = snapshot.docs.map((doc) {
        return {
          'id': doc.id,
          ...doc.data(),
        };
      }).toList();

      setState(() {
        _orders = orders;
        _isLoading = false;
      });
    } catch (e) {
      print('Error fetching orders: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
              height: 55,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 10),

            /// 🔄 Category Horizontal Scroll
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: item.map((e) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColors.darkGrey,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.network(
                            e.imageUrl,
                            width: 35,
                            height: 35,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 10),
                          Text(e.name, style: normal),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hot Saltes',
                  style: normal.copyWith(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('See All'),
                ),
              ],
            ),
            const SizedBox(height: 10),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(5, (index) {
                  return Container(
                    width: 200,
                    height: 280,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.grey.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 180,
                              decoration: BoxDecoration(
                                color: index.isEven
                                    ? Colors.blue[200]
                                    : Colors.pink[200],
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  'https://imgs.search.brave.com/DmP06UvQeYrBtHyErWykR_YP4tA-zo6SBJGqgdduE80/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9wbHVz/cG5nLmNvbS9pbWct/cG5nL2xhcHRvcC1o/ZC1wbmctYXN1cy1s/YXB0b3AtcG5nLXRy/YW5zcGFyZW50LTY1/Ny5wbmc',
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 5,
                              right: 70,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  'Free Shipping',
                                  style: normal.copyWith(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(width: 10),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Product Name',
                                    style: normal.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('\$150', style: normal),
                                ],
                              ),
                              Text(
                                  'Limit 1 per customer only,Fast performance and 1TB',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: normal.copyWith(
                                      fontSize: 12, color: AppColors.darkGrey)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recently Viewed',
                  style: normal.copyWith(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('See All'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _orders.isEmpty
                    ? const Center(child: Text("No products found."))
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _orders.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 8 / 12,
                        ),
                        itemBuilder: (context, index) {
                          final product = _orders[index];
                          return InkWell(
                            onTap: () {
                              context.router.push(
                                DetailRoute(
                                  productModel: ProductsModel(
                                    id: product['id'],
                                    productName: product['productName'],
                                    productDetails: product['productDetails'],
                                    category: product['category'],
                                    image: product['image'],
                                    price: product['price'],
                                    quantity: product['quantity'],
                                    imagePreview:
                                        product['imagePreview'] != null
                                            ? List<String>.from(
                                                product['imagePreview'])
                                            : [],
                                    color: product['color'],
                                    storageGB: product['storageGB'],
                                    cpuModel: product['cpuModel'],
                                    cpuName: product['cpuName'],
                                    os: product['os'],
                                    ramGB: product['ramGB'],
                                    gpu: product['gpu'],
                                    style: product['style'],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 10,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                                color: AppColors.white,
                                border: Border.all(
                                  color: AppColors.grey.withOpacity(0.2),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 140,
                                    decoration: BoxDecoration(
                                      color: index.isEven
                                          ? Colors.blue[200]
                                          : Colors.pink[200],
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.memory(
                                        base64Decode(product['image']),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 95,
                                              child: Text(
                                                product['productName'],
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: normal.copyWith(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                context.router.push(
                                                  const LoginRoute(),
                                                );
                                              },
                                              icon: const Icon(
                                                Icons.favorite_border,
                                                color: Colors.grey,
                                                size: 30,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          product['productDetails'],
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: normal.copyWith(
                                              fontSize: 12,
                                              color: AppColors.darkGrey),
                                        ),
                                        // const SizedBox(height: 10),
                                        // Row(
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment.spaceBetween,
                                        //   children: [
                                        //     Text(
                                        //       '\$${product['price']}',
                                        //       style: normal.copyWith(
                                        //           fontSize: 12,
                                        //           fontWeight: FontWeight.bold),
                                        //     ),
                                        //     Container(
                                        //       padding:
                                        //           const EdgeInsets.symmetric(
                                        //               horizontal: 8,
                                        //               vertical: 4),
                                        //       decoration: BoxDecoration(
                                        //         color: AppColors.primary,
                                        //         borderRadius:
                                        //             BorderRadius.circular(10),
                                        //       ),
                                        //       child: const Text(
                                        //         'Add to Cart',
                                        //         style: TextStyle(
                                        //             color: Colors.white),
                                        //       ),
                                        //     ),
                                        //   ],
                                        // )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
          ],
        ),
      ),
    );
  }
}
