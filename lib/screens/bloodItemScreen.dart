import 'package:blood_plus/dummy_data.dart';
import 'package:blood_plus/models/blood_eligibility.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_markdown/flutter_markdown.dart';

class BloodItemScreen extends StatelessWidget {
  static const routeName = '/blood-details';
  
  @override
  Widget build(BuildContext context) {
    final bId = ModalRoute.of(context).settings.arguments as String;
    final BloodEligibility _blood = DUMMY_BLOOD.firstWhere((b) => b.id == bId);
    return Scaffold(
        appBar: AppBar(title: Text('${_blood.blood} Blood Group' , style: Theme.of(context).textTheme.headline6,)),
        body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),

        ),
        height: 620, 
        padding: const EdgeInsets.all(15),
        margin: EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(height: 5,),
            Text("You Can Donate To", style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.black,),),
            Container(
              height: 250,
              padding: EdgeInsets.only(right: 15),
              child: ListView.builder(itemBuilder: (context, index){
                return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${index + 1}'),
                        ),
                        title: Text(_blood.donate[index], style: Theme.of(context).textTheme.headline1.copyWith(color: Colors.black, fontSize: 15,)),
                      ),
                      Divider(),
                    ],
                  );
              },
              itemCount: _blood.donate.length,),
            ),
            SizedBox(height: 8,),
            Text("You Can Get Donation From", style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.black,),),
            Container(
              height: 250,
              padding: EdgeInsets.only(right: 15),
              child: ListView.builder(itemBuilder: (context, index){
                return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${index + 1}'),
                        ),
                        title: Text(_blood.borrow[index], style: Theme.of(context).textTheme.headline1.copyWith(color: Colors.black, fontSize: 15),),
                      ),
                      Divider(),
                    ],
                  );
              },
              itemCount: _blood.borrow.length),
            ),
            // Text("You can Donate To"),
            // Markdown(data: donate),
            // Text("You can get Blood From"),
            // Markdown(data: borrow),
          ],
        ),
      ),
    );
  }
}
