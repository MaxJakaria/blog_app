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
    apiKey: 'AIzaSyDOOoG81bgQV8FpvLl_zOKDueja4MnaoxQ',
    appId: '1:627902142655:web:211dcef965071f8a8b4e0a',
    messagingSenderId: '627902142655',
    projectId: 'blog-app-c9064',
    authDomain: 'blog-app-c9064.firebaseapp.com',
    storageBucket: 'blog-app-c9064.firebasestorage.app',
    measurementId: 'G-DG8BRD3LKB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAuj3hc866zkGxSCrohBsrKOxmFKaI1nKU',
    appId: '1:627902142655:android:becf25b6a9d2b8568b4e0a',
    messagingSenderId: '627902142655',
    projectId: 'blog-app-c9064',
    storageBucket: 'blog-app-c9064.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBIlLuQiLzksm0DvSt67pEWuzLQqNN9TZI',
    appId: '1:627902142655:ios:7fe6f5a07dc031138b4e0a',
    messagingSenderId: '627902142655',
    projectId: 'blog-app-c9064',
    storageBucket: 'blog-app-c9064.firebasestorage.app',
    iosBundleId: 'com.example.blogApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBIlLuQiLzksm0DvSt67pEWuzLQqNN9TZI',
    appId: '1:627902142655:ios:7fe6f5a07dc031138b4e0a',
    messagingSenderId: '627902142655',
    projectId: 'blog-app-c9064',
    storageBucket: 'blog-app-c9064.firebasestorage.app',
    iosBundleId: 'com.example.blogApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDOOoG81bgQV8FpvLl_zOKDueja4MnaoxQ',
    appId: '1:627902142655:web:f8feb545770854378b4e0a',
    messagingSenderId: '627902142655',
    projectId: 'blog-app-c9064',
    authDomain: 'blog-app-c9064.firebaseapp.com',
    storageBucket: 'blog-app-c9064.firebasestorage.app',
    measurementId: 'G-QC9JL5SSDY',
  );
}
