import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

final app = Firebase.initializeApp();

authStatus(){
  var user = FirebaseAuth.instance.currentUser;
  if(user != null)
  return 0;
  else
  return 1;
}