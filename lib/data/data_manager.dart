import 'package:flutter/cupertino.dart';
import 'package:starbark/model/UserQueryEntity.dart';
import 'package:starbark/net/HttpClient.dart';
import 'package:starbark/net/api.dart';

///数据获取管理类
DataManager dataManager = DataManager();

class DataManager {
  //私有构造函数
  DataManager._internal();

  //保存单例
  static DataManager _singleton = new DataManager._internal();

  //工厂构造函数
  //当实现一个使用 factory 关键词修饰的构造函数时，这个构造函数不必创建类的新实例。
  //当实现构造函数但是不想每次都创建该类的一个实例的时候使用
  factory DataManager() => _singleton;

  Future<String> getUserInfo(
      Map queryMap, BuildContext context) async {
      Map data = await httpManager.post(Api.CHECK_ACTIVITY,
        queryParameters: queryMap,
        isSHowLoading: true,
        context: context,
        loadingText: "正在查询...");

    return data == null ? "查询失败" :data;
  }
}
