import 'package:daily_mobile_app/src/api/api_client.dart';
import 'package:daily_mobile_app/src/api/api_client_impl.dart';
import 'package:daily_mobile_app/src/data/repository/posts/posts_rest_repository_impl.dart';
import 'package:daily_mobile_app/src/data/repository/tag/tag_rest_rep_impl.dart';
import 'package:daily_mobile_app/src/data/repository/tag/tag_storage_rep_impl.dart';
import 'package:daily_mobile_app/src/data/service/posts/posts_service.dart';
import 'package:daily_mobile_app/src/data/service/tag/tag_service.dart';
import 'package:daily_mobile_app/src/domain/interfaces/posts_repository.dart';
import 'package:daily_mobile_app/src/domain/interfaces/tag_repositoty.dart';
import 'package:daily_mobile_app/src/ui/login/login_screen.dart';
import 'package:daily_mobile_app/src/ui/posts/posts_screen.dart';
import 'package:daily_mobile_app/src/ui/tags/tags_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'src/ui/app_theme.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Injector(
        inject: [
          Inject<ApiClient>(() => ApiClientImpl()),

          /*Repositories*/
          Inject<TagStorageRepository>(() => TagStorageRepositoryImpl()),
          Inject<PostsRestRepository>(
              () => PostsRestRepositoryImpl(Injector.get<ApiClient>())),

          /*Services*/
          Inject<TagService>(() => TagService(
                TagRestRepositoryImpl(Injector.get<ApiClient>()),
                Injector.get(),
              )),
          Inject<PostsService>(() => PostsService(
                Injector.get<TagStorageRepository>(),
                Injector.get<PostsRestRepository>(),
              ))
        ],
        builder: (_) => MaterialApp(
              title: 'Daily',
              theme: appTheme(),
              routes: {
                Routes.tags: (context) => LoginScreenDesign(),
//                Routes.tags: (context) => TagsPage(),
                Routes.posts: (_) => PostsPage(),
//                Routes.splash: (context) => SplashPage()
              },
            ));
  }
}

class Routes {
  static final tags = '/';
  static final splash = '/';
  static final posts = '/posts';

}
