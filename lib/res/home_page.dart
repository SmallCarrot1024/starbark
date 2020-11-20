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
                      marqueeView(), //跑马灯
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          cardItemView('啡快', '在线点到店取', '下单返券'),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: cardItemView('专星送', '点单送好礼券', '满80免配'),
                          )
                        ],
                      ),
                    ],
                  ));
            }, childCount: 1)),
          ],
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
        ),
      ),
    );
  }

  Widget customShapeView(value) {
    return Container(
      width: 50,
      height: 20,
      child: RaisedButton(
        child: Text(
          value,
          style: TextStyle(fontSize: 8),
        ),
        clipBehavior: Clip.hardEdge,
        textColor: Colors.white,
        color: Colors.orange,
        padding: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(20))),
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
                            child: customShapeView(content))
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
    );
  }
}
