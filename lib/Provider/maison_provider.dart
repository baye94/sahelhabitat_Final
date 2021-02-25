import 'package:flutter/material.dart';
import 'package:sahelhabitat/Model/maisonVendre.dart';
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
   String _urlPhotoMaisonVendre;
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
   String get urlPhotoMV => _urlPhotoMaisonVendre;
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
  changeUrlPhotoMaisonV(String value){
    _urlPhotoMaisonVendre = value ;
    notifyListeners();
  }
  saveTerrain(){
    if(idMV == null){
        var newMaison = MaisonVendre(
      idMaisonVendre:uuid.v4(),
      paysMaisonVendre :paysMV,
      localiteMaisonVendre :localiteMV,
      prixMaisonVendre :prixMV,
      deviceMaisonVendre :deviceMV,
      surfaceMaisonVendre:surfaceMV,
      suffixSurfaceMaisonVendre: suffixeMV ,
      garageMaisonVendre :garageMV,
      nombreChambreMaisonVendre:nombreChambreMV ,
      anneeConstructionMaisonVendre :anneeConsMV,
      description :description,
      urlPhotoMaisonVendre: urlPhotoMV
      );
        firebaseservice.saveMaison(newMaison);
        
      }else{
         var updateMaison = MaisonVendre(
      idMaisonVendre:_idMaisonVendre,
      paysMaisonVendre :_paysMaisonVendre ,
      localiteMaisonVendre :_localiteMaisonVendre ,
      prixMaisonVendre :_prixMaisonVendre,
      deviceMaisonVendre :_deviceMaisonVendre,
      surfaceMaisonVendre:_surfaceMaisonVendre,
      suffixSurfaceMaisonVendre: _suffixSurfaceMaisonVendre ,
      garageMaisonVendre :_garageMaisonVendre,
      nombreChambreMaisonVendre:_nombreChambreMaisonVendre ,
      anneeConstructionMaisonVendre :_anneeConstructionMaisonVendre,
      description :_description,
      urlPhotoMaisonVendre: _urlPhotoMaisonVendre);
      firebaseservice.saveMaison(updateMaison);
       }
    }
    removeMaison(String idMaison){
    firebaseservice.removeMaisonVendre(idMaison);
  }
   loadValues(MaisonVendre maisonVendre){
   _idMaisonVendre = maisonVendre.idMaisonVendre;
  _paysMaisonVendre = maisonVendre.paysMaisonVendre;
  _localiteMaisonVendre = maisonVendre.localiteMaisonVendre;
  _prixMaisonVendre = maisonVendre.prixMaisonVendre;
  _deviceMaisonVendre = maisonVendre.deviceMaisonVendre;
  _surfaceMaisonVendre = maisonVendre.surfaceMaisonVendre;
  _suffixSurfaceMaisonVendre = maisonVendre.suffixSurfaceMaisonVendre;
  _garageMaisonVendre = maisonVendre.garageMaisonVendre;
  _nombreChambreMaisonVendre = maisonVendre.nombreChambreMaisonVendre;
  _anneeConstructionMaisonVendre = maisonVendre.anneeConstructionMaisonVendre;
  _description = maisonVendre.description;
  _urlPhotoMaisonVendre = maisonVendre.urlPhotoMaisonVendre;
   }
}