class UrlConstant {

  static const String Demo_Base = "https://reqres.in/";
  static const String BASE_URL = "http://dotnet4.peaceofmind.in/GiftCocktail_1220/Api";
  static const String IMAGE_BASE_URL = "http://dotnet4.peaceofmind.in/GiftCocktail_1220/";

  //Login
  static const String Demo = "/api/user?page=2";
  static const String LOGIN = "/User/Login";
  static const String GET_PAYMENT_TOKEN = "/BraintreePayment/GetPaymentToken";
  static const String SAVE_PAYMENT_METHOD = "/BraintreePayment/SavePaymentMethod";
  static const String EVENT_TYPE_LIST = "/Category";
  static const String CREATE_GIFT_LINK = "/GiftLink";
  static const String UPDATE_GIFT_LINK = "/UpdateGiftLink";
  static const String VERIFY_GIFT_LINK = "/GiftLink/VerifyGiftCode";
  static const String GET_NOTIFICATION_LIST =
      "/Notification/GetNotificationList";
  static const String UPDATE_FCM_TOKEN = "/UpdateFcmToken";
  static const String SET_AS_UNREAD = "/Notification";
  static const String GET_UNREAD_NOTIFICATION_COUNT =
      "/Notification/GetCountUnread";
  static const String GET_MY_EVENT_LIST =
      "/Notification/GetEventList";
}
