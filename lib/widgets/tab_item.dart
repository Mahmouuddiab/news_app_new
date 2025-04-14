import 'package:flutter/material.dart';
import 'package:news_app/models/SourceModel.dart';
import 'package:news_app/widgets/custom_text.dart';

class TabItem extends StatelessWidget {
  bool isSelected;
  Sources source;
   TabItem({super.key,required this.isSelected,required this.source});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
      decoration: BoxDecoration(
        color: isSelected?Colors.green:Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.green,width: 1.5)
      ),
      child: CustomText(
          text: source.name!,
        fontWeight: FontWeight.bold,
        fontSize: 17,
        color: isSelected?Colors.white:Colors.green,
      ),
    );
  }
}
