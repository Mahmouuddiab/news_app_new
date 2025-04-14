import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:news_app/bloc/home_cubit.dart';
import 'package:news_app/bloc/home_states.dart';
import 'package:news_app/widgets/article_item.dart';
import 'package:news_app/widgets/tab_item.dart';

class NewsUi extends StatelessWidget {
  String categoryId;
   NewsUi({super.key,required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: BlocProvider(
          create: (context) => HomeCubit()..getSources(categoryId),
        child: BlocConsumer<HomeCubit,HomeStates>(
          listener: (context, state) {
            if(state is SourcesLoadingState ||state is ArticlesLoadingState ){
              context.loaderOverlay.show();
            }
            else{
              context.loaderOverlay.hide();
            }
            if(state is HomeChangeSource){
              HomeCubit.get(context).getNews(
                HomeCubit.get(context).sources[HomeCubit.get(context).selectedIndex].id!
              );
            }
          },
          builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 8),
                child: Column(
                  children: [
                    HomeCubit.get(context).sources.isEmpty?Center(child: CircularProgressIndicator()):
                    DefaultTabController(
                        length: HomeCubit.get(context).sources.length,
                        child: TabBar(
                          onTap: (index) {
                            HomeCubit.get(context).changeSource(index);
                          },
                            dividerColor: Colors.transparent,
                            indicatorColor: Colors.transparent,
                            isScrollable: true,
                            tabs:
                            HomeCubit.get(context).sources.map((e)=>TabItem(
                                isSelected: HomeCubit.get(context).sources.elementAt(
                                    HomeCubit.get(context).selectedIndex
                                )==e,
                                source: e)).toList()
                        )
                    ),
                    const SizedBox(height: 10,),
                    Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(height: 20,),
                          itemCount: HomeCubit.get(context).articles.length,
                            itemBuilder: (context, index) {
                              return ArticleItem(
                                  article: HomeCubit.get(context).articles[index]
                              ) ;
                            },
                        )
                    ),
                  ],
                ),
              ) ;
          },
        ),
      ),
    );
  }
}
