import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class CheckConnect {
  late bool isConnect;

  Future<bool> isInetConnect() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      isConnect = true;
    } else {
      isConnect = false;
    }
    return isConnect;
  }
}
