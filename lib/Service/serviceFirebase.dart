

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sahelhabitat/Model/agentModel.dart';


class ServiceFirebase {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore _db = FirebaseFirestore.instance;
 
 Future<void> SaveUsers( String  email , String password ) {
   return  auth.createUserWithEmailAndPassword(email: email, password: password);
   }
  Future<void>Singin(String email , String password){
   return  auth.signInWithEmailAndPassword(email: email, password: password);
  }
  Future<void>saveAgent(AgentModel agentModel){
     return _db.collection('Agent').doc(agentModel.nomCompletAgent).set(agentModel.toMap());
  }
   Stream<List<AgentModel>> getAgents(){
    return _db.collection('Agent').snapshots().map((snapshot) => snapshot.docs.map((document) => AgentModel.fromFirestore(document.data())).toList());

  }
}