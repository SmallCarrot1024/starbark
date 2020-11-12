import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Color(0xFF00A862)),
      // theme: ThemeData(
      //   primaryColor: Color(0x00A862),
      // ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map> dataList = [
    {
      "url":
          "https://www-static.chinacdn.starbucks.com.cn/prod/assets/images/featured/20201103/1.jpg"
    },
    {
      "url":
          "https://www-static.chinacdn.starbucks.com.cn/prod/assets/images/featured/20201103/2.jpg"
    },
    {
      "url":
          "https://www-static.chinacdn.starbucks.com.cn/prod/assets/images/featured/20201103/3.jpg"
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
            return new
            Image.network(this.dataList[index]["url"],fit: BoxFit.fitHeight,);
          },
          itemCount: dataList.length,
          pagination: SwiperPagination(
            builder: SwiperPagination.rect
          ),
          autoplay: true,
        ),
      ),
    );
  }
}


