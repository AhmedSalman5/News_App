import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/web_view/web_view_screen.dart';

Widget buildArticleItem(article, context) => InkWell(
  onTap: (){
    navigateTo(context, WebViewScreen(url: article['url'],));
  },
  child:   Padding(

        padding: const EdgeInsets.all(15.0),

        child: Row(

          mainAxisAlignment: MainAxisAlignment.start,

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            article['urlToImage'] != null

                ? Container(

                    width: 120.0,

                    height: 120.0,

                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(10.0),

                      image: DecorationImage(

                        image: NetworkImage('${article['urlToImage']}'),

                        fit: BoxFit.cover,

                      ),

                    ),

                  )

                : Container(

                    color: Colors.transparent,

                    width: 120.0,

                    height: 120.0,

                  ),

            const SizedBox(

              width: 20,

            ),

            Expanded(

              child: SizedBox(

                height: 120.0,

                child: Column(

                  mainAxisAlignment: MainAxisAlignment.start,

                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Expanded(

                      child: Text(

                        '${article['title']}',

                        style: Theme.of(context).textTheme.bodyText1,

                        maxLines: 3,

                        overflow: TextOverflow.ellipsis,

                      ),

                    ),

                    Text(

                      '${article['publishedAt']}',

                      style: const TextStyle(

                        color: Colors.grey,

                      ),

                    ),

                  ],

                ),

              ),

            ),

          ],

        ),

      ),
);

Widget myDivider() => Container(
      height: 2,
      width: double.infinity,
      color: Colors.white,
    );

Widget articleBuilder(list,{isSearch = false}) => ConditionalBuilder(
      condition: list.isNotEmpty,
      builder: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(list[index], context),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: list.length,
      ),
      fallback: (context) => isSearch ? Container() : const Center(
        child: CircularProgressIndicator(),
      ),
    );

void navigateTo (context,widget) {
Navigator.push(context, MaterialPageRoute(builder:(context)=> widget));
}