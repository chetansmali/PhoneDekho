import 'package:flutter/material.dart';
import 'package:phonedekho/common/widget/bottom_bar.dart';
import 'package:phonedekho/constants/global_vareables.dart';
import 'package:phonedekho/features/admin/screens/admin_screen.dart';
import 'package:phonedekho/features/auth/screen/auth_screen.dart';
import 'package:phonedekho/features/auth/services/auth_service.dart';
import 'package:phonedekho/providers/user_provider.dart';
import 'package:phonedekho/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserProvider(),
    )
  ] ,child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final AuthService authService=AuthService();

  @override
  void initState(){
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amezon clone',
      theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          colorScheme: ColorScheme.light(
            primary: GlobalVariables.secondaryColor,
          ),
          appBarTheme: const AppBarTheme(
              elevation: 0,
              iconTheme: IconThemeData(
                color: Colors.black,
              ))),
      onGenerateRoute: (setting) => generateRoute(setting),
      home:Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type == 'user'
          ? const BottomBar() : AdminScreen()
          : const AuthScreen(),
    );
  }
}
















// demo of aouting

// Scaffold(
// appBar: AppBar(
// title: const Center(child: Text('Hello.')),
// ),
// body:  Column(
// children: [
// Center(child: Text('flutter demo page')),
// Builder(
// builder: (context) {
// return ElevatedButton(onPressed: (){
// Navigator.pushNamed(context, AuthScreen.routName);
// }, child: Text('clik'));
// }
// )
// ],
// ),
// ),