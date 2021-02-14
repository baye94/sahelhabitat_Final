import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sahelhabitat/Model/agentModel.dart';
import 'package:sahelhabitat/Service/serviceFirebase.dart';
import 'package:uuid/uuid.dart';
class AgentProvider extends ChangeNotifier {
  String _idAgent;
  String _nomCompletAgent ;
  String _telephoneAgent;
  String _paysAgent;
  String _urlPhotoAgent;
  String _emailAgent;
   var uuid = Uuid();
   final firebaseservice = serviceFirebase();
  //Getters
  String get nomA => _nomCompletAgent ;
  String get telephoneA => _telephoneAgent ;
  String get paysA => _paysAgent;
  String get urlPhotoAgent => _urlPhotoAgent;
  String get emailAgent => _emailAgent;
  
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
  changeUrlPhoto(String value){
    _urlPhotoAgent = value ;
    notifyListeners();
  }
  changeEmail(String value){
    _emailAgent = value ;
    notifyListeners();
  }
  saveAgent(){
   var newagentModel = AgentModel(
     idAgent:uuid.v4(),
     nomCompletAgent:nomA , 
     telephoneAgent: telephoneA,
     paysAgent: paysA,
     urlPhotoAgant: urlPhotoAgent,
     emailAgent: emailAgent
     );
   firebaseservice.saveAgent(newagentModel);
  }
}