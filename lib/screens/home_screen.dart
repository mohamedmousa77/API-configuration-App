import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/article_controller.dart';
import '../services/news_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget buildArticle(String imageUrl, String title, String description) {
    return Column(
      children: [
        // image
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.white54,
            boxShadow: [
              BoxShadow(
                  color: Colors.white24,
                blurRadius: 10,
                offset: Offset(0,8),
                spreadRadius: 2
              )
            ]
          ),
              child: Image.network(imageUrl),

        ),
        //title
        SizedBox(height:MediaQuery.of(context).size.height *0.02),
        Container(
            child: Text(title,
                style:const TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black))),
        //description
        Container(
            child: Text(description,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey))),
        SizedBox(height:MediaQuery.of(context).size.height *0.02),
      ],
    );
  }

  Widget getAppBar() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(3, 27, 51, 1),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(55),
            bottomLeft: Radius.circular(55),
          )),
      child: Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.05,
            left: MediaQuery.of(context).size.width * 0.3,
          ),
          child: const Text(
            'Cloud News',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
          )),
    );
  }

  Widget getBody() {
    return Container(
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.05,
            left: MediaQuery.of(context).size.width * 0.05),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemCount: Get.find<ArticleController>().articles.length,
                  itemBuilder: (context, index) {
                    return buildArticle(
                        Get.find<ArticleController>().articles[index].imageUrl,
                        Get.find<ArticleController>().articles[index].title,
                        Get.find<ArticleController>()
                            .articles[index]
                            .description);
                  }),
            ),
          ],
        ));
  }

  @override
  void initState() {
    // TODO: implement initState

    Get.find<ArticleController>().fetchArticle();
    Get.find<ArticleController>().addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        getAppBar(),
        getBody(),
      ],
    ));
  }
}
