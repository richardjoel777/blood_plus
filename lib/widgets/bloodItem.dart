import 'package:blood_plus/screens/bloodItemScreen.dart';
import 'package:flutter/material.dart';

class BloodItem extends StatelessWidget {
  final String id;
  final String blood;
  final Color color;
  BloodItem( this.id, this.blood, this.color,);
  void selectBlood(BuildContext cTx) {
    Navigator.of(cTx).pushNamed(BloodItemScreen.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectBlood(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          blood,
          style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.black),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
