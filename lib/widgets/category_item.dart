import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/custom_text.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel category;
   CategoryItem({super.key,required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: category.color,
        shape: BoxShape.circle
      ),
      child: Column(
        children: [
          Expanded(child: Image.asset(category.image)),
          CustomText(
            text: category.name,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
