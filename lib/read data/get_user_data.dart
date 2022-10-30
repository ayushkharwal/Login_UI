import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetUserData extends StatelessWidget {
  final String documentIds;

  const GetUserData({
    super.key,
    required this.documentIds,
  });

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder(
      future: users.doc(documentIds).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text(
            '${data['firstName']}' +
                ' ' +
                '${data['lastName']}' +
                ', ' +
                '${data['age']}' +
                ' years old',
            style: GoogleFonts.dosis(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
