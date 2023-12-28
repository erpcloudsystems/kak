import 'package:easy_localization/easy_localization.dart';

class StringsManager {
  static String oneItemIsRequired(String itemClassification) {
    final String translated = 'one is must be chosen'.tr();
    return '$itemClassification $translated';
  }

  static String itemIsRequired(String itemClassification) {
    final String translated = 'is required'.tr();
    return '$itemClassification $translated';
  }

  static String maximumNumberError(String maxNumber) {
    final String translated = 'max number'.tr();
    return '$maxNumber $translated';
  }

  static String serverFailureMessage =
      'There is Error with Server, Please try again later'.tr().tr();
  static const String offlineFailureMessage =
      'There is a problem with your internet connection';
  static  String passwordLengthValidationMessage =
      'password shouldn\'t be less than 6 characters'.tr();
  static  String unknownCachingFailureMessage =
      'There is a problem while caching user data'.tr();
  static  String sendEmailMessage =
      'Please, Enter your E-mail address So that we could send you an email to reset your password'.tr();
  static  String resetPasswordAlertMessage =
      'A reset password email is sent to your Email, Please rest your password and Try to sign in again'.tr();
  static  String createdAccountSuccessfully =
      'You have created your account successfully!'.tr();
  static  String clickHereToDetermineYourOrderType =
      'Click here to determine your order type'.tr();
  static  String accessLocation =
      'Kak needs to access your location to help find your address'.tr();
  static  String emptyCacheFailureMessage = 'There is no cached user data'.tr();
  static  String noCartItemsMessage =
      'There is no items yet in your cart!'.tr();
  static  String loginFirstMessage =
      'You have to login first to make an order'.tr();
  static  String deleteAddressMessage =
      'Your address deleted successfully'.tr();
  static  String duplicationError =
      'Yor already added this item to ur cart'.tr();
  static  String newAddressMessage = 'Your new address added successfully'.tr();
  static  String deleteItemMessage = 'Are you sure to delete this item?'.tr();
  static  String deleteAccountMessage = 'You have deleted your account'.tr();
  static  String removedFromCartMessage = 'Item removed from your cart'.tr();
  static  String phoneNumberMessage = 'Please, enter your phone number'.tr();
  static  String passwordValidateMessage = 'please enter your Password'.tr();
  static  String enableLocation = 'Please open your location service'.tr();
  static  String logoutMessage = 'You have logged out successfully'.tr();
  static  String completeMealMessage = 'Please, complete your meal'.tr();
  static  String additionalDir = 'Additional directions (optional)'.tr();
  static  String alreadyHaveAnAccount = 'Already have an account?'.tr();
  static  String emailValidateMessage = 'please enter your E-mail'.tr();
  static  String orderCreated = 'Your order created successfully'.tr();
  static  String emptyValidator = 'This field must have a value'.tr();
  static  String unKnownErrorOccurred = 'Unknown Error Occurred'.tr();
  static  String authenticationDividerText = 'or continue with'.tr();
  static  String defaultAddress = 'Is this ur default address'.tr();
  static  String dontHaveAnAccount = 'Don\'t have an account?'.tr();
  static  String signInWithPassword = 'Sign in with password'.tr();
  static  String selectUrTerritory = 'Select your territory'.tr();
  static  String loginToUrAccount = 'Login To Your Account?'.tr();
  static  String createOrderMessage = 'Creating your order'.tr();
  static  String deliveryAddresses = 'Delivery addresses'.tr();
  static  String cartAddedMessage = 'Added to your cart'.tr();
  static  String deliveryLocation = 'Delivery location'.tr();
  static  String errorMessage = 'Something went wrong!'.tr();
  static  String forgotPassword = 'Forgot The Password'.tr();
  static  String noAddressMessage = 'No Addresses yet!'.tr();
  static  String chooseOrderType = 'Choose order type'.tr();
  static  String savingAddress = 'Saving your address'.tr();
  static  String productDetails = 'Product Details'.tr();
  static  String previousOrders = 'Previous orders'.tr();
  static  String paymentSummary = 'Payment summary'.tr();
  static  String loading = 'Loading, Please wait!'.tr();
  static  String deleteAccount = 'Delete account'.tr();
  static  String paymentMethod = 'payment Method'.tr();
  static  String reorderedMeal = 'Reordered meal'.tr();
  static  String orderDetails = 'Order details'.tr();
  static  String create = 'Create Your Account'.tr();
  static  String buildingName = 'Building name'.tr();
  static  String continueWith = 'Continue with'.tr();
  static  String addAddress = 'Add new address'.tr();
  static  String floorOpt = 'Floor (optional)'.tr();
  static  String title = 'Your address title'.tr();
  static  String apartmentNumber = 'Apt. no.'.tr();
  static  String saveAddress = 'Save address'.tr();
  static  String deliverHere = 'Deliver here'.tr();
  static  String createOrder = 'Create Order'.tr();
  static  String deliveryFee = 'Delivery Fee'.tr();
  static  String totalAmount = 'Total amount'.tr();
  static  String description = 'Description'.tr();
  static  String getStarted = 'Get started'.tr();
  static  String placeOrder = 'Place order'.tr();
  static  String urDetails = 'Your details'.tr();
  static  String rememberMe = 'Remember me'.tr();
  static  String newAddress = 'New address'.tr();
  static  String creditCard = 'Credit Card'.tr();
  static  String addToCart = 'Add to Cart'.tr();
  static  String directions = 'Directions'.tr();
  static  String catagories = 'Categories'.tr();
  static  String categories = 'Categories'.tr();
  static  String firstName = 'First Name'.tr();
  static  String contactUs = 'Contact us'.tr();
  static  String birthDate = 'Birth Date'.tr();
  static  String myAccount = 'My Account'.tr();
  static  String myAddress = 'My Address'.tr();
  static  String territory = 'Territory'.tr();
  static  String myOrders = 'My Orders'.tr();
  static  String lastName = 'Last Name'.tr();
  static  String allItems = 'All Items'.tr();
  static  String userName = 'User Name'.tr();
  static  String quantity = 'Quantity:'.tr();
  static  String total = 'Total Price'.tr();
  static  String subtotal = 'Subtotal'.tr();
  static  String register = 'Register'.tr();
  static  String checkout = 'Checkout'.tr();
  static  String password = 'Password'.tr();
  static  String facebook = 'Facebook'.tr();
  static  String deleting = 'Deleting'.tr();
  static  String payWith = 'Pay with'.tr();
  static  String reorder = 'Reorder'.tr();
  static  String status = 'Status: '.tr();
  static  String profile = 'Profile'.tr();
  static  String sendEmail = 'Send Email'.tr();
  static  String version = 'Version'.tr();
  static  String seeAll = 'See all'.tr();
  static  String signIn = 'Sign in'.tr();
  static  String signUp = 'Sign up'.tr();
  static  String street = 'Street'.tr();
  static  String logout = 'Logout'.tr();
  static  String change = 'Change'.tr();
  static  String filter = 'Filter'.tr();
  static  String female = 'Female'.tr();
  static  String gender = 'Gender'.tr();
  static  String google = 'Google'.tr();
  static  String search = 'search'.tr();
  static  String login = 'Login'.tr();
  static  String guest = 'Guest'.tr();
  static  String enter = 'Enter'.tr();
  static  String email = 'Email'.tr();
  static  String floor = 'Floor'.tr();
  static  String date = 'Date: '.tr();
  static  String phone = 'Phone'.tr();
  static  String cost = 'Cost: '.tr();
  static  String items = 'Items'.tr();
  static  String none = 'None'.tr();
  static  String area = 'Area'.tr();
  static  String cash = 'Cash'.tr();
  static  String sort = 'Sort'.tr();
  static  String save = 'Save'.tr();
  static  String okay = 'Okay'.tr();
  static  String cart = 'Cart'.tr();
  static  String menu = 'Menu'.tr();
  static  String male = 'Male'.tr();
  static  String home = 'Home'.tr();
  static  String all = 'All'.tr();
  static  String yes = 'Yes'.tr();
  static  String tax = 'Tax'.tr();
  static  String or = 'Or'.tr();
  static  String no = 'No'.tr();
}

abstract class UnTranslatedStrings {
  static const String english = 'English';
  static const String appName = 'Kak';
  static const String arabic = 'عربي';
  static const String egp = 'EGP';
  static const String en = 'en';
}
