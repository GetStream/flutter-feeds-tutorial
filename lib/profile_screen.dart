import 'package:feeds_tutorial/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:stream_feed/stream_feed.dart';

import 'add_activity_dialog.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
    required this.streamUser,
  }) : super(key: key);

  final User streamUser;

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final StreamClient _client;
  bool _isLoading = true;

  List<Activity> activities = <Activity>[];

  Future<void> _loadActivities({bool pullToRefresh = false}) async {
    if (!pullToRefresh) setState(() => _isLoading = true);

    final userFeed = _client.flatFeed('user', widget.streamUser.id!);
    final data = await userFeed.getActivities();
    if (!pullToRefresh) _isLoading = false;
    setState(() => activities = data);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _client = context.client;
    _loadActivities();
  }

  @override
  Widget build(BuildContext context) {
    final user = widget.streamUser;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final message = await showDialog<String>(
            context: context,
            builder: (_) => AddActivityDialog(),
          );
          if (message != null) {
            context.showSnackbar('Posting Activity...');

            final activity = Activity(
              actor: user.id,
              verb: 'tweet',
              object: '1',
              extraData: {
                'tweet': message,
              },
            );
            final userFeed = _client.flatFeed('user', user.id!);
            await userFeed.addActivity(activity);

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
