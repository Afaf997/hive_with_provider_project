import 'package:flutter/cupertino.dart';

class MainProvider with ChangeNotifier{
   SelectedIndex _selectedIndex =SelectedIndex(index: 0);

   changeselectedIndex(int index){
    _selectedIndex =  SelectedIndex(index: index);
    notifyListeners();
   }
   SelectedIndex get selectedIndex=>_selectedIndex;
}

class SelectedIndex{
  final int index;

  SelectedIndex({required this.index});

}