class MaisonVendre{
  final String idMaisonVendre;
  final String paysMaisonVendre;
  final String localiteMaisonVendre;
  final String prixMaisonVendre;
  final String deviceMaisonVendre;
  final String surfaceMaisonVendre;
  final String suffixSurfaceMaisonVendre;
  final String garageMaisonVendre;
  final String nombreChambreMaisonVendre;
  final String anneeConstructionMaisonVendre;
  final String description;
  final String urlPhotoMaisonVendre;
MaisonVendre({
  this.idMaisonVendre,
  this.paysMaisonVendre,
  this.localiteMaisonVendre,
  this.prixMaisonVendre,
  this.deviceMaisonVendre,
  this.surfaceMaisonVendre,
  this.suffixSurfaceMaisonVendre,
  this.garageMaisonVendre,
  this.nombreChambreMaisonVendre,
  this.anneeConstructionMaisonVendre,
  this.description,
  this.urlPhotoMaisonVendre
  });
  Map<String ,dynamic> toMap(){
    return{
      'idMaison':idMaisonVendre,
      'paysMaison':paysMaisonVendre,
      'localiteMaison':localiteMaisonVendre,
      'prixMaison':prixMaisonVendre,
      'devicePrix':deviceMaisonVendre,
      'surface':surfaceMaisonVendre,
      'suffixSurface':suffixSurfaceMaisonVendre,
      'garageMaison':garageMaisonVendre,
      'nombreChambre':nombreChambreMaisonVendre,
      'anneeConstruction':anneeConstructionMaisonVendre,
      'description':description,
      'urlPhoto':urlPhotoMaisonVendre
    };
  }
 MaisonVendre.fromFirestore( Map< String ,dynamic > firestore)
 :idMaisonVendre = firestore['idMaison'],
 paysMaisonVendre = firestore['paysMaison'],
 localiteMaisonVendre = firestore['localiteMaison'],
 prixMaisonVendre = firestore['prixMaison'] ,
 deviceMaisonVendre =  firestore['devicePrix'],
 surfaceMaisonVendre = firestore['surface'],
 suffixSurfaceMaisonVendre = firestore['suffixSurface'],
 garageMaisonVendre = firestore['garageMaison'],
 nombreChambreMaisonVendre = firestore['nombreChambre'] ,
 anneeConstructionMaisonVendre =firestore['anneeConstruction'],
 description = firestore['description'],
 urlPhotoMaisonVendre = firestore['urlPhoto'];
  }