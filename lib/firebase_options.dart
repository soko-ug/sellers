// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAwR1wxsVJbgWJl67DrggYhdD8zJsHKDf8',
    appId: '1:268039391901:web:05760a55bd510a15166274',
    messagingSenderId: '268039391901',
    projectId: 'soko-86bf0',
    authDomain: 'soko-86bf0.firebaseapp.com',
    databaseURL: 'https://soko-86bf0.firebaseio.com',
    storageBucket: 'soko-86bf0.appspot.com',
    measurementId: 'G-7L13HDFELK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCiRYlOIe5k7Sl93n6KTuph5bZFTudlaWU',
    appId: '1:268039391901:android:3fc671beba3e66d2166274',
    messagingSenderId: '268039391901',
    projectId: 'soko-86bf0',
    databaseURL: 'https://soko-86bf0.firebaseio.com',
    storageBucket: 'soko-86bf0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDyoRyeF_wrRGi7xDbmLzVoCknNANeJ85U',
    appId: '1:268039391901:ios:7ad50ad4d3ff8a5f166274',
    messagingSenderId: '268039391901',
    projectId: 'soko-86bf0',
    databaseURL: 'https://soko-86bf0.firebaseio.com',
    storageBucket: 'soko-86bf0.appspot.com',
    androidClientId: '268039391901-4tga0gj0op60u8ote9of59nhrsn3f1fn.apps.googleusercontent.com',
    iosBundleId: 'com.example.sokosellers',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDyoRyeF_wrRGi7xDbmLzVoCknNANeJ85U',
    appId: '1:268039391901:ios:59296eadf8d6e8f6166274',
    messagingSenderId: '268039391901',
    projectId: 'soko-86bf0',
    databaseURL: 'https://soko-86bf0.firebaseio.com',
    storageBucket: 'soko-86bf0.appspot.com',
    androidClientId: '268039391901-4tga0gj0op60u8ote9of59nhrsn3f1fn.apps.googleusercontent.com',
    iosBundleId: 'com.example.deeply.RunnerTests',
  );
}
