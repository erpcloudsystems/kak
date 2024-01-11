import 'package:flutter/material.dart';

import '../utils/extensions.dart';
import '../../generated/l10n.dart';

class StringsManager {
  static String oneItemIsRequired(String itemClassification) {
    String translated = 'oneChosen'.tr();
    return '$translated $itemClassification ';
  }

  static String itemIsRequired(String itemClassification) {
    String translated = 'isRequired'.tr();
    return '$itemClassification $translated';
  }

  static String maximumNumberError(String maxNumber) {
    String translated = 'maxNumber'.tr();
    return '$maxNumber $translated';
  }

  static String serverFailureMessage(BuildContext context) =>
      S.of(context).serverFailureMessage;

  static String deleteAddressMessage(BuildContext context) =>
      S.of(context).deleteAddressMessage;

  static String noCartItemsMessage(BuildContext context) =>
      S.of(context).noItems;
  static String passwordLengthValidationMessage(BuildContext context) =>
      S.of(context).passwordLengthError;
  static String unknownCachingFailureMessage(BuildContext context) =>
      S.of(context).cachingError;
  static String sendEmailMessage(BuildContext context) =>
      S.of(context).enterEmailMessage;
  static String resetPasswordAlertMessage(BuildContext context) =>
      S.of(context).resetEmailSent;
  static String createdAccountSuccessfully(BuildContext context) =>
      S.of(context).creationEmailSuccess;
  static String clickHereToDetermineYourOrderType(BuildContext context) =>
      S.of(context).clickToDetermine;
  static String accessLocation(BuildContext context) =>
      S.of(context).locationRequest;
  static String loginFirstMessage(BuildContext context) =>
      S.of(context).loginFirst;
  static String duplicationError(BuildContext context) =>
      S.of(context).duplicateItemError;
  static String newAddressMessage(BuildContext context) =>
      S.of(context).newAddressMessage;
  static String deleteItemMessage(BuildContext context) =>
      S.of(context).deleteItemMessage;
  static String deleteAccountMessage(BuildContext context) =>
      S.of(context).deleteAccountMessage;

  static String phoneNumberMessage(BuildContext context) =>
      S.of(context).phoneNumberMessage;
  static String passwordValidateMessage(BuildContext context) =>
      S.of(context).passwordValidateMessage;
  static String enableLocation(BuildContext context) =>
      S.of(context).enableLocation;
  static String logoutMessage(BuildContext context) =>
      S.of(context).logoutMessage;
  static String completeMealMessage(BuildContext context) =>
      S.of(context).completeMealMessage;
  static String additionalDir(BuildContext context) =>
      S.of(context).additionalDir;
  static String alreadyHaveAnAccount(BuildContext context) =>
      S.of(context).alreadyHaveAnAccount;
  static String emailValidateMessage(BuildContext context) =>
      S.of(context).emailValidateMessage;
  static String orderCreated(BuildContext context) =>
      S.of(context).orderCreated;
  static String emptyValidator(BuildContext context) =>
      S.of(context).emptyValidator;
  static String unKnownErrorOccurred(BuildContext context) =>
      S.of(context).unKnownErrorOccurred;
  static String authenticationDividerText(BuildContext context) =>
      S.of(context).authenticationDividerText;
  static String defaultAddress(BuildContext context) =>
      S.of(context).defaultAddress;
  static String dontHaveAnAccount(BuildContext context) =>
      S.of(context).dontHaveAnAccount;
  static String signInWithPassword(BuildContext context) =>
      S.of(context).signInWithPassword;
  static String selectUrTerritory(BuildContext context) =>
      S.of(context).selectUrTerritory;
  static String loginToUrAccount(BuildContext context) =>
      S.of(context).loginToUrAccount;
  static String createOrderMessage(BuildContext context) =>
      S.of(context).createOrderMessage;
  static String deliveryAddresses(BuildContext context) =>
      S.of(context).deliveryAddresses;
  static String cartAddedMessage(BuildContext context) =>
      S.of(context).cartAddedMessage;
  static String deliveryLocation(BuildContext context) =>
      S.of(context).deliveryLocation;
  static String forgotPassword(BuildContext context) =>
      S.of(context).forgotPassword;
  static String noAddressMessage(BuildContext context) =>
      S.of(context).noAddressMessage;
  static String chooseOrderType(BuildContext context) =>
      S.of(context).chooseOrderType;
  static String savingAddress(BuildContext context) =>
      S.of(context).savingAddress;
  static String productDetails(BuildContext context) =>
      S.of(context).productDetails;
  static String previousOrders(BuildContext context) =>
      S.of(context).previousOrders;
  static String paymentSummary(BuildContext context) =>
      S.of(context).paymentSummary;
  static String loading(BuildContext context) => S.of(context).loading;
  static String deleteAccount(BuildContext context) =>
      S.of(context).deleteAccount;
  static String paymentMethod(BuildContext context) =>
      S.of(context).paymentMethod;
  static String reorderedMeal(BuildContext context) =>
      S.of(context).reorderedMeal;
  static String orderDetails(BuildContext context) =>
      S.of(context).orderDetails;
  static String create(BuildContext context) => S.of(context).create;
  static String buildingName(BuildContext context) =>
      S.of(context).buildingName;
  static String continueWith(BuildContext context) =>
      S.of(context).continueWith;
  static String addAddress(BuildContext context) => S.of(context).addAddress;
  static String floorOpt(BuildContext context) => S.of(context).floorOpt;
  static String title(BuildContext context) => S.of(context).title;
  static String apartmentNumber(BuildContext context) =>
      S.of(context).apartmentNumber;
  static String primaryAddressChanged(BuildContext context) => S.of(context).primaryAddressChanged;
  static String updatingYourProfile(BuildContext context) => S.of(context).updatingYourProfile;
  static String changingAddress(BuildContext context) => S.of(context).changingAddress;
  static String profileUpdated(BuildContext context) => S.of(context).profileUpdated;
  static String primaryAddress(BuildContext context) => S.of(context).primaryAddress;
  static String saveAddress(BuildContext context) => S.of(context).saveAddress;
  static String changePhoto(BuildContext context) => S.of(context).changePhoto;
  static String deliverHere(BuildContext context) => S.of(context).deliverHere;
  static String createOrder(BuildContext context) => S.of(context).createOrder;
  static String deliveryFee(BuildContext context) => S.of(context).deliveryFee;
  static String totalAmount(BuildContext context) => S.of(context).totalAmount;
  static String description(BuildContext context) => S.of(context).description;
  static String editProfile(BuildContext context) => S.of(context).editProfile;
  static String getStarted(BuildContext context) => S.of(context).getStarted;
  static String placeOrder(BuildContext context) => S.of(context).placeOrder;
  static String urDetails(BuildContext context) => S.of(context).urDetails;
  static String rememberMe(BuildContext context) => S.of(context).rememberMe;
  static String newAddress(BuildContext context) => S.of(context).newAddress;
  static String creditCard(BuildContext context) => S.of(context).creditCard;
  static String addToCart(BuildContext context) => S.of(context).addToCart;
  static String directions(BuildContext context) => S.of(context).directions;
  static String catagories(BuildContext context) => S.of(context).catagories;
  static String categories(BuildContext context) => S.of(context).categories;
  static String firstName(BuildContext context) => S.of(context).firstName;
  static String contactUs(BuildContext context) => S.of(context).contactUs;
  static String birthDate(BuildContext context) => S.of(context).birthDate;
  static String myAccount(BuildContext context) => S.of(context).myAccount;
  static String myAddress(BuildContext context) => S.of(context).myAddress;
  static String territory(BuildContext context) => S.of(context).territory;
  static String myOrders(BuildContext context) => S.of(context).myOrders;
  static String lastName(BuildContext context) => S.of(context).lastName;
  static String allItems(BuildContext context) => S.of(context).allItems;
  static String userName(BuildContext context) => S.of(context).userName;
  static String quantity(BuildContext context) => S.of(context).quantity;
  static String total(BuildContext context) => S.of(context).total;
  static String subtotal(BuildContext context) => S.of(context).subtotal;
  static String register(BuildContext context) => S.of(context).register;
  static String checkout(BuildContext context) => S.of(context).checkout;
  static String password(BuildContext context) => S.of(context).password;
  static String facebook(BuildContext context) => S.of(context).facebook;
  static String deleting(BuildContext context) => S.of(context).deleting;
  static String payWith(BuildContext context) => S.of(context).payWith;
  static String reorder(BuildContext context) => S.of(context).reorder;
  static String status(BuildContext context) => S.of(context).status;
  static String profile(BuildContext context) => S.of(context).profile;
  static String sendEmail(BuildContext context) => S.of(context).sendEmail;
  static String version(BuildContext context) => S.of(context).version;
  static String seeAll(BuildContext context) => S.of(context).seeAll;
  static String signIn(BuildContext context) => S.of(context).signIn;
  static String signUp(BuildContext context) => S.of(context).signUp;
  static String street(BuildContext context) => S.of(context).street;
  static String logout(BuildContext context) => S.of(context).logout;
  static String change(BuildContext context) => S.of(context).change;
  static String filter(BuildContext context) => S.of(context).filter;
  static String female(BuildContext context) => S.of(context).female;
  static String gender(BuildContext context) => S.of(context).gender;
  static String google(BuildContext context) => S.of(context).google;
  static String search(BuildContext context) => S.of(context).search;
  static String login(BuildContext context) => S.of(context).login;
  static String guest(BuildContext context) => S.of(context).guest;
  static String enter(BuildContext context) => S.of(context).enter;
  static String email(BuildContext context) => S.of(context).email;
  static String floor(BuildContext context) => S.of(context).floor;
  static String date(BuildContext context) => S.of(context).date;
  static String phone(BuildContext context) => S.of(context).phone;
  static String cost(BuildContext context) => S.of(context).cost;
  static String items(BuildContext context) => S.of(context).items;
  static String area(BuildContext context) => S.of(context).area;
  static String cash(BuildContext context) => S.of(context).cash;
  static String sort(BuildContext context) => S.of(context).sort;
  static String save(BuildContext context) => S.of(context).save;
  static String okay(BuildContext context) => S.of(context).okay;
  static String cart(BuildContext context) => S.of(context).cart;
  static String male(BuildContext context) => S.of(context).male;
  static String home(BuildContext context) => S.of(context).home;
  static String menu(BuildContext context) => S.of(context).menu;
  static String all(BuildContext context) => S.of(context).all;
  static String yes(BuildContext context) => S.of(context).yes;
  static String tax(BuildContext context) => S.of(context).tax;
  static String or(BuildContext context) => S.of(context).or;
  static String no(BuildContext context) => S.of(context).no;
}

// These Strings used in places that have no context so we use translation extension with it.
abstract class StringsWithNoCtx {
  static const String removedFromCartMessage = 'removedFromCartMessage';
  static const String offlineFailureMessage = 'noInternetConnection';
  static const String existedItemInCart = 'existedItemInCart';
  static const String errorMessage = 'errorMessage';
  static const String none = 'none';
}

abstract class UnTranslatedStrings {
  static const String english = 'English';
  static const String appName = 'Kak';
  static const String arabic = 'عربي';
  static const String egp = 'EGP';
  static const String en = 'en';
}
