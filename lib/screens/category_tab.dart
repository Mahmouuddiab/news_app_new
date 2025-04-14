import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/app_colors.dart';
import 'package:news_app/widgets/category_item.dart';
import 'package:news_app/widgets/custom_text.dart';


class CategoryTab extends StatelessWidget {
  Function onCategoryClick;
   CategoryTab({super.key,required this.onCategoryClick});

  List<CategoryModel>categories=[
    CategoryModel(id: "sports", name: "Sports", image: "assets/sports.png", color: AppColors.red),
    CategoryModel(id: "politics", name: "Politics", image: "assets/Politics.png", color: AppColors.blue),
    CategoryModel(id: "health", name: "Health", image: "assets/health.png", color: AppColors.pink),
    CategoryModel(id: "business", name: "Business", image: "assets/bussines.png", color: AppColors.brown),
    CategoryModel(id: "environment", name: "Environment", image: "assets/environment1.png", color: AppColors.green),
    CategoryModel(id: "science", name: "Science", image: "assets/science1.png", color: AppColors.yellow),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
              text: "pick your category \n of interest",
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.blueGrey,
          ),
          const SizedBox(height: 15,),
          Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                  ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      onCategoryClick(categories[index]);
                    },
                    child: CategoryItem(
                        category: categories[index],
                    ),
                  ) ;
                },
              )
          )
        ],
      ),
    );
  }
}
