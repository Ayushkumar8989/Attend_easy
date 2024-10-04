// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCDPL0FYWORShYuWKhRciUZqP26B5qD04s',
    appId: '1:953239266901:web:c8ff1218a1174cbb9d16dc',
    messagingSenderId: '953239266901',
    projectId: 'attendeasy-6d238',
    authDomain: 'attendeasy-6d238.firebaseapp.com',
    storageBucket: 'attendeasy-6d238.appspot.com',
    measurementId: 'G-PD1PZ1Q070',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCK09CPJ0sQkSD-eTm8gcQYSFvOXhLDv-s',
    appId: '1:953239266901:android:04318221a2cf18959d16dc',
    messagingSenderId: '953239266901',
    projectId: 'attendeasy-6d238',
    storageBucket: 'attendeasy-6d238.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDHDV5TtmpkgGbLf8AQlt3XiXX5NuaM6yo',
    appId: '1:953239266901:ios:bafba1bf187982059d16dc',
    messagingSenderId: '953239266901',
    projectId: 'attendeasy-6d238',
    storageBucket: 'attendeasy-6d238.appspot.com',
    iosBundleId: 'com.example.attendEasy',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDHDV5TtmpkgGbLf8AQlt3XiXX5NuaM6yo',
    appId: '1:953239266901:ios:bafba1bf187982059d16dc',
    messagingSenderId: '953239266901',
    projectId: 'attendeasy-6d238',
    storageBucket: 'attendeasy-6d238.appspot.com',
    iosBundleId: 'com.example.attendEasy',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCDPL0FYWORShYuWKhRciUZqP26B5qD04s',
    appId: '1:953239266901:web:00d9666988efee769d16dc',
    messagingSenderId: '953239266901',
    projectId: 'attendeasy-6d238',
    authDomain: 'attendeasy-6d238.firebaseapp.com',
    storageBucket: 'attendeasy-6d238.appspot.com',
    measurementId: 'G-93YCXQFFBH',
  );
}
