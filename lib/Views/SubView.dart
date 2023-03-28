import 'package:flutter/material.dart';


class SubView extends StatelessWidget {
  const SubView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Container(
          width: 400,
          height: 300,
          padding: new EdgeInsets.all(10.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.blue,
            elevation: 10,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.person, size: 80),
                  title: Text(
                      'Users Name',
                      style: TextStyle(fontSize: 30.0)
                  ),
                  subtitle: Text(
                      'users details (adress,...)',
                      style: TextStyle(fontSize: 18.0)
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  onPressed: () { },
                  child: Text('valid'),
                )
    ]
            ),
          ),
        )
    );
  }
}

