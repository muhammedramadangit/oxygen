import 'package:flutter/material.dart';
import 'package:oxygen/UI/Sections/section_Details.dart';
import 'package:oxygen/UI/auth/login/login.dart';
import 'package:oxygen/UI/auth/reset_password/resetPassword.dart';
import 'package:oxygen/UI/auth/signup/Signup.dart';
import 'package:oxygen/UI/auth/signup/confirm_code.dart';
import 'package:oxygen/UI/contact_us/contact_us.dart';
import 'package:oxygen/UI/currency/currency.dart';
import 'package:oxygen/UI/language/language.dart';
import 'package:oxygen/UI/main/main_page.dart';
import 'package:oxygen/UI/main/shopping_cart/shopping_Cart.dart';
import 'package:oxygen/UI/main/profile/edit_profile/edit_profile.dart';
import 'package:oxygen/UI/offers/offers.dart';
import 'package:oxygen/UI/splash/splash_page.dart';
import 'package:oxygen/UI/terms_and_conditions/terms_and_conditions.dart';
import 'package:oxygen/UI/main/profile/change_password/change_password.dart';
import 'package:oxygen/UI/main/profile/my_orders/my_Orders.dart';
import 'package:oxygen/UI/main/profile/my_orders/order_details/order_details.dart';
import 'package:oxygen/UI/main/profile/shipping_addresses/shipping_adresses.dart';
import 'package:oxygen/UI/main/profile/shipping_addresses/add_new_address/add_new_address.dart';
import 'package:oxygen/UI/Sections/Sections.dart';
import 'package:oxygen/UI/search/search.dart';
import 'package:oxygen/UI/categories/Category_details.dart';
import 'package:oxygen/UI/categories/components/Rate_Page.dart';
import 'package:oxygen/UI/order_shipping_addresses/order_Shipping_adresses.dart';
import 'package:oxygen/UI/payment_type/payment_Type.dart';
import 'package:oxygen/UI/our_bank_accounts/Our_bank_accounts.dart';
import 'package:oxygen/main.dart';
import 'named-navigator.dart';

class NamedNavigatorImpl implements NamedNavigator {
  static final GlobalKey<NavigatorState> navigatorState = new GlobalKey<NavigatorState>();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.MY_APP:
        return MaterialPageRoute(builder: (_) => MyApp());
      case Routes.SPLASH_ROUTER:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case Routes.LOG_IN:
        return MaterialPageRoute(builder: (_) => LogIn());
      case Routes.SIGNUP_ROUTER:
        return MaterialPageRoute(builder: (_) => SignUp());
      case Routes.RESET_PASSWORD:
        return MaterialPageRoute(builder: (_) => ResetPassword());
      case Routes.CONFIRM_SIGNUP_CODE:
        return MaterialPageRoute(builder: (_) => ConfirmSignUpCode());
      case Routes.MAIN_PAGE:
        return MaterialPageRoute(builder: (_) => MainPage(index: settings.arguments,));
      case Routes.CONTACT_US:
        return MaterialPageRoute(builder: (_) => ContactUs());
      case Routes.CHOOSE_LANGUAGE:
        return MaterialPageRoute(builder: (_) => ChooseLanguage());
      case Routes.TERMS_AND_CONDITIONS:
        return MaterialPageRoute(builder: (_) => TermsAndCondition());
      case Routes.CURRENCY:
        return MaterialPageRoute(builder: (_) => Currency());
      case Routes.OFFERS:
        return MaterialPageRoute(builder: (_) => Offers());
      case Routes.EDIT_MY_ACCOUNT:
        return MaterialPageRoute(builder: (_) => EditMyAccount());
      case Routes.CHANGE_PASSWORD:
        return MaterialPageRoute(builder: (_) => ChangePassword());
      case Routes.MY_ORDERS:
        return MaterialPageRoute(builder: (_) => MyOrders());
      case Routes.ORDER_DETAILS:
        return MaterialPageRoute(builder: (_) => OrderDetails());
      case Routes.SHIPPING_ADDRESSES:
        return MaterialPageRoute(builder: (_) => ShippingAddresses());
      case Routes.NEW_SHIPPING_ADDRESSES:
        return MaterialPageRoute(builder: (_) => AddNewAddress());
      case Routes.SHOPPING_CART:
        return MaterialPageRoute(builder: (_) => ShoppingCart());
      case Routes.SECTIONS:
        return MaterialPageRoute(builder: (_) => Sections());
      case Routes.SECTIONS_DETAILS:
        return MaterialPageRoute(builder: (_) => SectionDetails());
      case Routes.SEARCH:
        return MaterialPageRoute(builder: (_) => Search());
      case Routes.CATEGORY_DETAILS:
        return MaterialPageRoute(
            builder: (_) => CategoryDetails(
                  categoryName: settings.arguments,
                ));
      case Routes.RATES_PAGE:
        return MaterialPageRoute(builder: (_) => RatePage());
      case Routes.ORDER_SHIPPING_ADRESSES:
        return MaterialPageRoute(builder: (_) => OrderShippingAddresses());
      case Routes.PAYMENT_TYPE:
        return MaterialPageRoute(builder: (_) => PaymentType());
      case Routes.OUR_BANK_ACCOUNTS:
        return MaterialPageRoute(builder: (_) => OurBankAccounts());
      /* case Routes.MAIN_ROUTER:
        return MaterialPageRoute(
            builder: (_) => MainPage(
                  index: settings.arguments,
                )); */
      /* case Routes.CONTACT_US:
        return MaterialPageRoute(builder: (_) => ContactUs());
      case Routes.ABOUT_US:
        return MaterialPageRoute(builder: (_) => AboutUs());
      case Routes.CHANGE_CURRENCY:
        return MaterialPageRoute(builder: (_) => ChangeCurrency());
      case Routes.COMPARE:
        return MaterialPageRoute(builder: (_) => Compare());
      case Routes.CATEGORIES:
        return MaterialPageRoute(builder: (_) => Categories());
      case Routes.SEARCH:
        return MaterialPageRoute(builder: (_) => Search());
      case Routes.CART:
        return MaterialPageRoute(builder: (_) => Cart());
      case Routes.ADDRESSES:
        return MaterialPageRoute(builder: (_) => MyAddresses(
          isFromCart: settings.arguments,
        ));
      case Routes.NEW_ADDRESS:
        return MaterialPageRoute(builder: (_) => NewAddress());
      case Routes.SHIPPING_METHODS:
        return MaterialPageRoute(builder: (_) => ShippingMethods(addressId:settings.arguments));
      case Routes.COMPLETE_ORDER:
        return MaterialPageRoute(builder: (_) => CompleteOrder());
      case Routes.ORDER_CONFIRM:
        return MaterialPageRoute(builder: (_) => OrderConfirm());
      case Routes.RATE_CONFIRM:
        return MaterialPageRoute(builder: (_) => RateConfirm());
      case Routes.UPDATE_PROFILE:
        return MaterialPageRoute(builder: (_) => Profile());
      case Routes.FAVOURITE:
        return MaterialPageRoute(builder: (_) => Favourites());
      case Routes.CATEGORY_PRODUCTS:
        return MaterialPageRoute(builder: (_) => CategoryProducts(routerModel: settings.arguments,));
      case Routes.EDIT_ADDRESS:
        return MaterialPageRoute(builder: (_) => EditAddress(addressId:settings.arguments)); */

    }
    return MaterialPageRoute(builder: (_) => Container());
  }

  @override
  void pop({dynamic result}) {
    if (navigatorState.currentState.canPop()) navigatorState.currentState.pop(result);
  }

  @override
  Future push(String routeName, {arguments, bool replace = false, bool clean = false}) {
    if (clean) return navigatorState.currentState.pushNamedAndRemoveUntil(routeName, (_) => false, arguments: arguments);

    if (replace) return navigatorState.currentState.pushReplacementNamed(routeName, arguments: arguments);

    return navigatorState.currentState.pushNamed(routeName, arguments: arguments);
  }
}
