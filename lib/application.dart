import 'package:daily_mobile_app/src/api/api_client.dart';
import 'package:daily_mobile_app/src/api/api_client_impl.dart';
import 'package:daily_mobile_app/src/data/repository/tag_rest_rep_impl.dart';
import 'package:daily_mobile_app/src/data/repository/tag_storage_rep_impl.dart';
import 'package:daily_mobile_app/src/data/service/tag/tag_service.dart';
import 'package:daily_mobile_app/src/domain/interfaces/tag_repositoty.dart';
import 'package:daily_mobile_app/src/ui/tags/tags_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'src/ui/app_theme.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Injector(
        inject: [
          Inject<ApiClient>(() => ApiClientImpl()),
          Inject<Future<SharedPreferences>>(
              () => SharedPreferences.getInstance()),

          //Repositories
          Inject<TagRestRepository>(() => TagRestRepositoryImpl(Injector.get())),
          Inject<TagStorageRepository>(
              () => TagStorageRepositoryImpl(Injector.get())),

          //States
          Inject<TagService>(() => TagService(Injector.get(), Injector.get()))
        ],
        builder: (_) => MaterialApp(
              title: 'Daily',
              theme: appTheme(),
              routes: {Routes.tags: (context) => TagsPage()},
            ));
  }
}

class Routes {
  static final tags = '/';
}
