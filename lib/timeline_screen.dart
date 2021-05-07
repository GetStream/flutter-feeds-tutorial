import 'package:flutter/material.dart';

class TimelineScreen extends StatefulWidget {
  const TimelineScreen({Key? key}) : super(key: key);

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
              ElevatedButton(
                onPressed: _loadActivities,
                child: Text('Reload'),
              )
            ],
          )),
    );
  }
}
