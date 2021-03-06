import 'package:flutter/material.dart';
import 'package:sahelhabitat/Model/maisonVendre.dart';
import 'package:sahelhabitat/Service/serviceFirebase.dart';
import 'package:uuid/uuid.dart';
class MaisonVendreProvider extends ChangeNotifier {
   String _idMaisonVendre;
   String _paysMaisonVendre;
   String _localiteMaisonVendre;
   String _prixMaisonVendre;
   String _deviceMaisonVendre;
   String _surfaceMaisonVendre;
   String _suffixSurfaceMaisonVendre;
   String _garageMaisonVendre;
   String _nombreChambreMaisonVendre;
   String _anneeConstructionMaisonVendre;
   String _description;
   String _urlPhotoMaisonVendre;
   String _nombreSalleBains;
    var uuid = Uuid();
   final firebaseservice = ServiceFirebase();
   //Getters
   String get idMV =>_idMaisonVendre;
   String get paysMV => _paysMaisonVendre;
   String get localiteMV => _localiteMaisonVendre;
   String get prixMV => _prixMaisonVendre;
   String get deviceMV => _deviceMaisonVendre;
   String get surfaceMV => _surfaceMaisonVendre;
   String get suffixeMV => _suffixSurfaceMaisonVendre;
   String get garageMV =>_garageMaisonVendre;
   String get nombreChambreMV => _nombreChambreMaisonVendre;
   String get anneeConsMV  => _anneeConstructionMaisonVendre;
   String get description => _description;
   String get urlPhotoMV => _urlPhotoMaisonVendre;
   String get nombreSalleBainsMV => _nombreSalleBains;
  //SETTERS
  changePaysMainsonV(String value){
    _paysMaisonVendre = value;
    notifyListeners();
  }
  changeLocaliteMaisonV(String value){
    _localiteMaisonVendre= value;
    notifyListeners();
  }
  changePrixMaisonV(String  value){
    _prixMaisonVendre = value ;
    notifyListeners();
  }
  changeDeviceMaisonV(String value){
    _deviceMaisonVendre = value;
    notifyListeners();
  }
  changeSurfaceMaisonV(String  value){
    _surfaceMaisonVendre =value;
    notifyListeners()
    ;
  }
  changeSuffixeSurfaceMaisonV(String value){
    _suffixSurfaceMaisonVendre = value;
    notifyListeners();
  }
  changeGarageMaisonV(String  value){
    _garageMaisonVendre = value;
    notifyListeners();
  }
  changeNombreChambreMaison(String  value){
    _nombreChambreMaisonVendre =value;
    notifyListeners();
  }
  changeAnneContructionMaisonV(String  value){
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
  changeNombreSalleBainsV(String value){
    _nombreSalleBains = value;
    notifyListeners();
  }
  saveMaisonVendre(){
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
      urlPhotoMaisonVendre: urlPhotoMV,
      nombreSalleBains: nombreSalleBainsMV,
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
      urlPhotoMaisonVendre: _urlPhotoMaisonVendre,
      nombreSalleBains: _nombreSalleBains);
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
  _nombreSalleBains = maisonVendre.nombreSalleBains;
   }
}