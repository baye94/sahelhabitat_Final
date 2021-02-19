

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sahelhabitat/Model/agentModel.dart';


class ServiceFirebase {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore _db = FirebaseFirestore.instance;
 
 Future<void> saveUsers( String  email , String password ) {
   return  auth.createUserWithEmailAndPassword(email: email, password: password);
   }
  Future<void>singin(String email , String password){
   return  auth.signInWithEmailAndPassword(email: email, password: password);
  }
  Future<void>saveAgent(AgentModel agentModel){
     return _db.collection('Agent').doc(agentModel.idAgent).set(agentModel.toMap(),);
  }
   Future<void>updateAgent(AgentModel agentModel){
     return _db.collection('Agent').doc(agentModel.idAgent).update(agentModel.toMapUpdate(),);
  }
   Stream<List<AgentModel>> getAgents(){
    return _db.collection('Agent').snapshots().map((snapshot) => snapshot.docs.map((document) => AgentModel.fromFirestore(document.data())).toList());

  }
}