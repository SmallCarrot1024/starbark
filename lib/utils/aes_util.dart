import 'dart:convert' as convert;
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter_aes_ecb_pkcs5/flutter_aes_ecb_pkcs5.dart';
import 'package:starbark/utils/string_util.dart';

class AESUtil {
  static const String TAG = "AES";

  static const String ENCODE = "UTF-8";

  static const String FORMAT = "AES";

  static const String FORMATION = "AES/ECB/PKCS5Padding";

  static const String AES_KEY =
      "af3981c85a0c094ffc66cacafaee7038bd2b3e31e00de92242ff5083c2edb98a";
  static const String MD5KEY_DEV = "wallet";
  static const String CODE = "WALLET1001";

  ///拿到用户输入的json数据 ，对json数据进行AES256加密 得到body值
  ///body + "&" + md5Key 进行MD5加密 得到sign值
  ///把code sign body 拼接成json字符串 返回给用户
  static  Future<Map> walletEncode(String json) async {
    String body = await FlutterAesEcbPkcs5.encryptString(json, AES_KEY);

    String sign = body + "&" + MD5KEY_DEV;

    String signText = md5.convert(utf8.encode(sign)).toString().toUpperCase();

    Map<String, dynamic> queryParameters = Map();

    queryParameters = {"code": CODE, "sign": signText, "body": body};

    return queryParameters;
  }

 static Future<String> walletDecode(String result, sign) async{
   String tempSign = md5.convert(utf8.encode(result + "&" + MD5KEY_DEV)).toString().toUpperCase();
   if(!StringUtils.isNullOrEmpty(tempSign) && tempSign == sign){
     //解密
     var decryptString =  await FlutterAesEcbPkcs5.decryptString(sign, AES_KEY);

     return decryptString;
   }

 }


}
