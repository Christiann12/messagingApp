import 'package:firebase_auth/firebase_auth.dart';
import 'package:messagingapp/classes/user.dart';
import 'package:messagingapp/process/databaseProcess.dart';

class AuthProcess{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userInfo(FirebaseUser user){
    return user != null ? User(user.uid) : null;
  }

  Stream<User> get user{
    return _auth.onAuthStateChanged.map(_userInfo);
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

  Future registerEmailAndPassword(String email, String password, String firstName, String lastName, String birthDay, String gender) async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      await DatabaseProcess(user.uid).updateUserData(firstName,lastName,birthDay,gender);

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