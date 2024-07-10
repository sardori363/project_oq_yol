import "package:flutter/cupertino.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";


AutoDisposeChangeNotifierProvider<HomeVM> homeVM = ChangeNotifierProvider.autoDispose<HomeVM>((ChangeNotifierProviderRef<HomeVM> ref) => HomeVM());

class HomeVM with ChangeNotifier {
  bool isPassengers = true;
  bool isNotificationOn = true;

  void switchToPassengers(){
    isPassengers = true;
    notifyListeners();
  }

  void switchToPostage(){
    isPassengers = false;
    notifyListeners();
  }

  void changeNotification(bool v){
    isNotificationOn = v;
    notifyListeners();
  }
}
