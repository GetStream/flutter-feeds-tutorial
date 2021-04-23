import 'package:feeds_tutorial/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:stream_feed/stream_feed.dart';

class TimelineScreen extends StatefulWidget {
  const TimelineScreen({
    Key? key,
    required this.streamUser,
  }) : super(key: key);

  final User streamUser;

  @override
  _TimelineScreenState createState() => _TimelineScreenState();
}

class _TimelineScreenState extends State<TimelineScreen> {
  bool _isLoading = true;

  Future<void> _loadActivities({bool pullToRefresh = false}) async {
    if (!pullToRefresh) setState(() => _isLoading = true);
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
      body: RefreshIndicator(
          onRefresh: () => _loadActivities(pullToRefresh: true),
          child: Column(
            children: [
              Text('No activities yet!'),
              RaisedButton(
                onPressed: _loadActivities,
                child: Text('Reload'),
              )
            ],
          )),
    );
  }
}
