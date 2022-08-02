import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tete_a_tete/widgets/Chat/messages.dart';
import 'package:tete_a_tete/widgets/Chat/new_message.dart';

class ChatScreen extends StatelessWidget {
  // const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tête-à-Tête'),
        actions: [
          DropdownButton(
            dropdownColor: Theme.of(context).accentColor,
            items: [
              DropdownMenuItem(
                child: Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.exit_to_app,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('LogOut')
                    ],
                  ),
                ),
                value: 'logout',
              ),
            ],
            onChanged: (option) {
              if (option == 'logout') {
                FirebaseAuth.instance.signOut();
              }
            },
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryIconTheme.color,
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [Expanded(child: Messages()), NewMessage()],
        ),
      ),
    );
  }
}
