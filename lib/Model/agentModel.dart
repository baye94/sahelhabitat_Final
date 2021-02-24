
class AgentModel {
  final String idAgent;
  final String nomCompletAgent ;
  final String telephoneAgent;
  final String paysAgent;
  final String urlPhotoAgant;
  final String emailAgent;

  AgentModel({ this.idAgent,this.nomCompletAgent , this.telephoneAgent , this.paysAgent, this.urlPhotoAgant , this.emailAgent});
  
  Map<String , dynamic> toMap(){
    return{
      'AgentId':idAgent ,
      'NomComplet' : nomCompletAgent,
      'Telephone':telephoneAgent,
      'Pays':paysAgent,
      'Url_photo': urlPhotoAgant,
      'Email':emailAgent

    };
   }
   
   AgentModel.fromFirestore( Map<String ,dynamic > firestore)
     : idAgent = firestore['AgentId'],
        nomCompletAgent= firestore['NomComplet'],
        telephoneAgent = firestore['Telephone'],
        urlPhotoAgant= firestore['Url_photo'],
        paysAgent = firestore['Pays'],
        emailAgent = firestore['Email'];
  
} 