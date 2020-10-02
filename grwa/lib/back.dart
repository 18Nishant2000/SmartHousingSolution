import 'package:cloud_firestore/cloud_firestore.dart';


int check(String cname, String hno){
    FirebaseFirestore.instance.collection(cname).get().then((value) => value.docs.forEach((element) {
    if(element.id == hno)
    return 0;
  }));
  return 1;  
}

