// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Please Enter your E-mail address So that we could send you an email to reset your password`
  String get enterEmailMessage {
    return Intl.message(
      'Please Enter your E-mail address So that we could send you an email to reset your password',
      name: 'enterEmailMessage',
      desc: '',
      args: [],
    );
  }

  /// `A reset password email is sent to your Email Please rest your password and Try to sign in again`
  String get resetEmailSent {
    return Intl.message(
      'A reset password email is sent to your Email Please rest your password and Try to sign in again',
      name: 'resetEmailSent',
      desc: '',
      args: [],
    );
  }

  /// `Mumo needs to access your location to help find your address`
  String get locationRequest {
    return Intl.message(
      'Mumo needs to access your location to help find your address',
      name: 'locationRequest',
      desc: '',
      args: [],
    );
  }

  /// `There is Error with Server Please try again later`
  String get serverFailureMessage {
    return Intl.message(
      'There is Error with Server Please try again later',
      name: 'serverFailureMessage',
      desc: '',
      args: [],
    );
  }

  /// `'There is a problem with your internet connection`
  String get noInternetConnection {
    return Intl.message(
      '\'There is a problem with your internet connection',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `password shouldn"t be less than 6 characters`
  String get passwordLengthError {
    return Intl.message(
      'password shouldn"t be less than 6 characters',
      name: 'passwordLengthError',
      desc: '',
      args: [],
    );
  }

  /// `You have created your account successfully!`
  String get creationEmailSuccess {
    return Intl.message(
      'You have created your account successfully!',
      name: 'creationEmailSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Your default address changed successfully`
  String get primaryAddressChanged {
    return Intl.message(
      'Your default address changed successfully',
      name: 'primaryAddressChanged',
      desc: '',
      args: [],
    );
  }

  /// `You logged in successfully with Facebook`
  String get successLoginWithFace {
    return Intl.message(
      'You logged in successfully with Facebook',
      name: 'successLoginWithFace',
      desc: '',
      args: [],
    );
  }

  /// `There is error while login with Facebook`
  String get errorLoginWithFace {
    return Intl.message(
      'There is error while login with Facebook',
      name: 'errorLoginWithFace',
      desc: '',
      args: [],
    );
  }

  /// ` is what you can add to your meal from this item`
  String get maxNumber {
    return Intl.message(
      ' is what you can add to your meal from this item',
      name: 'maxNumber',
      desc: '',
      args: [],
    );
  }

  /// `You already added this item to ur cart`
  String get duplicateItemError {
    return Intl.message(
      'You already added this item to ur cart',
      name: 'duplicateItemError',
      desc: '',
      args: [],
    );
  }

  /// `You cancelled login with Facebook`
  String get cancelledLoginWithFace {
    return Intl.message(
      'You cancelled login with Facebook',
      name: 'cancelledLoginWithFace',
      desc: '',
      args: [],
    );
  }

  /// `Click here to determine your order type`
  String get clickToDetermine {
    return Intl.message(
      'Click here to determine your order type',
      name: 'clickToDetermine',
      desc: '',
      args: [],
    );
  }

  /// `There is a problem while caching user data`
  String get cachingError {
    return Intl.message(
      'There is a problem while caching user data',
      name: 'cachingError',
      desc: '',
      args: [],
    );
  }

  /// `Your address deleted successfully`
  String get deleteAddressMessage {
    return Intl.message(
      'Your address deleted successfully',
      name: 'deleteAddressMessage',
      desc: '',
      args: [],
    );
  }

  /// `Your new address added successfully`
  String get newAddressMessage {
    return Intl.message(
      'Your new address added successfully',
      name: 'newAddressMessage',
      desc: '',
      args: [],
    );
  }

  /// `You have to login first to make an order`
  String get loginFirst {
    return Intl.message(
      'You have to login first to make an order',
      name: 'loginFirst',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to delete this item?`
  String get deleteItemMessage {
    return Intl.message(
      'Are you sure to delete this item?',
      name: 'deleteItemMessage',
      desc: '',
      args: [],
    );
  }

  /// `You have deleted your account`
  String get deleteAccountMessage {
    return Intl.message(
      'You have deleted your account',
      name: 'deleteAccountMessage',
      desc: '',
      args: [],
    );
  }

  /// `This Item is already on the cart`
  String get existedItemInCart {
    return Intl.message(
      'This Item is already on the cart',
      name: 'existedItemInCart',
      desc: '',
      args: [],
    );
  }

  /// `Item removed from your cart`
  String get removedFromCartMessage {
    return Intl.message(
      'Item removed from your cart',
      name: 'removedFromCartMessage',
      desc: '',
      args: [],
    );
  }

  /// `Please, enter your phone number`
  String get phoneNumberMessage {
    return Intl.message(
      'Please, enter your phone number',
      name: 'phoneNumberMessage',
      desc: '',
      args: [],
    );
  }

  /// `please enter your Password`
  String get passwordValidateMessage {
    return Intl.message(
      'please enter your Password',
      name: 'passwordValidateMessage',
      desc: '',
      args: [],
    );
  }

  /// `Please open your location service`
  String get enableLocation {
    return Intl.message(
      'Please open your location service',
      name: 'enableLocation',
      desc: '',
      args: [],
    );
  }

  /// `Your profile updated successfully`
  String get profileUpdated {
    return Intl.message(
      'Your profile updated successfully',
      name: 'profileUpdated',
      desc: '',
      args: [],
    );
  }

  /// `You have logged out successfully`
  String get logoutMessage {
    return Intl.message(
      'You have logged out successfully',
      name: 'logoutMessage',
      desc: '',
      args: [],
    );
  }

  /// `Please, complete your meal`
  String get completeMealMessage {
    return Intl.message(
      'Please, complete your meal',
      name: 'completeMealMessage',
      desc: '',
      args: [],
    );
  }

  /// `Changing your default address`
  String get changingAddress {
    return Intl.message(
      'Changing your default address',
      name: 'changingAddress',
      desc: '',
      args: [],
    );
  }

  /// `Additional directions (optional)`
  String get additionalDir {
    return Intl.message(
      'Additional directions (optional)',
      name: 'additionalDir',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `please enter your E-mail`
  String get emailValidateMessage {
    return Intl.message(
      'please enter your E-mail',
      name: 'emailValidateMessage',
      desc: '',
      args: [],
    );
  }

  /// `Your order created successfully`
  String get orderCreated {
    return Intl.message(
      'Your order created successfully',
      name: 'orderCreated',
      desc: '',
      args: [],
    );
  }

  /// `This field must have a value`
  String get emptyValidator {
    return Intl.message(
      'This field must have a value',
      name: 'emptyValidator',
      desc: '',
      args: [],
    );
  }

  /// `There is no items yet in your cart!`
  String get noItems {
    return Intl.message(
      'There is no items yet in your cart!',
      name: 'noItems',
      desc: '',
      args: [],
    );
  }

  /// `Unknown Error Occurred`
  String get unKnownErrorOccurred {
    return Intl.message(
      'Unknown Error Occurred',
      name: 'unKnownErrorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `or continue with`
  String get authenticationDividerText {
    return Intl.message(
      'or continue with',
      name: 'authenticationDividerText',
      desc: '',
      args: [],
    );
  }

  /// `Is this ur default address`
  String get defaultAddress {
    return Intl.message(
      'Is this ur default address',
      name: 'defaultAddress',
      desc: '',
      args: [],
    );
  }

  /// `Updating your profile`
  String get updatingYourProfile {
    return Intl.message(
      'Updating your profile',
      name: 'updatingYourProfile',
      desc: '',
      args: [],
    );
  }

  /// `Don"t have an account?`
  String get dontHaveAnAccount {
    return Intl.message(
      'Don"t have an account?',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with password`
  String get signInWithPassword {
    return Intl.message(
      'Sign in with password',
      name: 'signInWithPassword',
      desc: '',
      args: [],
    );
  }

  /// `Select your territory`
  String get selectUrTerritory {
    return Intl.message(
      'Select your territory',
      name: 'selectUrTerritory',
      desc: '',
      args: [],
    );
  }

  /// `Login To Your Account?`
  String get loginToUrAccount {
    return Intl.message(
      'Login To Your Account?',
      name: 'loginToUrAccount',
      desc: '',
      args: [],
    );
  }

  /// `Creating your order`
  String get createOrderMessage {
    return Intl.message(
      'Creating your order',
      name: 'createOrderMessage',
      desc: '',
      args: [],
    );
  }

  /// `is must be chosen, at least 1`
  String get oneMust {
    return Intl.message(
      'is must be chosen, at least 1',
      name: 'oneMust',
      desc: '',
      args: [],
    );
  }

  /// `Delivery addresses`
  String get deliveryAddresses {
    return Intl.message(
      'Delivery addresses',
      name: 'deliveryAddresses',
      desc: '',
      args: [],
    );
  }

  /// `Added to your cart`
  String get cartAddedMessage {
    return Intl.message(
      'Added to your cart',
      name: 'cartAddedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Delivery location`
  String get deliveryLocation {
    return Intl.message(
      'Delivery location',
      name: 'deliveryLocation',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong!`
  String get errorMessage {
    return Intl.message(
      'Something went wrong!',
      name: 'errorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Forgot The Password`
  String get forgotPassword {
    return Intl.message(
      'Forgot The Password',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `No Addresses yet!`
  String get noAddressMessage {
    return Intl.message(
      'No Addresses yet!',
      name: 'noAddressMessage',
      desc: '',
      args: [],
    );
  }

  /// `Choose order type`
  String get chooseOrderType {
    return Intl.message(
      'Choose order type',
      name: 'chooseOrderType',
      desc: '',
      args: [],
    );
  }

  /// `Saving your address`
  String get savingAddress {
    return Intl.message(
      'Saving your address',
      name: 'savingAddress',
      desc: '',
      args: [],
    );
  }

  /// `one is must be chosen`
  String get oneChosen {
    return Intl.message(
      'one is must be chosen',
      name: 'oneChosen',
      desc: '',
      args: [],
    );
  }

  /// `Change your photo`
  String get changePhoto {
    return Intl.message(
      'Change your photo',
      name: 'changePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Product Details`
  String get productDetails {
    return Intl.message(
      'Product Details',
      name: 'productDetails',
      desc: '',
      args: [],
    );
  }

  /// `Previous orders`
  String get previousOrders {
    return Intl.message(
      'Previous orders',
      name: 'previousOrders',
      desc: '',
      args: [],
    );
  }

  /// `Payment summary`
  String get paymentSummary {
    return Intl.message(
      'Payment summary',
      name: 'paymentSummary',
      desc: '',
      args: [],
    );
  }

  /// `Default address`
  String get primaryAddress {
    return Intl.message(
      'Default address',
      name: 'primaryAddress',
      desc: '',
      args: [],
    );
  }

  /// `Loading, Please wait!`
  String get loading {
    return Intl.message(
      'Loading, Please wait!',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `is must be chosen`
  String get isRequired {
    return Intl.message(
      'is must be chosen',
      name: 'isRequired',
      desc: '',
      args: [],
    );
  }

  /// `Delete account`
  String get deleteAccount {
    return Intl.message(
      'Delete account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `payment Method`
  String get paymentMethod {
    return Intl.message(
      'payment Method',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Reordered meal`
  String get reorderedMeal {
    return Intl.message(
      'Reordered meal',
      name: 'reorderedMeal',
      desc: '',
      args: [],
    );
  }

  /// `Order details`
  String get orderDetails {
    return Intl.message(
      'Order details',
      name: 'orderDetails',
      desc: '',
      args: [],
    );
  }

  /// `Create Your Account`
  String get create {
    return Intl.message(
      'Create Your Account',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Building name`
  String get buildingName {
    return Intl.message(
      'Building name',
      name: 'buildingName',
      desc: '',
      args: [],
    );
  }

  /// `Continue with`
  String get continueWith {
    return Intl.message(
      'Continue with',
      name: 'continueWith',
      desc: '',
      args: [],
    );
  }

  /// `Add new address`
  String get addAddress {
    return Intl.message(
      'Add new address',
      name: 'addAddress',
      desc: '',
      args: [],
    );
  }

  /// `Floor (optional)`
  String get floorOpt {
    return Intl.message(
      'Floor (optional)',
      name: 'floorOpt',
      desc: '',
      args: [],
    );
  }

  /// `Your address title`
  String get title {
    return Intl.message(
      'Your address title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Apt. no.`
  String get apartmentNumber {
    return Intl.message(
      'Apt. no.',
      name: 'apartmentNumber',
      desc: '',
      args: [],
    );
  }

  /// `Save address`
  String get saveAddress {
    return Intl.message(
      'Save address',
      name: 'saveAddress',
      desc: '',
      args: [],
    );
  }

  /// `Deliver here`
  String get deliverHere {
    return Intl.message(
      'Deliver here',
      name: 'deliverHere',
      desc: '',
      args: [],
    );
  }

  /// `Create Order`
  String get createOrder {
    return Intl.message(
      'Create Order',
      name: 'createOrder',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Fee`
  String get deliveryFee {
    return Intl.message(
      'Delivery Fee',
      name: 'deliveryFee',
      desc: '',
      args: [],
    );
  }

  /// `Total amount`
  String get totalAmount {
    return Intl.message(
      'Total amount',
      name: 'totalAmount',
      desc: '',
      args: [],
    );
  }

  /// `Edit profile`
  String get editProfile {
    return Intl.message(
      'Edit profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Get started`
  String get getStarted {
    return Intl.message(
      'Get started',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }

  /// `Place order`
  String get placeOrder {
    return Intl.message(
      'Place order',
      name: 'placeOrder',
      desc: '',
      args: [],
    );
  }

  /// `Your details`
  String get urDetails {
    return Intl.message(
      'Your details',
      name: 'urDetails',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get rememberMe {
    return Intl.message(
      'Remember me',
      name: 'rememberMe',
      desc: '',
      args: [],
    );
  }

  /// `New address`
  String get newAddress {
    return Intl.message(
      'New address',
      name: 'newAddress',
      desc: '',
      args: [],
    );
  }

  /// `Credit Card`
  String get creditCard {
    return Intl.message(
      'Credit Card',
      name: 'creditCard',
      desc: '',
      args: [],
    );
  }

  /// `Add to Cart`
  String get addToCart {
    return Intl.message(
      'Add to Cart',
      name: 'addToCart',
      desc: '',
      args: [],
    );
  }

  /// `Directions`
  String get directions {
    return Intl.message(
      'Directions',
      name: 'directions',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get catagories {
    return Intl.message(
      'Categories',
      name: 'catagories',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message(
      'First Name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Contact us`
  String get contactUs {
    return Intl.message(
      'Contact us',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `Birth Date`
  String get birthDate {
    return Intl.message(
      'Birth Date',
      name: 'birthDate',
      desc: '',
      args: [],
    );
  }

  /// `Send Email`
  String get sendEmail {
    return Intl.message(
      'Send Email',
      name: 'sendEmail',
      desc: '',
      args: [],
    );
  }

  /// `My Account`
  String get myAccount {
    return Intl.message(
      'My Account',
      name: 'myAccount',
      desc: '',
      args: [],
    );
  }

  /// `My Address`
  String get myAddress {
    return Intl.message(
      'My Address',
      name: 'myAddress',
      desc: '',
      args: [],
    );
  }

  /// `Territory`
  String get territory {
    return Intl.message(
      'Territory',
      name: 'territory',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get myOrders {
    return Intl.message(
      'My Orders',
      name: 'myOrders',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `All Items`
  String get allItems {
    return Intl.message(
      'All Items',
      name: 'allItems',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get userName {
    return Intl.message(
      'User Name',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `Quantity:`
  String get quantity {
    return Intl.message(
      'Quantity:',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `Total Price`
  String get total {
    return Intl.message(
      'Total Price',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal`
  String get subtotal {
    return Intl.message(
      'Subtotal',
      name: 'subtotal',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Checkout`
  String get checkout {
    return Intl.message(
      'Checkout',
      name: 'checkout',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Facebook`
  String get facebook {
    return Intl.message(
      'Facebook',
      name: 'facebook',
      desc: '',
      args: [],
    );
  }

  /// `Deleting`
  String get deleting {
    return Intl.message(
      'Deleting',
      name: 'deleting',
      desc: '',
      args: [],
    );
  }

  /// `Pay with`
  String get payWith {
    return Intl.message(
      'Pay with',
      name: 'payWith',
      desc: '',
      args: [],
    );
  }

  /// `Reorder`
  String get reorder {
    return Intl.message(
      'Reorder',
      name: 'reorder',
      desc: '',
      args: [],
    );
  }

  /// `Status: `
  String get status {
    return Intl.message(
      'Status: ',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `minutes`
  String get minutes {
    return Intl.message(
      'minutes',
      name: 'minutes',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Version`
  String get version {
    return Intl.message(
      'Version',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  /// `See all`
  String get seeAll {
    return Intl.message(
      'See all',
      name: 'seeAll',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signIn {
    return Intl.message(
      'Sign in',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message(
      'Sign up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Street`
  String get street {
    return Intl.message(
      'Street',
      name: 'street',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get change {
    return Intl.message(
      'Change',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Google`
  String get google {
    return Intl.message(
      'Google',
      name: 'google',
      desc: '',
      args: [],
    );
  }

  /// `search`
  String get search {
    return Intl.message(
      'search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `within`
  String get within {
    return Intl.message(
      'within',
      name: 'within',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Guest`
  String get guest {
    return Intl.message(
      'Guest',
      name: 'guest',
      desc: '',
      args: [],
    );
  }

  /// `Enter`
  String get enter {
    return Intl.message(
      'Enter',
      name: 'enter',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Floor`
  String get floor {
    return Intl.message(
      'Floor',
      name: 'floor',
      desc: '',
      args: [],
    );
  }

  /// `Date: `
  String get date {
    return Intl.message(
      'Date: ',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Cost: `
  String get cost {
    return Intl.message(
      'Cost: ',
      name: 'cost',
      desc: '',
      args: [],
    );
  }

  /// `Items`
  String get items {
    return Intl.message(
      'Items',
      name: 'items',
      desc: '',
      args: [],
    );
  }

  /// `None`
  String get none {
    return Intl.message(
      'None',
      name: 'none',
      desc: '',
      args: [],
    );
  }

  /// `Area`
  String get area {
    return Intl.message(
      'Area',
      name: 'area',
      desc: '',
      args: [],
    );
  }

  /// `Cash`
  String get cash {
    return Intl.message(
      'Cash',
      name: 'cash',
      desc: '',
      args: [],
    );
  }

  /// `Sort`
  String get sort {
    return Intl.message(
      'Sort',
      name: 'sort',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Okay`
  String get okay {
    return Intl.message(
      'Okay',
      name: 'okay',
      desc: '',
      args: [],
    );
  }

  /// `Menu`
  String get menu {
    return Intl.message(
      'Menu',
      name: 'menu',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Tax`
  String get tax {
    return Intl.message(
      'Tax',
      name: 'tax',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message(
      'Or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar', countryCode: 'EG'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
