import 'package:firebase_auth/firebase_auth.dart';
import 'package:messagingapp/classes/user.dart';

class AuthProcess{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userInfo(FirebaseUser user){
    return user != null ? User(user.uid) : null;
  }

  Stream<User> get user{
    return _auth.onAuthStateChanged.map(_userInfo);
  }

  Future signInAnonnymous() async{
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userInfo(user) ;
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signInEmailAndPassword(String email, String password) async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userInfo(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  Future registerEmailAndPassword(String email, String password) async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userInfo(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signOut() async{
    try{
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

}