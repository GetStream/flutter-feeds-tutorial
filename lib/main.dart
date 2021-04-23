import 'package:feeds_tutorial/dummy_app_user.dart';
import 'package:feeds_tutorial/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:stream_feed/stream_feed.dart';

import 'home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final _key = String.fromEnvironment('key');
  final _secret = String.fromEnvironment('secret');
  final _client = StreamClient.connect(_key, secret: _secret);

  runApp(MyApp(client: _client));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.client}) : super(key: key);

  final StreamClient client;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Feed Demo',
      home: LoginScreen(),
      builder: (context, child) => ClientProvider(
        client: client,
        child: child!,
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    /// Access Stream's Client via a provider.
    final _client = context.client;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Container(
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login with a User',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 42),
              for (final user in DummyAppUser.values)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () async {
                      context.showSnackbar('Loading User');

                      /// Create a user on Stream using the id and dummy data
                      /// consisting of the user's first, last and full name.
                      /// See class [DummyAppUser] for more details.
                      final _user = await _client.users.add(
                        user.id!,
                        user.data!,
                        getOrCreate: true,
                      );

                      context.showSnackbar('User Loaded');

                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => HomeScreen(streamUser: _user),
                        ),
                      );
                    },
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 36.0, horizontal: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            user.name!,
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.blue,
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
