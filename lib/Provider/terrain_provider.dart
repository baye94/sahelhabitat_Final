import 'package:flutter/material.dart';
import 'package:sahelhabitat/Model/terrainModel.dart';
import 'package:sahelhabitat/Service/serviceFirebase.dart';
import 'package:uuid/uuid.dart';
class TerrainProvider extends ChangeNotifier{
   String _idTerrain;
   String _localiteTerrain; 
   double _surface;
   String _suffixeSurface;
   double _prixTerrain;
   String _devicePrixTerrain;
   String _descriptionTerrain; 
   String _urlPhotoTerrain;
   var uuid = Uuid();
   final firebaseservice = ServiceFirebase();
   //Getters
   String get idT =>_idTerrain;
   String get localiteT => _localiteTerrain;
   double get surfaceT => _surface;
   String get sufficesurfaceT => _suffixeSurface;
   double get prixT => _prixTerrain;
   String get devicePrixT => _devicePrixTerrain;
   String get descriptionT => _descriptionTerrain;
   String get urlPhotoT => _urlPhotoTerrain;
   //SETTERS
   changeLocaliteTerrain(String value){
     _localiteTerrain =value;
      notifyListeners();
      }
    changeSurface(double value){
      _surface =value;
      notifyListeners();
    }
    changeSuffixeSurface(String value){
      _suffixeSurface = value ;
      notifyListeners();
    }
    changePrixTerrain(double value){
      _prixTerrain = value;
       notifyListeners();
    }
    changeDevicePrixTerrain(String value){
      _devicePrixTerrain = value;
      notifyListeners();
    }
    changeDescription( String value){
      _descriptionTerrain = value;
      notifyListeners();
    }
    changeUrlPhoto(String value){
      _urlPhotoTerrain = value ;
      notifyListeners();
    }
    saveTerrain(){
    
      if(idT == null){
        var newTerrain = TerrainModel(
          idTerrain: uuid.v4(),
          localiteTerrain: localiteT,
          prixTerrain: prixT,
          devicePrixTerrain: devicePrixT,
          descriptionTerrain: descriptionT,
          urlPhotoTerrain: urlPhotoT,
          surface: surfaceT,
          suffixeSurface: sufficesurfaceT,);
        firebaseservice.saveTerrain(newTerrain);
        
      }else{
         var updateTerrain = TerrainModel(
          idTerrain:_idTerrain,
          localiteTerrain:_localiteTerrain,
          prixTerrain:_prixTerrain,
          devicePrixTerrain:_devicePrixTerrain,
          descriptionTerrain: _descriptionTerrain,
          urlPhotoTerrain: _urlPhotoTerrain,
          surface:_surface,
          suffixeSurface: _suffixeSurface,);
        firebaseservice.saveTerrain(updateTerrain);

      }
    }
    removeTerrain(String idTerrain){
    firebaseservice.removeTerrain(idTerrain);
  }
  loadValues(TerrainModel terrainModel){
    _idTerrain = terrainModel.idTerrain;
    _localiteTerrain =terrainModel.localiteTerrain;
    _prixTerrain = terrainModel.prixTerrain;
    _devicePrixTerrain = terrainModel.devicePrixTerrain;
    _descriptionTerrain = terrainModel.descriptionTerrain;
    _urlPhotoTerrain =terrainModel.urlPhotoTerrain;
    _surface = terrainModel.surface;
    _suffixeSurface = terrainModel.suffixeSurface;
    
  }

}