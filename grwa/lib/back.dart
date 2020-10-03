import 'package:cloud_firestore/cloud_firestore.dart';


check(String cname, String hno){
    FirebaseFirestore.instance.collection(cname).get().then((value) => value.docs.forEach((element) {
    if(element.id.toString() == hno)
    return 0;
  }));
  return 1;  
}

