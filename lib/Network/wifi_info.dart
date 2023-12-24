import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:network_info_plus/network_info_plus.dart';

class Winfo {
  final info = NetworkInfo();
  late final StreamSubscription<ConnectivityResult> subscription;

  Winfo() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      //change connectivity
      print(result.name);

      getWifiBSSID();
      getWifiName();
    });
  }

  Future<String?> getWifiName() async {
    print(await info.getWifiName());
    return await info.getWifiName();
  }

  Future<String?> getWifiBSSID() async {
    print(await info.getWifiBSSID());
    return await info.getWifiBSSID();
  }

  dispose() {
    subscription.cancel();
  }
}
