import 'package:flutter/material.dart';
import 'package:news_app/models/NewsResponse.dart';
import 'package:news_app/widgets/custom_text.dart';

class ArticleItem extends StatelessWidget {
  Articles article;
   ArticleItem({super.key,required this.article});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
            child: Image.network(article.urlToImage!,fit: BoxFit.fill,)
        ),
        const SizedBox(height: 5,),
        CustomText(
            text: article.source!.name!,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        CustomText(
          text: article.description!,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: CustomText(
            text: article.publishedAt!.substring(0,10),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
