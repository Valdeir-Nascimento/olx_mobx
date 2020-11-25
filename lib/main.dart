import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:olxmobx/controllers/base_controller.dart';
import 'package:olxmobx/controllers/category_controller.dart';
import 'package:olxmobx/controllers/user_manager_controller.dart';
import 'package:olxmobx/pages/base/base_page.dart';
import 'package:olxmobx/pages/category/category_page.dart';
import 'package:olxmobx/repositories/category_repository.dart';
import 'package:olxmobx/repositories/ibge_repository.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  setupLocator();
  runApp(MyApp());
  IBGERepository().getEstados().then((value) => print(value));

  // final category = ParseObject('Categories')
  //   ..set<String>('Title', 'Meias')
  //   ..set<int>('Position', 2);
  // final response = await category.save();
  // print(response.success);

  // final category = ParseObject('Categories')
  //   ..objectId = 'yJsiYpHimE'
  //   ..set<String>('Title', 'Roupas');
  // final response = await category.save();
  // print(response.success);

  // final category = ParseObject('Categories')
  //   ..objectId = 'yJsiYpHimE';
  //   category.delete();

  // final response = await ParseObject('Categories').getObject('8LgJI9v7CS');
  // if (response.success)
  //   print(response.result);

  // final response = await ParseObject('Categories').getAll();
  // if (response.success) {
  //   for (final object in response.results) {
  //     print(object);
  //   }
  // }

  // final query = QueryBuilder(ParseObject('Categories'));
  // query.whereEqualTo('Position', 2);
  // query.whereContains('Title', 'Meias');

  // final response = await query.query();
  // if (response.success)
  //   print(response.result);
}

Future<void> initializeParse() async {
  await Parse().initialize(
    'cmPhtldJbIPJ2vpBDcd4HDhgj6vjXyfEtpzeXXow',
    'https://parseapi.back4app.com/',
    clientKey: 'BfHZqdvOrlTJ3h9U1MyyPw1qfibBLC9bhchr1ZS9',
    autoSendSessionId: true,
    debug: true,
  );
}

void setupLocator() {
  GetIt.I.registerSingleton(BaseController());
  GetIt.I.registerSingleton(UserManagerController());
  GetIt.I.registerSingleton(CategoryController());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OLX Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.purple,
          scaffoldBackgroundColor: Colors.purple,
          appBarTheme: AppBarTheme(elevation: 0),
          cursorColor: Colors.purple),
      home: BasePage(),
      // home: CategoryPage(),
    );
  }
}
