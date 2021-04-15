import 'package:blood_plus/providers/bloods.dart';
import 'package:blood_plus/providers/user.dart';
import 'package:blood_plus/widgets/bloodItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  bool isFirst = true;
  @override
  Widget build(BuildContext context) {
    final bloodData = Provider.of<Bloods>(context);
    final currentUserData = Provider.of<CurrentUser>(context);
    if (isFirst) {
      currentUserData.loadUserData();
      isFirst = false;
    }
    return Container(
      decoration: BoxDecoration(color: Colors.red[100]),
      padding: EdgeInsets.only(right: 15, left: 15, top: 25, bottom: 10),
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Container(
            height: 150,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(
              bottom: 15,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                     currentUserData.userData['name'] ?? "loading",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "USER",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Stack(children: [
                      Container(
                        height: 100,
                        width: 80,
                        child: Image(
                          image: AssetImage(
                            'assets/images/bloodDrop.png',
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
            child: Text(currentUserData.userData['bloodGroup'] ?? "loading",
                            style: Theme.of(context).textTheme.headline6),
                        bottom: 30, right: 30,
                      ),
                    ]),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(currentUserData.userData['accepted']!=null ? currentUserData.userData['accepted'].length.toString() : " " ?? "loading",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "LIVES SAVED",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 393,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(
              bottom: 15,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  "Whom Can Donate to Who",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.black),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 330,
                  child: GridView(
                    padding: const EdgeInsets.all(25),
                    children: bloodData.bloods
                        .map((blood) =>
                            BloodItem(blood.id, blood.blood, blood.color))
                        .toList(),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
