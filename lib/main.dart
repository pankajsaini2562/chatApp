import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:live_chat_app/features/auth/presentation/screens/login_page.dart';
import 'package:live_chat_app/features/auth/riverpod/auth_provider.dart';
import 'package:live_chat_app/features/chat/presentation/screens/chat_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    return MaterialApp(
      title: 'chatApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: authState.when(
        data: (user) => user != null ? ChatPage() : LoginPage(),
        loading: () => CircularProgressIndicator(),
        error: (e, st) => Text("Error"),
      ),
    );
  }
}
