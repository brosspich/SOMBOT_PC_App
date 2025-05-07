import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sombot_pc/data/models/product_model.dart';

@RoutePage()
class DetailScreen extends StatefulWidget {
  DetailScreen({super.key, this.productModel});
  ProductsModel? productModel;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    bool isFavorite = false;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              title: const Text('Detail Screen'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  context.router.pop();
                },
              ),
            ),
            CarouselDemo(imageUrls: widget.productModel?.imagePreview ?? []),
            // Container(
            //   width: double.infinity,
            //   height: 300,
            //   color: Colors.blue,
            //   child: Image.network(
            //     widget.productModel?.imageUrl ??
            //         'https://via.placeholder.com/150',
            //     fit: BoxFit.cover,
            //   ),
            // ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 5, 235, 197),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Text(
                      'Free shipping',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.favorite_border,
                      size: 30,
                      color: isFavorite == true ? Colors.yellow : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                        if (isFavorite) {
                          isFavorite = true;
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Added to favorites'),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        } else {
                          isFavorite = false;
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Removed from favorites'),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.productModel?.productName ?? 'No name',
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    widget.productModel?.productDetails ?? 'No description',
                    style: const TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      const Text(
                        'Price: ',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '\$${widget.productModel?.price ?? 0}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      Text(
                        'Screen Size: ',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '15.6 Inches',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text(
                        'Brand: ',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        widget.productModel?.category ?? 'No brand',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text(
                        'Hard Disk Size: ',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        widget.productModel?.storageGB == 0
                            ? 'No storage'
                            : '${widget.productModel?.storageGB} GB',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text(
                        'Color: ',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        widget.productModel?.color ?? 'No color',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text(
                        'RAM Size: ',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        widget.productModel?.ramGB == 0
                            ? 'No RAM'
                            : '${widget.productModel?.ramGB} GB',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text(
                        'Status: ',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        widget.productModel?.quantity == 0
                            ? 'Out of stock'
                            : 'In stock',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CarouselDemo extends StatelessWidget {
  CarouselDemo({super.key, required this.imageUrls});

  List<String> imageUrls = [];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: imageUrls.length,
      itemBuilder: (context, index, realIdx) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.memory(
                base64Decode(imageUrls[index]),
                fit: BoxFit.cover,
              )),
        );
      },
      options: CarouselOptions(
        height: 300,
        autoPlay: true,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
    );
  }
}
