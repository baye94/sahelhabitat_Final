class MaisonLouer{
  final String idMaisonLouer;
  final String paysMaisonLouer;
  final String localiteMaisonLouer;
  final double prixMaisonLouer;
  final String deviceMaisonLouer;
  final int surfaceMaisonLouer;
  final String suffixSurfaceMaisonLouer;
  final int garageMaisonLouer;
  final int nombreChambreMaisonLouer;
  final int anneeConstructionMaisonLouer;
  final String description;
  final String typeLouer;
  MaisonLouer({
  this.idMaisonLouer,
  this.paysMaisonLouer,
  this.localiteMaisonLouer,
  this.prixMaisonLouer,
  this.deviceMaisonLouer,
  this.surfaceMaisonLouer,
  this.suffixSurfaceMaisonLouer,
  this.garageMaisonLouer,
  this.nombreChambreMaisonLouer,
  this.anneeConstructionMaisonLouer,
  this.description,
  this.typeLouer,
  });
   Map<String ,dynamic> toMap(){
    return{
      'idMaison':idMaisonLouer,
      'paysMaison':paysMaisonLouer,
      'localiteMaison':localiteMaisonLouer,
      'prixMaison':prixMaisonLouer,
      'devicePrix':deviceMaisonLouer,
      'surface':surfaceMaisonLouer,
      'suffixSurface':suffixSurfaceMaisonLouer,
      'garageMaison':garageMaisonLouer,
      'nombreChambre':nombreChambreMaisonLouer,
      'anneeConstruction':anneeConstructionMaisonLouer,
      'description':description,
      'typeLocation':typeLouer
    };
  }
   MaisonLouer.fromFirestore( Map<String ,dynamic > firestore)
 :idMaisonLouer =firestore['idMaison'],
 paysMaisonLouer = firestore['paysMaison'],
 localiteMaisonLouer = firestore['localiteMaison'],
 prixMaisonLouer = firestore['prixMaison'],
 deviceMaisonLouer = firestore['devicePrix'],
 surfaceMaisonLouer = firestore['surface'],
 suffixSurfaceMaisonLouer = firestore['suffixSurface'],
 garageMaisonLouer = firestore['garageMaison'],
 nombreChambreMaisonLouer = firestore['nombreChambre'],
 anneeConstructionMaisonLouer = firestore['anneeConstruction'],
 description =firestore['description'],
 typeLouer = firestore['typeLocation'];
}