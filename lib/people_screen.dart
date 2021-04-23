import 'package:feeds_tutorial/dummy_app_user.dart';
import 'package:feeds_tutorial/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stream_feed/stream_feed.dart';

class PeopleScreen extends StatefulWidget {
  const PeopleScreen({
    Key? key,
    required this.streamUser,
  }) : super(key: key);

  final User streamUser;

  @override
  _PeopleScreenState createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  @override
  Widget build(BuildContext context) {
    final users = List<DummyAppUser>.from(DummyAppUser.values);

    final followDialog = CupertinoAlertDialog(
      title: Text('Follow User?'),
      actions: [
        CupertinoDialogAction(
          onPressed: () => Navigator.pop(context, true),
          child: Text("Yes"),
        ),
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: Navigator.of(context).pop,
          child: Text("No"),
        ),
      ],
    );

    return Container(
      child: Center(
        child: ListView.separated(
          itemCount: users.length,
          padding: const EdgeInsets.symmetric(vertical: 8),
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (_, index) {
            final user = users[index];
            return InkWell(
              onTap: () async {
                final result = await showDialog(
                  context: context,
                  builder: (_) => followDialog,
                );
                if (result != null) {
                  context.showSnackbar('Following User...');

                  //TODO(awesome-developer): Implement Follow action.

                  context.showSnackbar('Followed User...');
                }
              },
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(user.name![0]),
                ),
                title: Text(
                  user.name!,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
