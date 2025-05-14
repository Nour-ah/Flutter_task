// view/widget/productwidget.dart
import 'package:flutter/material.dart';
import 'package:task/core/utils/configsize/configsize.dart';
import 'package:task/data/model/productmodel.dart';

class ProductWidget extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onTap;

  const ProductWidget({required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.all(SizeConfig.defaultSize! * .1),
      child: ListTile(
        leading: Image.network(product.productthumbnail ?? "Unavailable",
            width: SizeConfig.defaultSize! * 6,
            height: SizeConfig.defaultSize! * 8),
        title: Text(product.title ?? 'Unavailable'),
        subtitle: Text("\$${product.price ?? ''} | ${product.rating ?? ''}"),
        onTap: onTap,
      ),
    );
  }
}
