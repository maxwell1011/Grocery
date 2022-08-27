// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:first_app_with_auth/auth.dart';
import 'package:first_app_with_auth/edit_profile.dart';
import 'package:first_app_with_auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileView extends StatefulWidget {
  ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  Auth logOut = Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.teal,
          leading: Padding(
            padding: const EdgeInsets.all(15),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                )),
          ),
          title: Center(
            child: Text(
              "Profile",
              style: TextStyle(color: Colors.white),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: IconButton(
                  onPressed: () {
                    logOut.delete().then((value) {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return LoginView();
                        },
                      ));
                    });
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.white,
                  )),
            )
          ],
        ),
        body: Center(
            child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          CircleAvatar(
            backgroundImage: NetworkImage(
                "https://www.thewrap.com/wp-content/uploads/2016/10/GettyImages-547403018.jpg",
                scale: 5),
            radius: 50,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 5),
            child: Text(
              "John Doe",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Text(logOut.currentUser!.email!),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return EditProfileView();
                }));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Edit Profile",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))))),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          ListTile(
            leading: Icon(
              Icons.settings_applications,
              color: Colors.blue[200],
            ),
            title: Text("Settings",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w500)),
            trailing: IconButton(
                onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
          ),
          ListTile(
            leading: Icon(
              Icons.do_not_disturb_on_outlined,
              color: Colors.blue[200],
            ),
            title: Text("Billing Details",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w500)),
            trailing: IconButton(
                onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: Colors.blue[200],
            ),
            title: Text("User Management",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w500)),
            trailing: IconButton(
                onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              color: Colors.blue[200],
            ),
            title: Text("Information",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w500)),
            trailing: IconButton(
                onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
          ),
          ListTile(
            leading: Icon(
              Icons.logout_outlined,
              color: Colors.blue[200],
            ),
            title: Text("Log out",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w500)),
            trailing: IconButton(
                onPressed: () {
                  logOut.signOut().then((value) {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return LoginView();
                      },
                    ));
                  });
                },
                icon: Icon(Icons.arrow_forward_ios)),
          )
        ])));
  }
}
