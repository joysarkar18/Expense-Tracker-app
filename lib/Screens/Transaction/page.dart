import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class page1 extends StatelessWidget {

  const page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: ListView(
        children: [
          SizedBox(
            height: 38,
          ),
          Container(
              margin: EdgeInsets.only(left: 5),
              child: Text("Transactions List", style: TextStyle(fontSize: 24))),
          SizedBox(
            height: 15,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                width: 50,
                child: Text(
                  "All",
                  style: TextStyle(fontSize: 22),
                )),
            Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                width: 140,
                child: Text("Transactions", style: TextStyle(fontSize: 22))),
            Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                width: 105,
                child: InkWell(
                    onTap: () {},
                    child: Text("Expenses", style: TextStyle(fontSize: 22)))),
          ]),
          SizedBox(height: 24),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.arrow_upward_rounded,
                color: Colors.red,
              ),
              title: Text(
                "Today 2:30",
                style:
                    TextStyle(fontWeight: FontWeight.w300, color: Colors.black),
              ),
              subtitle: Text("Ritesh Shandilya",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w700)),
              trailing: Text("456rs"),
            ),
          ),
           Card(
            child: ListTile(
              leading: Icon(
                Icons.arrow_upward_rounded,
                color: Colors.red,
              ),
              title: Text(
                "Today 2:30",
                style:
                    TextStyle(fontWeight: FontWeight.w300, color: Colors.black),
              ),
              subtitle: Text("Ritesh Shandilya",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w700)),
              trailing: Text("456rs"),
            ),
          ),
           Card(
            child: ListTile(
              leading: Icon(
                Icons.arrow_upward_rounded,
                color: Colors.red,
              ),
              title: Text(
                "Today 2:30",
                style:
                    TextStyle(fontWeight: FontWeight.w300, color: Colors.black),
              ),
              subtitle: Text("Ritesh Shandilya",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w700)),
              trailing: Text("456rs"),
            ),
          ),
           Card(
            child: ListTile(
              leading: Icon(
                Icons.arrow_upward_rounded,
                color: Colors.red,
              ),
              title: Text(
                "Today 2:30",
                style:
                    TextStyle(fontWeight: FontWeight.w300, color: Colors.black),
              ),
              subtitle: Text("Ritesh Shandilya",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w700)),
              trailing: Text("456rs"),
            ),
          ),
           Card(
            child: ListTile(
              leading: Icon(
                Icons.arrow_upward_rounded,
                color: Colors.red,
              ),
              title: Text(
                "Today 2:30",
                style:
                    TextStyle(fontWeight: FontWeight.w300, color: Colors.black),
              ),
              subtitle: Text("Ritesh Shandilya",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w700)),
              trailing: Text("456rs"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.arrow_upward_rounded,
                color: Colors.red,
              ),
              title: Text(
                "Today 2:30",
                style:
                    TextStyle(fontWeight: FontWeight.w300, color: Colors.black),
              ),
              subtitle: Text("Ritesh Shandilya",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w700)),
              trailing: Text("456rs"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.arrow_upward_rounded,
                color: Colors.red,
              ),
              title: Text(
                "Today 2:30",
                style:
                    TextStyle(fontWeight: FontWeight.w300, color: Colors.black),
              ),
              subtitle: Text("Ritesh Shandilya",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w700)),
              trailing: Text("456rs"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.arrow_upward_rounded,
                color: Colors.red,
              ),
              title: Text(
                "Today 2:30",
                style:
                    TextStyle(fontWeight: FontWeight.w300, color: Colors.black),
              ),
              subtitle: Text("Ritesh Shandilya",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w700)),
              trailing: Text("456rs"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.arrow_upward_rounded,
                color: Colors.red,
              ),
              title: Text(
                "Today 2:30",
                style:
                    TextStyle(fontWeight: FontWeight.w300, color: Colors.black),
              ),
              subtitle: Text("Ritesh Shandilya",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w700)),
              trailing: Text("456rs"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.arrow_upward_rounded,
                color: Colors.red,
              ),
              title: Text(
                "Today 2:30",
                style:
                    TextStyle(fontWeight: FontWeight.w300, color: Colors.black),
              ),
              subtitle: Text("Ritesh Shandilya",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w700)),
              trailing: Text("456rs"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.arrow_upward_rounded,
                color: Colors.red,
              ),
              title: Text(
                "Today 2:30",
                style:
                    TextStyle(fontWeight: FontWeight.w300, color: Colors.black),
              ),
              subtitle: Text("Ritesh Shandilya",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w700)),
              trailing: Text("456rs"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.arrow_upward_rounded,
                color: Colors.red,
              ),
              title: Text(
                "Today 2:30",
                style:
                    TextStyle(fontWeight: FontWeight.w300, color: Colors.black),
              ),
              subtitle: Text("Ritesh Shandilya",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w700)),
              trailing: Text("456rs"),
            ),
          ),
          
        ],
      ),
    ));
  }
}