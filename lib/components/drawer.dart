import 'package:flutter/material.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.only(top: 10),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              // alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.blue, // لون البوردر
                    width: 2, // سمكه
                  ),
                ),
              ),
              height: 90,
              child: Text(
                "Menu",
                style: TextStyle(color: Colors.blue, fontSize: 25),
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: ListTile(
                  leading: Icon(Icons.home, color: Colors.blueAccent),
                  title: Text("Home", style: TextStyle(fontSize: 16)),
                  trailing: Icon(Icons.arrow_right_alt),
                  onTap: () {},
                ),
              ),
            ),
            SizedBox(width: 10, height: 10),
            Card(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: ListTile(
                  leading: Icon(Icons.person, color: Colors.blueAccent),
                  title: Text("Account", style: TextStyle(fontSize: 16)),
                  trailing: Icon(Icons.arrow_right_alt),
                  onTap: () {},
                ),
              ),
            ),
            SizedBox(width: 10, height: 10),

            Card(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: ListTile(
                  leading: Icon(Icons.settings, color: Colors.blueAccent),
                  title: Text("Settings", style: TextStyle(fontSize: 16)),
                  trailing: Icon(Icons.arrow_right_alt),
                  onTap: () {},
                ),
              ),
            ),
            SizedBox(width: 10, height: 10),

            Card(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: ListTile(
                  leading: Icon(Icons.help, color: Colors.blueAccent),
                  title: Text("About Us", style: TextStyle(fontSize: 16)),
                  trailing: Icon(Icons.arrow_right_alt),
                  onTap: () {},
                ),
              ),
            ),
            SizedBox(width: 10, height: 10),

            Card(
              color: const Color.fromARGB(255, 230, 132, 132),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: ListTile(
                  leading: Icon(Icons.delete, color: Colors.blueAccent),
                  title: Text(
                    "Delete Account",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  trailing: Icon(Icons.arrow_right_alt),
                  onTap: () {},
                ),
              ),
            ),
            SizedBox(width: 10, height: 10),

            Card(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: ListTile(
                  leading: Icon(Icons.exit_to_app, color: Colors.blueAccent),
                  title: Text("Log Out", style: TextStyle(fontSize: 16)),
                  trailing: Icon(Icons.arrow_right_alt),
                  onTap: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
