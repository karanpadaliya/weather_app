import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class CheckInternetProvider extends ChangeNotifier {
  ConnectivityResult connectivityResult = ConnectivityResult.none;

  void CheckingConnection() {
    Connectivity().onConnectivityChanged.listen((event) {
      connectivityResult = event;
      notifyListeners();
    });
  }
}