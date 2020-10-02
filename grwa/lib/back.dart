import 'package:cloud_firestore/cloud_firestore.dart';


int check(String cname, String no, String file){
  if(file == 'login'){
    FirebaseFirestore.instance.collection(cname).get().then((value) => value.docs.forEach((element) {
      var n = element['Mobile_No'];
      if(n == no)
      return 0;
    }));
  }else{
    FirebaseFirestore.instance.collection(cname).get().then((value) => value.docs.forEach((element) {
    if(element.id == no)
    return 0;
  }));
  }
  return 1;  
}

