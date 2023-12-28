import 'package:chatty/models/messagesModel.dart';
import 'package:chatty/presentaion/screens/logIn.dart';
import 'package:chatty/presentaion/widgets/FirebaseAuth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../const/colorConsr.dart';
import '../widgets/customChat.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key });
static String id = 'HomeScreen';
  // FirebaseFirestore fireStore = FirebaseFirestore.instance ;
  CollectionReference messages =
      FirebaseFirestore.instance.collection(MyColor.kMessagesCollections);

  TextEditingController controller = TextEditingController();
  // ignore: unused_field
  final __controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder(
        stream: messages
            .orderBy('createdAt', descending: true)
            .snapshots(), // access all documentation in collection
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            // must be check data exist or not in Future Builder
            List<Message> messageList = [];
            //print(snapshot.data!.docs[3]['name']); // type of data is AsyncSnapshot<QuerySnapshot<Object?>>
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messageList.add(Message.fromJson(snapshot.data!.docs[i]));
            }
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: const Color.fromARGB(255, 103, 116, 128),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/scholar.png',
                      height: 55,
                    ),
                    const Text(
                      "Chat app",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.of(context).pushNamed(LogIn.id);
                      },
                      icon: const Icon(
                        Icons.exit_to_app,
                        color: Colors.white,
                        size: 35,
                      ))
                ],
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        reverse: true,
                        controller: __controller,
                        itemCount: messageList.length,
                        itemBuilder: (BuildContext context, int index) {
                          // print(messageList[index].id);
                          return messageList[index].id == email ? CustomChat(
                            message: messageList[index]): 
                          CustomChatFriend(message: messageList[index]);
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: controller,
                      onSubmitted: (data) {
                        messages.add({
                          MyColor.kMessage: data,
                          MyColor.kCreatedAt: DateTime.now(),
                          MyColor.Kid:email,
                        });
                        controller.clear();
                        __controller.animateTo(0,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                      decoration: InputDecoration(
                          hintText: 'Send Message',
                          suffixIcon: const InkWell(
                              child: Icon(
                            Icons.send,
                            color: MyColor.kPrimaryColor,
                          )),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
