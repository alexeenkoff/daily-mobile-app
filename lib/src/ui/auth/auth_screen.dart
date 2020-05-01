import 'package:daily_mobile_app/src/data/service/auth/auth_service.dart';
import 'package:daily_mobile_app/src/domain/interfaces/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AuthWebPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthWebPage> {
  ReactiveModel<AuthService> _authServiceWM =
      Injector.getAsReactive<AuthService>();

  @override
  Widget build(BuildContext context) {
    final CookieManager cookieManager = CookieManager();
    cookieManager.clearCookies();
    final Provider provider = ModalRoute.of(context).settings.arguments;
    _authServiceWM.value.initState(provider);
    return WhenRebuilder(
      models: [_authServiceWM],
      onIdle: () => buildWebView(cookieManager),
      onData: (_) => Container(),
      onError: (_) => Container(),
      onWaiting: () => Container(),
    );
  }

  WebView buildWebView(CookieManager cookieManager) {
    return WebView(
      onWebViewCreated: (controller) {
        clearCookies(cookieManager);
        controller.clearCache();
      },
      javascriptMode: JavascriptMode.unrestricted,
      initialUrl: _authServiceWM.value.authUrl,
      onPageStarted: (url) {
        if (url.contains('moz-extension://')) {
          _parseRedirect(url);
        }
      },
      onWebResourceError: (error) {
        int x = 0;
      },
    );
  }

  void clearCookies(CookieManager manager) async {
    manager.clearCookies();
  }

  void _parseRedirect(String url) {
    int x = 0;
  }
}
