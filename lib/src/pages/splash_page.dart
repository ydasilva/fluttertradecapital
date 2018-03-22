part of todomvc;

class SplashPage extends StatefulWidget {
  @override
  State createState() => new _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    // Listen for our auth even (on reload or start)
    // Go to our /todos page once logged in
    _auth.onAuthStateChanged
        .firstWhere((user) => user != null)
        .then((user) {
//      Navigator.of(context).pushReplacementNamed('/todos');
      Navigator.of(context).pushReplacementNamed('/main');
    });

    // Give the navigation animations, etc, some time to finish
    new Future.delayed(new Duration(seconds: 1))
        .then((_) => signInWithGoogle());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Image.asset('images/logo.png'),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new CircularProgressIndicator(),
              new SizedBox(width: 20.0),
              new Text("Signing In. Please wait..."),
            ],
          ),

          new SizedBox(height: 20.0),
          new FlatButton(
            child: const Text('Try Manually', ),
//            color: Colors.red,
            onPressed: signInWithGoogle,
          ),
        ],
      ),
    );
  }
}