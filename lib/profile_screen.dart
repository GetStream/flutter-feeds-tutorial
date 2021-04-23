import 'package:feeds_tutorial/utils/utils.dart';
import 'package:flutter/material.dart';

import 'add_activity_dialog.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<void> _loadActivities({bool pullToRefresh = false}) async {
    //TODO(awesome-developer): Implement load activities
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadActivities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final message = await showDialog<String>(
            context: context,
            builder: (_) => AddActivityDialog(),
          );
          if (message != null) {
            context.showSnackbar('Posting Activity...');

            // TODO(awesome-developer): Implement posting

            context.showSnackbar('Activity Posted...');
            _loadActivities();
          }
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: RefreshIndicator(
            onRefresh: () => _loadActivities(pullToRefresh: true),
            child: Text('No activities yet!')),
      ),
    );
  }
}
