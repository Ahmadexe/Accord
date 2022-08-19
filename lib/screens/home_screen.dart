import 'package:accord/screens/login_screen.dart';
import 'package:accord/services/authentication.dart';
import 'package:accord/utils/colors.dart';
import 'package:accord/widgets/room_type_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String techAddress =
      'https://images.unsplash.com/photo-1518770660439-4636190af475?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80';
  String scienceAddress =
      'https://images.unsplash.com/photo-1517976487492-5750f3195933?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80';
  String sportsAddress =
      'https://images.unsplash.com/photo-1484482340112-e1e2682b4856?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=876&q=80';
  String dailyAddress =
      'https://images.unsplash.com/photo-1623039405147-547794f92e9e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=526&q=80';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: primaryColor,
        //or set color with: Color(0xFF0000FF)
        statusBarIconBrightness: Brightness.light));
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text(
            "Welcome",
            style: TextStyle(color: Colors.white),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
          centerTitle: true,
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const CircleAvatar(
                radius: 30,
                backgroundColor: backgroundColor,
                child: Text(
                  "A",
                  style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Ahmad",
                style: TextStyle(fontSize: 16),
              ),
              ListTile(
                tileColor: Colors.white,
                onTap: () async {
                  await Authentication().signOut();
                  Get.off(const LoginScreen());
                },
                leading: const Icon(
                  Icons.logout,
                  color: primaryColor,
                ),
                title: const Text("Log out?"),
              )
            ],
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  cursorColor: secondaryColor,
                  decoration: InputDecoration(
                      hintText: "Enter group id",
                      isDense: true, // important line
                      contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward,
                            color: secondaryColor,
                          ))),
                )),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "What can we help you find?",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                const SizedBox(
                  width: 16,
                ),
                RoomTypeCard(
                  text: 'Tech',
                  imgAddress: techAddress,
                  function: () {},
                ),
                const SizedBox(
                  width: 16,
                ),
                RoomTypeCard(
                    text: 'Daily', imgAddress: dailyAddress, function: () {}),
                const SizedBox(
                  width: 16,
                ),
                RoomTypeCard(
                    text: 'Science',
                    imgAddress: scienceAddress,
                    function: () {}),
                const SizedBox(
                  width: 16,
                ),
                RoomTypeCard(
                    text: 'Sports', imgAddress: sportsAddress, function: () {}),
                const SizedBox(
                  width: 10,
                ),
              ]),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Your Rooms",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
