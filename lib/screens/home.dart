import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/screens/category_tab.dart';
import 'package:news_app/widgets/custom_text.dart';
import 'package:news_app/widgets/home_drawer.dart';
import 'package:news_app/widgets/news_ui.dart';

class Home extends StatefulWidget {
   Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.green,
        title: CustomText(
             text: selectedCategory==null? "News App":selectedCategory?.name??"",
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)
          )
        ),
        actions: const [
           Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8),
            child: Icon(Icons.search,size: 30,),
          )
        ],
      ),
      drawer: HomeDrawer(),
      body: selectedCategory==null?CategoryTab(
        onCategoryClick:onCategoryClick ,
      ):NewsUi(categoryId: selectedCategory!.id,)
    );
  }

  CategoryModel? selectedCategory;
  onCategoryClick(cat){
    setState(() {
      selectedCategory=cat;
    });
  }
}
