import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _lockerCollection = _firestore.collection('lockers');
final CollectionReference _umbrellaCollection =
    _firestore.collection('umbrellas');
final CollectionReference _lostCollection = _firestore.collection('lost');

class DataBase {
  static String? userID;
  static var umbrella =
      Umbrella(umbID: '', lastReturnID: '', lastUsedID: '', password: '');

  static Future<void> getUmbInfo({required String umbId}) async {
    await _umbrellaCollection.doc(umbId).get().then((value) {
      umbrella = Umbrella(
          umbID: value.get('umbrella_id'),
          lastReturnID: value.get('last_used_id'),
          lastUsedID: value.get('last_return_id'),
          password: value.get('password'));
    });
    print(umbrella);
  }

  static Future<void> addUmbToLocker({
    required String umbId,
    required String lockerId,
  }) async {
    await _lockerCollection
        .doc(lockerId)
        .update({
          'umbs_in_locker': FieldValue.arrayUnion([umbId])
        })
        .whenComplete(() => print("Umbrella Added to Locker"))
        .catchError((e) => print(e));
  }

  static Future<void> removeUmbFromLocker({
    required String umbId,
    required String lockerId,
  }) async {
    await _lockerCollection
        .doc(lockerId)
        .update({
          'umbs_in_locker': FieldValue.arrayRemove([umbId])
        })
        .whenComplete(() => print("Umbrella Removed from Locker"))
        .catchError((e) => print(e));
  }

  // static Future<void> updateItem({
  //   required String title,
  //   required String description,
  //   required String city,
  //   required String docId,
  // }) async {
  //   DocumentReference documentReferencer =
  //   _mainCollection.doc(docId);

  //   Map<String, dynamic> data = <String, dynamic>{
  //     "title": title,
  //     "description": description,
  //     "city": city,
  //   };

  //   await documentReferencer
  //       .update(data)
  //       .whenComplete(() => print("Update Complete"))
  //       .catchError((e) => print(e));
  // }

  // static Stream<QuerySnapshot> readItems() {
  //   CollectionReference hrListCollection = _mainCollection;

  //   return hrListCollection.snapshots();
  // }

  // static Future<void> deleteItem({
  //   required String docId,
  // }) async {
  //   DocumentReference documentReferencer = _mainCollection.doc(docId);

  //   await documentReferencer
  //       .delete()
  //       .whenComplete(() => print('Note item deleted from the database'))
  //       .catchError((e) => print(e));
  // }
}

class Umbrella {
  final String umbID;
  final String lastReturnID;
  final String lastUsedID;
  final String password;

  Umbrella({
    required this.umbID,
    required this.lastReturnID,
    required this.lastUsedID,
    required this.password,
  });
}
