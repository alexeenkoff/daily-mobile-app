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
      onIdle: () => Container(),
      onData: (_) => Container(),
      onError: (_) => Container(),
      onWaiting: () => Container(),
    );

//    return WebView(
//      onWebViewCreated: (controller) {
//        clearCookies(cookieManager);
//        controller.clearCache();
//      },
//      javascriptMode: JavascriptMode.unrestricted,
//      initialUrl:
//      'https://github.com/login?client_id=92d76a890e5c6144a4af&return_to=%2Flogin%2Foauth%2Fauthorize%3Faccess_type%3Doffline%26client_id%3D92d76a890e5c6144a4af%26redirect_uri%3Dhttps%253A%252F%252Fapp.dailynow.co%252Fv1%252Fauth%252Fcallback%26response_type%3Dcode%26scope%3Duser%253Aemail%26state%3D%257B%2522provider%2522%253A%2522github%2522%252C%2522redirect_uri%2522%253A%2522moz-extension%253A%252F%252Ff86cc5f4-01cb-9542-8c9c-41bde03d68b5%252Findex.html%253Fprovider%253Dgithub%2522%252C%2522code_challenge%2522%253A%2522QZnwtMqOpzX3FQwv_d6w1u9sK9n5qg_oaiQIRrjcyZE%2522%257D',
//      onPageStarted: (url) {
//        if (url.contains('moz-extension://')) {
//          _parseRedirect(url);
//        }
//      },
//      onWebResourceError: (error) {
//        int x = 0;
//      },
//    );
  }

  void clearCookies(CookieManager manager) async {
    manager.clearCookies();
  }

  void _parseRedirect(String url) {
    int x = 0;
  }
}
