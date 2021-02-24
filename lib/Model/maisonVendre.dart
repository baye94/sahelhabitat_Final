class MaisonVendre{
  final String idMaisonVendre;
  final String paysMaisonVendre;
  final String localiteMaisonVendre;
  final double prixMaisonVendre;
  final String deviceMaisonVendre;
  final double surfaceMaisonVendre;
  final String suffixSurfaceMaisonVendre;
  final int garageMaisonVendre;
  final int nombreChambreMaisonVendre;
  final int anneeConstructionMaisonVendre;
  final String description;
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
    };
  }
 MaisonVendre.fromFirestore( Map<String ,dynamic > firestore)
 :idMaisonVendre =firestore['idMaison'],
 paysMaisonVendre = firestore['paysMaison'],
 localiteMaisonVendre = firestore['localiteMaison'],
 prixMaisonVendre = firestore['prixMaison'],
 deviceMaisonVendre = firestore['devicePrix'],
 surfaceMaisonVendre = firestore['surface'],
 suffixSurfaceMaisonVendre = firestore['suffixSurface'],
 garageMaisonVendre = firestore['garageMaison'],
 nombreChambreMaisonVendre = firestore['nombreChambre'],
 anneeConstructionMaisonVendre = firestore['anneeConstruction'],
 description =firestore['description'];

   }