import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:starbark/route/route.dart';
import 'package:starbark/widget/star_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map> dataList = [
    {
      "url":
          "https://www-static.chinacdn.starbucks.com.cn/prod/assets/images/featured/20201103/4.jpg",
      "h5": "https://www.starbucks.com.cn/account/starbucks-rewards"
    },
    {
      "url":
          "https://www-static.chinacdn.starbucks.com.cn/prod/assets/images/featured/20201103/3.jpg",
      "h5": "https://www.starbucks.com.cn/about/careers/"
    },
    {
      "url":
          "https://artwork.starbucks.com.cn/banners-homepage-banner/main_61babe13-d569-476b-8bd6-e75068943318.jpg",
      "h5": "https://starbucks.tmall.com/"
    },
    {
      "url":
          "https://artwork.starbucks.com.cn/banners-homepage-banner/main_e40ff86c-7063-4f6a-8155-b8290e1aba64.jpg",
      "h5": "https://www.starbucks.com.cn/account/starbucks-rewards"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xFFF7F7F7),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              leading: Icon(Icons.arrow_back),
              centerTitle: true,
              pinned: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(background: bannerView()),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
              return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: EdgeInsets.all(8),
                  child: Column(
                    children: <Widget>[
                      starTitle(),
                      SizedBox(
                        height: 8,
                      ),
                      marqueeView(), //跑马灯
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          cardItemView('啡快', '在线点到店取', '下单返券'),

                          Expanded(
                            child: cardItemView('专星送', '点单送好礼券', '满80免配'),
                          )
                        ],
                      ),
                      this._getContent(),
                    ],
                  ));
            }, childCount: 1)),
          ],
        ));
  }

  //主体
  Widget _getContent() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: dataList.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => GestureDetector(
              child: Container(
                  padding: EdgeInsets.all(5),
                  child: Card(
                    child: Image.network(dataList[index]['url']),
                  )),
              onTap: () {
                Navigator.pushNamed(context, '/webview_page',
                    arguments: {"h5": dataList[index]["h5"]});
              },
            ));
  }

  //轮播图
  Widget bannerView() {
    return Container(
      width: double.infinity,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Image.network(
              this.dataList[index]["url"],
              fit: BoxFit.fitHeight,
            );
          },
          itemCount: dataList.length,
          pagination: SwiperPagination(builder: SwiperPagination.dots),
          autoplay: true,
          onTap: (index) {
            Navigator.pushNamed(context, '/webview_page',
                arguments: {"h5": dataList[index]["h5"]});
          },
        ),
      ),
    );
  }

  Widget customShapeView(double width, double height, value, double topLeft,
      double topRight, double bottomLeft, double bottomRight, Color color) {
    return Container(
      width: width,
      height: height,
      child: RaisedButton(
        child: Text(
          value,
          style: TextStyle(fontSize: 8),
        ),
        clipBehavior: Clip.hardEdge,
        textColor: Colors.white,
        color: color,
        padding: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(topLeft),
                topRight: Radius.circular(topRight),
                bottomLeft: Radius.circular(bottomLeft),
                bottomRight: Radius.circular(bottomRight))),
        onPressed: () {},
      ),
    );
  }

  Widget cardItemView(title, subTitle, content) {
    return Card(
      elevation: 8,
      child: Container(
        width: 200,
        height: 120,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 10, top: 15),
                          child: Text(title),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                              left: 5,
                            ),
                            child: customShapeView(50, 20, content, 24.0, 20.0,
                                0, 20.0, Colors.orange))
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            subTitle,
                            style: TextStyle(
                                fontSize: 10, color: Color(0xFF00A862)),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 10, bottom: 10),
                  child: Image.asset(
                    "images/rider.png",
                    width: 40,
                    height: 40,
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget marqueeView() {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Color(0xFFF1F0EE),
            borderRadius: BorderRadius.circular((10.0))),
        child: GestureDetector(
          child: ListTile(
            leading: Image.asset(
              "images/notice.png",
              width: 30,
              height: 30,
            ),
            title: Text(
              '你好，有星人！1课好礼星星，开启升杯或加料',
              style: TextStyle(fontSize: 12),
            ),
            trailing: Image.asset(
              "images/arrow_right_gray.png",
              width: 10,
              height: 10,
            ),
          ),
          onTap: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: false,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                builder: (BuildContext context) {
                  return Container(
                      height: 240,
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(Icons.close),

                                onPressed: (){
                                  Navigator.pop(context);
                                },
                              ),
                               Expanded(child: Center(
                                 child:  Text("今天点些什么呢",textAlign: TextAlign.center),
                               ))


                            ],
                          ),
                          ListTile(
                            leading: Image.asset(
                              "images/coffee.png",
                              fit: BoxFit.cover,

                            ),
                            title: Text('啡快'),
                            subtitle:
                                Text('在线点，到店取', style: TextStyle(fontSize: 10)),
                          ),
                          Divider(),
                          ListTile(
                            leading: Image.asset(
                              "images/shop.png",
                              fit: BoxFit.cover,
                            ),
                            title: Text('已经在门店啦'),
                            subtitle: Text(
                              '请告知伙伴需要点购的商品',
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ],
                      ));
                });
          },
        ));
  }

  Widget starTitle() {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Row(
            children: [
              Text('1.5'),
              ClipPath(
                clipper: StarPath(),
                child: Container(
                  color: Color(0xffD5AC54),
                  width: 15,
                  height: 15,
                ),
              )
            ],
          ),
        ),
        Align(
            alignment: Alignment.topRight,
            child: customShapeView(
                70.0, 20.0, '10张好礼券', 10, 10, 10, 10, Color(0xffD5AC54)))
      ],
    );
  }
}
