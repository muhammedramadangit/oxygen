/* import 'package:oxygen/app/appEvent.dart';
import 'package:oxygen/app/appState.dart';
import 'package:oxygen/helpers/shared_preference_manger.dart';

import 'package:oxygen/models/session/session_response.dart';
import 'package:oxygen/navigator/named-navigator.dart';
import 'package:oxygen/navigator/named-navigator_impl.dart';
import 'package:oxygen/network/networkUtlis.dart';
import 'package:oxygen/ui/main/profile/edit_profile/profile_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class SplashBloc extends Bloc<AppEvent, AppState> {
  @override
  AppState get initialState => Start(null);

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    var currency = await SharedPreferenceManager().readString(CachingKey.CURRENCY);
    print(currency);
    Map<String, String> headers = {"X-Oc-Merchant-Id": "undWnFFBhgopdceJvApGSDEyc8Hatqa0", "X-Oc-Merchant-Language": translator.currentLanguage};

    var netUtil = NetworkUtil();
    if (event is Hydrate) {
      var isLogged  =await SharedPreferenceManager().readBoolean(CachingKey.IS_LOGGED_IN);
        if (isLogged  ) {
          ProfileBloc().add(Hydrate());
          NamedNavigatorImpl().push(Routes.MAIN_ROUTER, replace: true, clean: true);
      } else {
          yield Loading(null);
          var sessionResponse = await netUtil.get(SessionResponse(), "feed/rest_api/session", headers: headers);
          if (netUtil.response.statusCode == 200) {
            if (currency == null || currency == '') SharedPreferenceManager().writeData(CachingKey.CURRENCY, "SAR");
            SharedPreferenceManager().writeData(CachingKey.SESSION, sessionResponse.data.session);
          NamedNavigatorImpl().push(Routes.LOG_IN, replace: true, clean: true);
        }
        yield Done(sessionResponse);
      }
    }
  }
}
 */