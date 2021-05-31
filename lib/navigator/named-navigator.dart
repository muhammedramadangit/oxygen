class Routes {
  static const SIGNUP_ROUTER = "SIGNUP_ROUTER";
  static const RESET_PASSWORD = "RESET_PASSWORD";
  static const SPLASH_ROUTER = "SPLASH_ROUTER";
  static const LOG_IN = "LOG_IN";
  static const MAIN_ROUTER = "MAIN_ROUTER";
  static const ABOUT_US = "ABOUT_US";
  static const CHANGE_CURRENCY = "CHANGE_CURRENCY";
  static const UPDATE_PROFILE= "UPDATE_PROFILE";
  static const UPDATE_PASSWORD= "UPDATE_PASSWORD";
  static const COMPLETE_ORDER = "COMPLETE_ORDER";
  static const FAVOURITE = "FAVOURITE";
  static const COMPARE = "COMPARE";
  static const AFTER_COMPLETE = "AFTER_COMPLETE";
  static const MY_APP = "MY_APP";
  static const CATEGORIES = "CATEGORIES";
  static const CART = "CART";
  static const ADDRESSES = "ADDRESSES";
  static const NEW_ADDRESS = "NEW_ADDRESS";
  static const ORDER_CONFIRM = "ORDER_CONFIRM";
  static const CATEGORY_PRODUCTS = "CATEGORY_PRODUCTS";
  static const EDIT_ADDRESS = "EDIT_ADDRESS";
  static const SHIPPING_METHODS = "SHIPPING_METHODS";
  



  static const MAIN_PAGE = "MAIN_PAGE";
  static const CONTACT_US = "CONTACT_US";
  static const CHOOSE_LANGUAGE = "CHOOSE_LANGUAGE";
  static const TERMS_AND_CONDITIONS = "TERMS_AND_CONDITIONS";
  static const CURRENCY = "CURRENCY";
  static const OFFERS = "OFFERS";
  static const EDIT_MY_ACCOUNT = "EDIT_MY_ACCOUNT";
  static const CHANGE_PASSWORD = "CHANGE_PASSWORD";
  static const MY_ORDERS = "MY_ORDERS";
  static const ORDER_DETAILS = "ORDER_DETAILS";
  static const SHIPPING_ADDRESSES = "SHIPPING_ADDRESSES";
  static const NEW_SHIPPING_ADDRESSES = "NEW_SHIPPING_ADDRESSES";
  static const SHOPPING_CART = "SHOPPING_CART";
  static const SECTIONS = "SECTIONS";
  static const SECTIONS_DETAILS = "SECTIONS_DETAILS";
  static const SEARCH = "SEARCH";
  static const CATEGORY_DETAILS = "CATEGORY_DETAILS";
  static const RATES_PAGE = "RATES_PAGE";
  static const ORDER_SHIPPING_ADRESSES = "ORDER_SHIPPING_ADRESSES";
  static const PAYMENT_TYPE = "PAYMENT_TYPE";
  static const OUR_BANK_ACCOUNTS = "OUR_BANK_ACCOUNTS";



  static const CONFIRM_SIGNUP_CODE = "CONFIRM_SIGNUP_CODE";





}

abstract class NamedNavigator {
  Future push(String routeName,
      {dynamic arguments, bool replace = false, bool clean = false});

  void pop({dynamic result});
}
