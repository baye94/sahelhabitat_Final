 class TerrainModel{
  final String idTerrain;
  final String localiteTerrain; 
  final double surface;
  final String suffixeSurface;
  final double prixTerrain;
  final String devicePrixTerrain;
  final String descriptionTerrain; 
  final String urlPhotoTerrain;
  TerrainModel({this.idTerrain,this.localiteTerrain,this.prixTerrain,this.devicePrixTerrain,this.descriptionTerrain,this.urlPhotoTerrain,this.surface,this.suffixeSurface});
 Map<String ,dynamic> toMap(){
   return{
     'idTerrain':idTerrain,
     'localite':localiteTerrain,
     'prix':prixTerrain,
     'device':devicePrixTerrain,
     'descriptionTerrain':descriptionTerrain,
     'urlPhoto':urlPhotoTerrain,
     'surface':surface,
    'suffixeSurface':suffixeSurface,
   };
  
 }
  TerrainModel.fromFirestore( Map<String ,dynamic > firestore)
         :idTerrain = firestore['idTerrain'],
         localiteTerrain = firestore['localite'],
         prixTerrain =firestore['prix'],
         devicePrixTerrain = firestore['device'],
         descriptionTerrain = firestore['descriptionTerrain'],
         urlPhotoTerrain = firestore['urlPhoto'],
         surface = firestore['surface'],
         suffixeSurface = firestore['suffixeSurface'];
}