import 'package:daily_mobile_app/src/api/api_client.dart';
import 'package:daily_mobile_app/src/api/api_client_impl.dart';
import 'package:daily_mobile_app/src/data/repository/auth/auth_rep_impl.dart';
import 'package:daily_mobile_app/src/data/repository/auth/redirect_url_parser.dart';
import 'package:daily_mobile_app/src/data/repository/auth/web_auth_url_provider.dart';
import 'package:daily_mobile_app/src/data/repository/posts/posts_rest_repository_impl.dart';
import 'package:daily_mobile_app/src/data/repository/tag/tag_rest_rep_impl.dart';
import 'package:daily_mobile_app/src/data/repository/tag/tag_storage_rep_impl.dart';
import 'package:daily_mobile_app/src/data/service/auth/auth_service.dart';
import 'package:daily_mobile_app/src/data/service/posts/posts_service.dart';
import 'package:daily_mobile_app/src/data/service/tag/tag_service.dart';
import 'package:daily_mobile_app/src/domain/interfaces/auth_repository.dart';
import 'package:daily_mobile_app/src/domain/interfaces/posts_repository.dart';
import 'package:daily_mobile_app/src/domain/interfaces/tag_repositoty.dart';
import 'package:daily_mobile_app/src/ui/posts/posts_screen.dart';
import 'package:daily_mobile_app/src/ui/auth/auth_screen.dart';
import 'package:daily_mobile_app/src/ui/start/start_screen.dart';
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
          Inject<AuthRepository>(() =>
              AuthRepositoryImpl(GitHubUrlParser(), Injector.get<ApiClient>())),

          /*Services*/
          Inject<TagService>(() => TagService(
                TagRestRepositoryImpl(Injector.get<ApiClient>()),
                Injector.get(),
              )),
          Inject<PostsService>(() => PostsService(
                Injector.get<TagStorageRepository>(),
                Injector.get<PostsRestRepository>(),
              )),
          Inject<AuthService>(() => AuthService(
              AuthUrlProviderImpl(), Injector.get<AuthRepository>())),
        ],
        builder: (_) => MaterialApp(
              title: 'Daily',
              theme: appTheme(),
              routes: {
                Routes.tags: (_) => TagsPage(),
                Routes.posts: (_) => PostsPage(),
                Routes.start: (_) => StartPage(),
                Routes.auth: (_) => AuthWebPage()
              },
            ));
  }
}

class Routes {
  static final tags = '/tags';
  static final start = '/';
  static final auth = '/auth';
  static final posts = '/posts';
}
