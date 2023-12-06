import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/data/user.dart';
import 'package:flutter_bloc_example/helper/text.dart';

class UserBody extends StatelessWidget {
  final List<Data> userData;

  UserBody({required this.userData});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: ListView.builder(
        itemCount: userData.length,
        itemBuilder: (_, index) {
          Data data = userData[index];
          return Container(
            margin: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 10.0,
            ),
            child: Row(
              children: [
                Text(
                  data.id.toString(),
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  ),
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                data.avatar != null
                    ? data.avatar!.isNotEmpty
                        ? Image.network(data.avatar!)
                        : Image.asset("assets/images/user.png")
                    : Image.asset("assets/images/user.png"),
                SizedBox(
                  width: size.width * 0.02,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.firstName != null && data.lastName != null
                            ? data.firstName!.isNotEmpty &&
                                    data.lastName!.isNotEmpty
                                ? data.firstName! + " " + data.lastName!
                                : user
                            : user,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                        ),
                      ),
                      SizedBox(
                        width: size.height * 0.01,
                      ),
                      Text(
                        data.email != null
                            ? data.email!.isNotEmpty
                                ? data.email!
                                : email
                            : email,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
