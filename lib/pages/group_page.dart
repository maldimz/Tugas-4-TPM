import 'package:flutter/material.dart';
import 'package:presentasi_task4/data/users.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('List of Group'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: usersList.length,
            itemBuilder: (context, index) {
              Users users = usersList[index];
              return Card(
                child: ListTile(
                  leading: Image.asset(users.image,
                      width: 50, height: 50, fit: BoxFit.cover),
                  title: Text(users.name),
                  subtitle: Text(users.nim),
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                        title: Text(users.name),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: AssetImage(users.image),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(height: 10),
                            contentRow('NIM', users.nim),
                            SizedBox(height: 5),
                            contentRow('Born', users.born),
                            SizedBox(height: 5),
                            contentRow('Classes', users.classes),
                            SizedBox(height: 5),
                            contentRow('Hope', users.hope),
                          ],
                        )),
                  ),
                ),
              );
            },
          ),
        ));
  }

  Row contentRow(String title, String content) {
    return Row(
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(width: 10),
        Text(content),
      ],
    );
  }
}
