// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class MessageList extends StatelessWidget {
//   MessageList({Key? key, required User user})
//       : _user = user,
//         super(key: key);

//   final User _user;

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: Message.readItems(),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return Text('Something went wrong');
//         } else if (snapshot.hasData || snapshot.data != null) {
//           return ListView.builder(
//             itemCount: snapshot.data!.docs.length,
//             itemBuilder: (context, index) {
//               var messageInfo = snapshot.data!.docs[index];
//               String docID = messageInfo.id;
//               String title = messageInfo.get('title');
//               String company = messageInfo.get('company');
//               String description = messageInfo.get('description');
//               String receiver = messageInfo.get('receiver');

//               if(receiver == _user.uid)
//                 return Column(
//                   children: [
//                   ],
//                 );
//               else
//                 return SizedBox();
//             },
//           );
//         }

//         return Center(
//           child: CircularProgressIndicator(
//             valueColor: AlwaysStoppedAnimation<Color>(
//               Colors.orange,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
