
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:starbark/data/data_manager.dart';
import 'package:starbark/net/HttpClient.dart';
import 'package:starbark/utils/log_util.dart';
///

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Text('东航钱包',
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),
      body: Container(
        child: GestureDetector(
          child: Text('POST请求'),
          onTap: (){
            var queryMap =  {"status":"0"};
            var userInfo = dataManager.getUserInfo(queryMap, context);
            LogUtil.d("MinePage", userInfo);
          },
        ),
      )
    );

  }



}
