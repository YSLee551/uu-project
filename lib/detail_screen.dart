import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uu_project/theme/colors.dart';

class DetailScreen extends StatefulWidget {
  final String documentId;
  final User _user;

  const DetailScreen({Key? key, required User user, required String documentId})
      : _user = user,
        documentId = documentId,
        super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late User _user;
  @override
  void initState() {
    _user = widget._user;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('hr_list')
            .doc(widget.documentId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          } else if (snapshot.hasData || snapshot.data != null) {
            var noteInfo = snapshot.data;
            String docID = widget.documentId;
            String title = noteInfo?.get('title');
            String description = noteInfo?.get('description');
            String city = noteInfo?.get('city');
            String writer = noteInfo?.get('writer');
            return Scaffold(
              backgroundColor: Colors.indigo,
              appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.indigo,
                  title: Text("인재 정보"),
                  centerTitle: true,
                  actions: [
                    if (_user.uid == writer)
                      IconButton(
                          onPressed: () {
                            print("Edit Button -> Edit Screen");
                          },
                          icon: Icon(Icons.edit)),
                  ]),
            );
          }
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(accent),
            ),
          );
        });
  }
}
