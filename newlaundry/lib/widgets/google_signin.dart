import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

String name;
String email;
String imageUrl;

final firestore = Firestore.instance;

Future<void> insertinformation(String email) async {
  final databaseReference = Firestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Map<String, dynamic> map = Map();
  map['Email'] = email;
  map['URLpic'] = imageUrl;
  map['Fname'] = name;
  map['Lname'] = "";
  map['Birthday'] = "";
  map['Sex'] = "";
  map['Phone'] = "";
  map['Address'] = "";

  try {
    await databaseReference
        .collection('Customer')
        .document(firebaseAuth.currentUser.uid)
        .setData(map)
        .then((value) {
      print('insert email Successfully');
    });
  } catch (e) {
    print(e);
  }
}

Future<String> signInWithGoogle() async {
  await Firebase.initializeApp();

  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential authResult =
      await _auth.signInWithCredential(credential);
  final User user = authResult.user;

  if (user != null) {
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);
    assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoURL != null);

    name = user.displayName;
    email = user.email;
    imageUrl = user.photoURL;

    final User currentUser = _auth.currentUser;
    assert(user.uid == currentUser.uid);

    if (name.contains(" ")) {
      name = name.substring(0, name.indexOf(" "));
    }

    print('signInWithGoogle succeeded: $user');
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    if (firebaseAuth.currentUser != null) {
      print(firebaseAuth.currentUser);
      insertinformation(firebaseAuth.currentUser.email);

      return '$user';
    }

    return null;
  }

  Future<void> signOutGoogle() async {
    await googleSignIn.signOut();

    print("User Signed Out");
  }
}
