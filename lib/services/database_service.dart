import 'package:keiko_food_reviews/helper/constants.dart';
import 'package:keiko_food_reviews/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  // User collection
  Future<bool> addUser(UserModel userModel) async {
    // Use the set() to add new user in order to assign our own uid
    var result = await FirebaseFirestore.instance
        .collection(DatabaseCollections.users.name)
        .doc(userModel.uid)
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson())
        .set(userModel, SetOptions(merge: true))
        .then((_) => true)
        .onError((error, stackTrace) => false);

    return result;
  }
  
  Future<UserModel> getUser(String uid) {
    return FirebaseFirestore.instance
        .collection('${DatabaseCollections.users.name}/$uid')
        .doc(uid)
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson())
        .get()
        .then((documentSnapshot) => documentSnapshot.data()!)
        .onError((error, stackTrace) => Future.error(error.toString()));
  }

  Future<bool> updateUser(UserModel userModel) {
    return FirebaseFirestore.instance
        .collection(DatabaseCollections.users.name)
        .doc(userModel.uid)
        .update(userModel.toJson())
        .then((_) => true)
        .onError((error, stackTrace) => false);
  }
}