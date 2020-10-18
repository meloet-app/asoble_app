/*import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {

        // エラー時に表示するWidget
        if (snapshot.hasError) {
          return InitError();
        }

        // Firebaseのinitialize完了したら表示したいWidget
        if (snapshot.connectionState == ConnectionState.done) {
          return MyHomeApp();
        }

        // Firebaseのinitializeが完了するのを待つ間に表示するWidget
        return Loading();
      },
    );
  }
}

class InitError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:Container(color:Colors.amberAccent,child: Center(child: Text("ERROR!!!"))));
  }
}

class Loading extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'google auth sample',
        theme: ThemeData(
        primarySwatch: Colors.blue,
    ),
        home:Text("NOW LOADING..."));

}
}


class MyHomeApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'google auth sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthPage(

        title: 'Google Auth Aample with Firebase',
      ),
    );
  }
}

class AuthPage extends StatefulWidget {
  AuthPage({
    Key key,
    this.title,
  }) : super(
    key: key,
  );

  final String title;




  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  bool logined = false;

  void login() {
    setState(() {
      logined = true;
    });
  }

  void logout() {
    setState(() {
      logined = false;
    });
  }

  Future signInWithGoogle() async {
    //サインイン画面が表示
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;


    //firebase側に登録
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    //userのid取得
    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser;
    assert(user.uid == currentUser.uid);

    login();
  }

  //サインアウト
  void signOutGoogle() async {
    await googleSignIn.signOut();
    logout();
    print("User Sign Out Google");
  }

  @override
  Widget build(BuildContext context) {
    Widget logoutText = Text("ログアウト中");
    Widget loginText = Text("ログイン中");

    Widget loginButton = RaisedButton(
      child: Text("Sign in with Google"),
      color: Color(0xFFDD4B39),
      textColor: Colors.white,
      onPressed: signInWithGoogle,
    );
    Widget logoutButton = RaisedButton(
        child: Text("Sign out"),
        color: Color(0xFFDD4B39),
        textColor: Colors.white,
        onPressed: signOutGoogle);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("widget.title"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            logined ? loginText : logoutText,
            logined ? logoutButton : loginButton,
          ],
        ),
      ),
    );
  }
}

*/