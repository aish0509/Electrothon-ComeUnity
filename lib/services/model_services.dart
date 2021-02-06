import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/models/model.dart';

class ModeService {
  ModeService._();

  factory ModeService.getInstance() => _instance;
  static final ModeService _instance = ModeService._();
  Firestore _firestore = Firestore.instance;

  Future<List<Mode>> getData() async {
    try {
      List<Mode> modeList = List<Mode>();

      QuerySnapshot querySnapshot =
          await _firestore.collection('models').getDocuments();

      for (int i = 0; i < querySnapshot.documents.length; i++) {
        DocumentSnapshot documentSnapshot = querySnapshot.documents[i];
        if (documentSnapshot.data != null) {
          Mode mode = Mode(
            name: documentSnapshot.data["name"],
            url: documentSnapshot.data["url"],
          );
          modeList.add(mode);
        }
      }
      return modeList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
