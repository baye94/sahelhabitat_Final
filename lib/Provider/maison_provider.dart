import 'package:flutter/material.dart';
import 'package:sahelhabitat/Service/serviceFirebase.dart';
import 'package:uuid/uuid.dart';
class MaisonVendreProvider extends ChangeNotifier {
   String _idMaisonVendre;
   String _paysMaisonVendre;
   String _localiteMaisonVendre;
   double _prixMaisonVendre;
   String _deviceMaisonVendre;
   int _surfaceMaisonVendre;
   String _suffixSurfaceMaisonVendre;
   int _garageMaisonVendre;
   int _nombreChambreMaisonVendre;
   int _anneeConstructionMaisonVendre;
   String _description;
    var uuid = Uuid();
   final firebaseservice = ServiceFirebase();
   //Getters
   String get idMV =>_idMaisonVendre;
   String get paysMV => _paysMaisonVendre;
   String get localiteMV => _localiteMaisonVendre;
   double get prixMV => _prixMaisonVendre;
   String get deviceMV => _deviceMaisonVendre;
   int    get surfaceMV => _surfaceMaisonVendre;
   String get suffixeMV => _suffixSurfaceMaisonVendre;
   int    get garageMV =>_garageMaisonVendre;
   int    get nombreChambreMV => _nombreChambreMaisonVendre;
   int    get anneeConsMV  => _anneeConstructionMaisonVendre;
   String get description => _description;
  //SETTERS
  changePaysMainsonV(String value){
    _paysMaisonVendre = value;
    notifyListeners();
  }
  changeLocaliteMaisonV(String value){
    _localiteMaisonVendre= value;
    notifyListeners();
  }
  changePrixMaisonV(double value){
    _prixMaisonVendre = value ;
    notifyListeners();
  }
  changeDeviceMaisonV(String value){
    _deviceMaisonVendre = value;
    notifyListeners();
  }
  changeSurfaceMaisonV(int value){
    _surfaceMaisonVendre =value;
    notifyListeners()
    ;
  }
  changeSuffixeSurfaceMaisonV(String value){
    _suffixSurfaceMaisonVendre = value;
    notifyListeners();
  }
  changeGarageMaisonV(int value){
    _garageMaisonVendre = value;
    notifyListeners();
  }
  changeNombreChambreMaison(int value){
    _nombreChambreMaisonVendre =value;
    notifyListeners();
  }
  changeAnneContructionMaisonV(int value){
    _anneeConstructionMaisonVendre =value ;
    notifyListeners();
  }
  changeDescriptionMaisonV(String value){
    _description =value;
    notifyListeners();
  }
  
}