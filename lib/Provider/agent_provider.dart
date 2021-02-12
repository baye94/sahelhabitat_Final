import 'package:flutter/material.dart';
class AgentProvider extends ChangeNotifier {
  String _idAgent;
  String _nomCompletAgent ;
  String _telephoneAgent;
  String _paysAgent;
  //Getters
  String get nomA => _nomCompletAgent ;
  String get telephoneA => _telephoneAgent ;
  String get paysA => _paysAgent;
  //Setteurs
  changeNomAgent(String value){
    _nomCompletAgent = value ;
    notifyListeners();
  }
  changeTelephoneAgent(String value){
    _telephoneAgent = value ;
    notifyListeners();
  }
  changePaysAgent(String value){
    _paysAgent = value ;
    notifyListeners();
  }
}