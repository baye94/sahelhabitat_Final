

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sahelhabitat/Model/agentModel.dart';
import 'package:sahelhabitat/Model/maisonLouer.dart';
import 'package:sahelhabitat/Model/maisonVendre.dart';
import 'package:sahelhabitat/Model/terrainModel.dart';


class ServiceFirebase {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore _db = FirebaseFirestore.instance;
 
 Future<void> saveUsers( String  email , String password ) {
   return  auth.createUserWithEmailAndPassword(email: email, password: password);
   }
  Future<void>singin(String email , String password){
   return  auth.signInWithEmailAndPassword(email: email, password: password);
  }
  // gestion agents
  Future<void>saveAgent(AgentModel agentModel){
     return _db.collection('Agent').doc(agentModel.idAgent).set(agentModel.toMap(),);
  }
   
   Stream<List<AgentModel>> getAgents(){
    return _db.collection('Agent').snapshots().map((snapshot) => snapshot.docs.map((document) => AgentModel.fromFirestore(document.data())).toList());

  }
   Future<void> removeAgent(String agentId){
    return _db.collection('Agent').doc(agentId).delete();
  }
  //gestion terrain
  Future<void> saveTerrain(TerrainModel terrainModel){
    return _db.collection('Terrain').doc(terrainModel.idTerrain).set(terrainModel.toMap());
  }
  Stream<List<TerrainModel>> getTerrain(){
    return _db.collection('Terrain').snapshots().map((snapshots) => snapshots.docs.map((document) => TerrainModel.fromFirestore(document.data())).toList());
  }
  Future<void> removeTerrain(String idTerrain){
    return _db.collection('Terrain').doc(idTerrain).delete();
  }
  //gestion maison a vendre
   Future<void> saveMaison(MaisonVendre maisonVendre){
    return _db.collection('Vendre').doc(maisonVendre.idMaisonVendre).set(maisonVendre.toMap());
  }
  Stream<List<MaisonVendre>> getMaisonVendre(){
    return _db.collection('Vendre').snapshots().map((snapshots) => snapshots.docs.map((document) => MaisonVendre.fromFirestore(document.data())).toList());
  }
  Future<void> removeMaisonVendre(String idTerrain){
    return _db.collection('Vendre').doc(idTerrain).delete();
  }
  //gestion maison a Louer
   Future<void> saveLouer(MaisonLouer maisonLouer){
    return _db.collection('Louer').doc(maisonLouer.idMaisonLouer).set(maisonLouer.toMap());
  }
  Stream<List<MaisonLouer>> getMaisonLouer(){
    return _db.collection('Louer').snapshots().map((snapshots) => snapshots.docs.map((document) => MaisonLouer.fromFirestore(document.data())).toList());
  }
  Future<void> removeMaisonLouer(String idMaison){
    return _db.collection('Louer').doc(idMaison).delete();
  }
}