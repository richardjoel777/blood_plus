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
    final _height = MediaQuery.of(context).size.height;
    if (isFirst) {
      currentUserData.loadUserData();
      isFirst = false;
    }
    return Container(
      //decoration: BoxDecoration(color: Colors.red[100]),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(
              bottom: 15,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              //color: Colors.white,
              gradient: LinearGradient(
                  colors: [Colors.red[200], Colors.red[50]],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight),
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
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        currentUserData.userData['name'] ?? "loading",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "USER",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(children: [
                        Container(
                          height: _height * .15,
                          child: Image(
                            image: AssetImage(
                              'assets/images/bloodDrop.png',
                            ),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Positioned(
                          child: Text(
                            currentUserData.userData['bloodGroup'] ?? "loading",
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                          bottom: _height * 0.045,
                          right: _height * 0.06,
                        ),
                      ]),
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          currentUserData.userData['accepted'] != null
                              ? currentUserData.userData['accepted'].length
                                  .toString()
                              : " " ?? "loading",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                          )),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "LIVES SAVED",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(
                bottom: 5,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
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
                  SizedBox(height: 5),
                  Text(
                    "Whom Can Donate to Who",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Colors.black),
                  ),
                  Flexible(
                    child: Container(
                      child: GridView(
                        padding: const EdgeInsets.all(10),
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
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
