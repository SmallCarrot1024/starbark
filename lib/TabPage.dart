import 'package:flutter/material.dart';
import 'package:starbark/res/MessagePage.dart';
import 'package:starbark/res/cart_page.dart';
import 'package:starbark/res/home_page.dart';
import 'package:starbark/res/mine_page.dart';
import 'package:starbark/res/vip_page.dart';

class TabPage extends StatefulWidget {
  final index;

  TabPage({Key key, this.index = 0}) : super(key: key);

  _TabsState createState() => _TabsState(this.index);
}

class _TabsState extends State<TabPage> {

  int _currentIndex;

  _TabsState(index) {
    this._currentIndex = index;
  }

  List _pageList = [
    HomePage(),
    CartPage(),
    MinePage(),
    VipPage(),
  MessagePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        padding: EdgeInsets.all(5),
        height: 70,
        width: 70,
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: Colors.white,
        ),

        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() { //改变状态
              // this._currentIndex = 1;
            });
          },
          backgroundColor: this._currentIndex == 1 ? Color(0xFF00A862) : Color(0xFF00A862),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: this._pageList[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex,
        backgroundColor: Colors.white,
        //配置对应的索引值选中
        onTap: (int index) {
          setState(() { //改变状态
            this._currentIndex = index;
          });
        },
        iconSize: 30.0,
        //icon的大小
        fixedColor: Color(0xFF00A862),
        //选中的颜色
        type: BottomNavigationBarType.fixed,
        //配置底部tabs可以有多个按钮
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("首页")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text("福利购")
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text("")
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.message),
              title: Text("星消息")
          ),BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text("我")
          ),
        ],
      ),
    );
  }
}