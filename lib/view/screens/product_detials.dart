// view/screens/product_detials.dart
import 'package:flutter/material.dart';
import 'package:task/core/utils/configsize/configsize.dart';
import 'package:task/data/model/productmodel.dart';

import '../../core/utils/configsize/spacewidget.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel product;

  const ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 178, 199, 209),
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 63, 61, 61),
          title: Text(
            product.title ?? "Unavailable",
            style: TextStyle(
              color: Colors.white,
            ),
          )),
      body: Padding(
        padding: EdgeInsets.all(SizeConfig.defaultSize! * .3),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              product.images.isNotEmpty
                  ? SizedBox(
                      height: SizeConfig.defaultSize! * 25,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: product.images.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 10),
                        itemBuilder: (context, index) {
                          return Image.network(
                            product.images[index],
                            fit: BoxFit.cover,
                            width: SizeConfig.defaultSize! * 25,
                          );
                        },
                      ),
                    )
                  : const SizedBox(),
              VerticalSpace(SizeConfig.defaultSize! * .3),
              Text(
                product.title ?? "Unavailable",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              VerticalSpace(SizeConfig.defaultSize! * .1),
              Text(
                product.description ?? "",
                style: TextStyle(fontSize: 14),
              ),
              VerticalSpace(SizeConfig.defaultSize! * .1),
              Text(
                "Price: \$${product.price ?? ''}",
                style: TextStyle(fontSize: 14),
              ),
              VerticalSpace(SizeConfig.defaultSize! * .1),
              Text(
                "Discount Percentage: ${product.discountPercentage ?? ''}%",
                style: TextStyle(fontSize: 14),
              ),
              VerticalSpace(SizeConfig.defaultSize! * .1),
              Text(
                "Rating: ${product.rating ?? ''}",
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
