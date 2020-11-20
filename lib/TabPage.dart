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

  var _pageController = PageController(initialPage: 0);


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // floatingActionButton: Container(
      //   padding: EdgeInsets.all(5),
      //   height: 70,
      //   width: 70,
      //   margin: EdgeInsets.only(top: 10),
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(60),
      //     color: Colors.white,
      //   ),
      //
      //   child: FloatingActionButton(
      //     child: Icon(Icons.add),
      //     onPressed: () {
      //       setState(() { //改变状态
      //         // this._currentIndex = 1;
      //       });
      //     },
      //     backgroundColor: this._currentIndex == 1 ? Color(0xFF00A862) : Color(0xFF00A862),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // body: this._pageList[this._currentIndex],
      bottomNavigationBar:
      myNavigationBar(context)
      // customNavigationBar()
    );
  }

  Widget customNavigationBar() {
    return BottomNavigationBar(
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
            icon: Icon(Icons.person),
            title: Text("我")
        ),
      ],
    );

  }

  Widget myNavigationBar(BuildContext context){
    return Scaffold(

      //      body: _pages[_currentIndex], // 只是这样写会导致在每次切换的时候 都rebuild 子控件
      body: PageView.builder(
          controller: _pageController,
          onPageChanged: _pageChanged,
          itemCount: _pageList.length,
          itemBuilder: (context, index) => _pageList[index]),

      floatingActionButton: Container(
        height: 60,
        width: 60,
        margin: EdgeInsets.only(bottom: 5),
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
      bottomNavigationBar: BottomAppBar(

        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    onTap(0);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.home, color: getColor(0)),
                      Text("首页", style: TextStyle(color: getColor(0)))
                    ],
                  )),
              GestureDetector(
                  onTap: () {
                    onTap(1);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.forum, color: getColor(1)),
                      Text("福利购", style: TextStyle(color: getColor(1)))
                    ],
                  )),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.home,
                    color: Colors.transparent,
                  ),
                  Text("")
                ],
              ),
              GestureDetector(
                  onTap: () {
                    onTap(2);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.mail, color: getColor(2)),
                      Text("星消息", style: TextStyle(color: getColor(2)))
                    ],
                  )),
              GestureDetector(
                  onTap: () {
                    onTap(3);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.person, color: getColor(3)),
                      Text("我的", style: TextStyle(color: getColor(3)))
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }


  Color getColor(int value) {
    return this._currentIndex == value ? Color(0xFF00A862) : Color(0XFFBBBBBB);
  }

  void _pageChanged(int index) {
    setState(() {
      if (_currentIndex != index) _currentIndex = index;
    });
  }

  void onTap(int index) {
//        _pageController.jumpToPage(index);
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.easeOutSine);
  }

}


