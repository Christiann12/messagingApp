import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseProcess{

final String uid;

DatabaseProcess(this.uid);

final CollectionReference userDataCollection = Firestore.instance.collection('UserData');

void updateUserData(String firstName, String lastName, String birthDay, String gender) async{



  await userDataCollection.document(uid).setData({
    'First Name' : firstName,
    'Last Name'  : lastName,
    'Birthday'   : birthDay,
    'Gender'     : gender
  });

  await userDataCollection.document(uid).collection('UserConnectionName').document('Dummy Document').setData({
    'Dummy Data' : 'Dummy data'
  });

}

}