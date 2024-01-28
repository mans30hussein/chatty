import 'package:chatty/models/messagesModel.dart';
import 'package:chatty/presentaion/screens/logIn.dart';
import 'package:chatty/presentaion/widgets/FirebaseAuth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../const/constants.dart';
import '../widgets/customChat.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  ////////////////////////////// Declare Varaible ////////////////////////////////////////////
  static String id = 'HomeScreen';

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollections);

  TextEditingController controller = TextEditingController();

  final __controller = ScrollController();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  
  @override
  ///////////////////////////// build context ////////////////////////////////////////////////////////
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;

    /////////////////////////// Stream Builder ////////////////////////////////////
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
            ///////////////////////////// Scaffold //////////////////////////////////////////
            return Scaffold(
              key: scaffoldKey,
              //////////////////////////// App Bar /////////////////////////////////////////////
              appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 103, 116, 128),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/scholar.png',
                      height: 50,
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
              ///////////////////////// Drawer ////////////////////////////////////////////
              drawer: Drawer(
                // backgroundColor: Colors.red,

                child: Column(
                  children: [
                    UserAccountsDrawerHeader(
                      accountName: Text("Mohamed Hussein"),
                      accountEmail: Text('mohamedhusseinmans@gmail.com'),
                      currentAccountPicture: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Image.asset(
                          kLogo,
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text("Home Page"),
                      leading: Icon(Icons.home),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text("personal Information"),
                      leading: Icon(Icons.person),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text("help"),
                      leading: Icon(Icons.help),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text("About"),
                      leading: Icon(Icons.abc_outlined),
                      onTap: () {},
                    ),
                    Spacer(),
                    ListTile(
                      title: Text("Log out"),
                      leading: Icon(Icons.exit_to_app),
                      onTap: () {},
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
              ///////////////////////////// List View Builder ///////////////////////////////////////
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        reverse: true,
                        controller: __controller,
                        itemCount: messageList.length,
                        itemBuilder: (BuildContext context, int index) {
                          // print(messageList[index].id);
                          return messageList[index].id == email
                              ? CustomChat(message: messageList[index])
                              : CustomChatFriend(message: messageList[index]);
                        }),
                  ),
                  ///////////////////////// Text Field /////////////////////////////////////
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: controller,
                      onSubmitted: (data) {
                        messages.add({
                          kMessage: data,
                          kCreatedAt: DateTime.now(),
                          Kid: email,
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
                            color: kPrimaryColor,
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
