import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map> dataList = [
    {
      "url":
      "https://www-static.chinacdn.starbucks.com.cn/prod/images/pages/tmall-2020-06-29-zh.jpg"
    },
    {
      "url":
      "https://www-static.chinacdn.starbucks.com.cn/prod/images/pages/starbucks-design-studio-web-china.jpg"
    },
    {
      "url":
      "https://www-static.chinacdn.starbucks.com.cn/prod/images/pages/homepage-career-cn.jpg"
    },
    {
      "url":
      "https://www-static.chinacdn.starbucks.com.cn/prod/assets/images/featured/20201103/4.jpg"
    },
    {
      "url":
      "https://www-static.chinacdn.starbucks.com.cn/prod/assets/images/featured/20201103/4.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              leading: Icon(Icons.arrow_back),
              centerTitle: true,
              pinned: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                  title: Text('星巴克中国',style: TextStyle(
                      color: Colors.white
                  ),),
                  background:bannerView()),
            ),
            SliverFixedExtentList(
                itemExtent: 200,
                delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {

                  return Card(
                    child: Container(
                      child: Image.network(dataList[index]["url"],fit: BoxFit.fitHeight,),
                    ),
                  );
                },childCount: dataList.length))
          ],
        ));
  }

  Widget bannerView(){
    return Container(
      width: double.infinity,
      child: AspectRatio(
        aspectRatio: 16/9,
        child: Swiper(
          itemBuilder: (BuildContext context,int index){
            return Image.network(this.dataList[index]["url"],fit: BoxFit.fitHeight,);
          },
          itemCount: dataList.length,
          pagination: SwiperPagination(
              builder: SwiperPagination.dots
          ),
          autoplay: true,
        ),
      ),
    );
  }
}
