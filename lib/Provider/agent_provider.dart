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
   final firebaseservice = ServiceFirebase();
  //Getters
  String get idA => _idAgent;
  String get nomA => _nomCompletAgent ;
  String get telephoneA => _telephoneAgent ;
  String get paysA => _paysAgent;
  String get urlPhotoAgentA => _urlPhotoAgent;
  String get emailAgentA => _emailAgent;
  
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
  // Save fonction permet de faire une mise a jours un ajout de nouvelles donnees dans la base de donnee firestore cloud

  saveAgent(){
   // save data in firestore cloud
   print('bonjours $_idAgent');
   print('n a fait un ajout de nouveau agent');
   if(idA == null){
    var newagentModel = AgentModel(
     idAgent:uuid.v4(),
     nomCompletAgent:nomA , 
     telephoneAgent: telephoneA,
     paysAgent: paysA,
     urlPhotoAgant: urlPhotoAgentA,
     emailAgent: emailAgentA
     );
    firebaseservice.saveAgent(newagentModel);
    }
    //update data from firestore cloud
    else{
      print('n a fait une mise jours');
      var updateAgent = AgentModel(
     idAgent: _idAgent,
     nomCompletAgent:_nomCompletAgent , 
     telephoneAgent: _telephoneAgent,
     paysAgent: _paysAgent,
     urlPhotoAgant: _urlPhotoAgent,
     emailAgent: _emailAgent
     );
     firebaseservice.saveAgent(updateAgent);

    }
    }
    updateAgent(){
       var updateAgent = AgentModel(
     idAgent: _idAgent,
     nomCompletAgent:_nomCompletAgent , 
     telephoneAgent: _telephoneAgent,
     paysAgent: _paysAgent,
     urlPhotoAgant: _urlPhotoAgent,
     emailAgent: _emailAgent
     );
     firebaseservice.updateAgent(updateAgent);
      
    }
  loadValues(AgentModel agentModel){
    _idAgent =agentModel.idAgent;
    _nomCompletAgent = agentModel.nomCompletAgent;
    _emailAgent = agentModel.emailAgent;
    _telephoneAgent = agentModel.telephoneAgent ;
    _paysAgent = agentModel.paysAgent;
    _urlPhotoAgent = agentModel.urlPhotoAgant;
    
  }
  testfunction(){
    print('id$idA');
    print('nom $_nomCompletAgent');
      print('email$_emailAgent');
        print('telephone $_telephoneAgent');
          print('pays $_paysAgent');
            print('nom $_urlPhotoAgent');
  }
}