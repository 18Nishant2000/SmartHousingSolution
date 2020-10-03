import 'package:cloud_firestore/cloud_firestore.dart';


check(String cname, String hno) async{
    var doc = await FirebaseFirestore.instance.collection(cname).doc(hno).get();
    return doc.exists;
}

