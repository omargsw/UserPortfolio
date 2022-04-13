import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:task1/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';
import 'package:task1/user_remote.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<User> futureUser;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    futureUser = UserRemote.fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(color: Color(0xff196AA0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(300),
                      )),
                  child: FutureBuilder<User>(
                    future: futureUser,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: [
                            const SizedBox(
                              height: 150,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 4.0,
                                  color: const Color(0xFF395185),
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(100.0),
                                ),
                              ),
                              child: ClipOval(
                                child: Image.network(
                                  snapshot.data!.acf.avatar,
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              snapshot.data!.acf.firstName +
                                  " " +
                                  snapshot.data!.acf.lastName,
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              snapshot.data!.acf.email,
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff788AAE),
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Phone : " + snapshot.data!.acf.phone,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "City : " + snapshot.data!.acf.city,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "Age : " + snapshot.data!.acf.age,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                      return Column(
                        children: [
                          const SizedBox(
                            height: 150,
                          ),
                          const SizedBox(
                              width: 200,
                              height: 200,
                              child: CircularProgressIndicator(
                                color: Color(0xFF395185),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey,
                            highlightColor: Colors.white,
                            child: Column(
                              children: [
                                Container(
                                  width: 130,
                                  height: 10,
                                  color: Colors.blue,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  width: 200,
                                  height: 10,
                                  color: Colors.blue,
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Container(
                                  width: 120,
                                  height: 10,
                                  color: Colors.blue,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  width: 100,
                                  height: 10,
                                  color: Colors.blue,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  width: 90,
                                  height: 10,
                                  color: Colors.blue,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
