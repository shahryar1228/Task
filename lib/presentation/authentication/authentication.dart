



import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:Task/app/storage.dart';

class Authentication {

  //////////////////////////////CALL VERSIONING//////////////////////////////
  Future appStarted() async {

    String? token = await getToken();
    if (token != null && token != '' ) {

    } else {

    }
  }

  Future<void> loggedOut() async {
    // Storage().token = '';
    // await _deleteUserInfo();
    await _deleteToken();
  }
  ///////////////////////////////////////////////////////////////////////////
  ////////////////////////////////USER INFO//////////////////////////////////
  // Future<void> saveUserInfo(DriverInfoModel userInfo) async {
  //   Storage().getDriverInfoByPlateResponseModel = userInfo;
  //   await Storage().secureStorage.write(key: 'UserInfo', value: jsonEncode(userInfo.toJson()));
  // }
  //
  // /// read to keystore/keychain
  // Future<DriverInfoModel?> getUserInfo() async {
  //   var userInfoStr = await Storage().secureStorage.read(key: 'UserInfo') ?? '';
  //   if (userInfoStr.isNotEmpty) {
  //     var userInfo = DriverInfoModel.fromJson(json.decode(userInfoStr));
  //     return userInfo;
  //   } else {
  //     return null;
  //   }
  // }
  //
  // /// delete from keystore/keychain
  // Future<void> _deleteUserInfo() async {
  //   await Storage().secureStorage.delete(key: 'USER_DATA');
  // }

  ///////////////////////////////////////////////////////////////////////////
  //////////////////////////////////TOKEN////////////////////////////////////
  /// write to keystore/keychain
  Future<void> _saveToken(String token) async {
    await Storage().secureStorage.write(key: 'Token', value: token);
  }

  /// read to keystore/keychain
  Future<String?> getToken() async {
    var token = await Storage().secureStorage.read(key: 'Token') ?? '';
    if (token.isNotEmpty) {
      Storage().token = token;
      return token;
    } else {
      return '';
    }
  }

  /// delete from keystore/keychain
  Future<void> _deleteToken() async {
    await Storage().secureStorage.delete(key: 'Token');
  }
  ///////////////////////////////////////////////////////////////////////////
  Future<dynamic> getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo;
    }
  }

}