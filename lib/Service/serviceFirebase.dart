import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sahelhabitat/Model/Users.dart';


class serviceFirebase {
  FirebaseAuth auth = FirebaseAuth.instance;
 
 Future<void> SaveUsers( String  email , String password ) {
   return  auth.createUserWithEmailAndPassword(email: email, password: password);
   }
  Future<void>Singin(String email , String password){
   return  auth.signInWithEmailAndPassword(email: email, password: password);
  }
  
}