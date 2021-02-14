import 'dart:io';

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
}