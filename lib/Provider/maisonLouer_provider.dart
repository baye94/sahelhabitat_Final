import 'package:flutter/material.dart';
import 'package:sahelhabitat/Model/maisonLouer.dart';
import 'package:sahelhabitat/Service/serviceFirebase.dart';
import 'package:uuid/uuid.dart';

class MaisonLouerProvider extends ChangeNotifier{
    String _idMaisonLouer;
   String _paysMaisonLouer;
   String _localiteMaisonLouer;
   double _prixMaisonLouer;
   String _deviceMaisonLouer;
   int _surfaceMaisonLouer;
   String _suffixSurfaceMaisonLouer;
   int _garageMaisonLouer;
   int _nombreChambreMaisonLouer;
   int _anneeConstructionMaisonLouer;
   String _description;
   String _typeLouer;
   String _urlPhotoMaisonLouer;
    var uuid = Uuid();
   final firebaseservice = ServiceFirebase();
   //Getters
   String get idML =>_idMaisonLouer;
   String get paysML => _paysMaisonLouer;
   String get localiteML => _localiteMaisonLouer;
   double get prixML => _prixMaisonLouer;
   String get deviceML => _deviceMaisonLouer;
   int    get surfaceML => _surfaceMaisonLouer;
   String get suffixeML => _suffixSurfaceMaisonLouer;
   int    get garageML =>_garageMaisonLouer;
   int    get nombreChambreML => _nombreChambreMaisonLouer;
   int    get anneeConsML  => _anneeConstructionMaisonLouer;
   String get descriptionML => _description;
   String get typeLouerML =>  _typeLouer;
   String get urlPhotoML => _urlPhotoMaisonLouer;
    //SETTERS
  changePaysMainsonL(String value){
    _paysMaisonLouer = value;
    notifyListeners();
  }
  changeLocaliteMaisonL(String value){
    _localiteMaisonLouer= value;
    notifyListeners();
  }
  changePrixMaisonL(double value){
    _prixMaisonLouer = value ;
    notifyListeners();
  }
  changeDeviceMaisonL(String value){
    _deviceMaisonLouer= value;
    notifyListeners();
  }
  changeSurfaceMaisonL(int value){
    _surfaceMaisonLouer =value;
    notifyListeners()
    ;
  }
  changeSuffixeSurfaceMaisonL(String value){
    _suffixSurfaceMaisonLouer= value;
    notifyListeners();
  }
  changeGarageMaisonL(int value){
    _garageMaisonLouer= value;
    notifyListeners();
  }
  changeNombreChambreMaisonL(int value){
    _nombreChambreMaisonLouer =value;
    notifyListeners();
  }
  changeAnneContructionMaisonL(int value){
    _anneeConstructionMaisonLouer=value ;
    notifyListeners();
  }
  changeDescriptionMaisonL(String value){
    _description =value;
    notifyListeners();
  }
  changeTypeLocationML(String value){
    _typeLouer =value;
    notifyListeners();
  }
  changeUrlPhotoMaisonL(String value){
    _urlPhotoMaisonLouer = value;
    notifyListeners();
  }
   saveTerrain(){
    if(_idMaisonLouer == null){
        var newMaison = MaisonLouer(
      idMaisonLouer:uuid.v4(),
      paysMaisonLouer :paysML,
      localiteMaisonLouer:localiteML,
      prixMaisonLouer :prixML,
      deviceMaisonLouer :deviceML,
      surfaceMaisonLouer:surfaceML,
      suffixSurfaceMaisonLouer: suffixeML ,
      garageMaisonLouer :garageML,
      nombreChambreMaisonLouer:nombreChambreML ,
      anneeConstructionMaisonLouer :anneeConsML,
      description :descriptionML,
      typeLouer: typeLouerML,
      urlPhotoMaisonLouer: urlPhotoML
      
      );
        firebaseservice.saveLouer(newMaison);
        
      }else{
         var updateMaison = MaisonLouer(
      idMaisonLouer:_idMaisonLouer,
      paysMaisonLouer :_paysMaisonLouer,
      localiteMaisonLouer :_localiteMaisonLouer ,
      prixMaisonLouer :_prixMaisonLouer,
      deviceMaisonLouer :_deviceMaisonLouer,
      surfaceMaisonLouer:_surfaceMaisonLouer,
      suffixSurfaceMaisonLouer: _suffixSurfaceMaisonLouer,
      garageMaisonLouer :_garageMaisonLouer,
      nombreChambreMaisonLouer:_nombreChambreMaisonLouer ,
      anneeConstructionMaisonLouer :_anneeConstructionMaisonLouer,
      description :_description,
      typeLouer: _typeLouer,
      urlPhotoMaisonLouer: _urlPhotoMaisonLouer
      );
      firebaseservice.saveLouer(updateMaison);
       }
    }
    removeMaison(String idMaison){
    firebaseservice.removeMaisonLouer(idMaison);
  }
   loadValues(MaisonLouer maisonLouer){
   _idMaisonLouer = maisonLouer.idMaisonLouer;
  _paysMaisonLouer = maisonLouer.paysMaisonLouer;
  _localiteMaisonLouer = maisonLouer.localiteMaisonLouer;
  _prixMaisonLouer = maisonLouer.prixMaisonLouer;
  _deviceMaisonLouer = maisonLouer.deviceMaisonLouer;
  _surfaceMaisonLouer = maisonLouer.surfaceMaisonLouer;
  _suffixSurfaceMaisonLouer = maisonLouer.suffixSurfaceMaisonLouer;
  _garageMaisonLouer = maisonLouer.garageMaisonLouer;
  _nombreChambreMaisonLouer = maisonLouer.nombreChambreMaisonLouer;
  _anneeConstructionMaisonLouer = maisonLouer.anneeConstructionMaisonLouer;
  _description = maisonLouer.description;
  _typeLouer = maisonLouer.typeLouer;
   }
}