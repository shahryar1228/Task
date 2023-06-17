
import 'usefull_functions.dart';

class ValidationUtils {
  static String? isIdNumberOK(String idNumber) {
    idNumber = replacePersianNumber(idNumber);
    String pattern = r'^[0-9]+$';
    RegExp regExp = new RegExp(pattern);
    if (idNumber.length == 0) {
      return "لطفا کد ملی خود را وارد کنید";
    } else if (idNumber.length != 10) {
      return "کد ملی باید ۱۰ رقم است";
    } else if (!regExp.hasMatch(idNumber)) {
      return "کد ملی نامعتبر است";
    }
    return null;
  }

  static String? isNameOK(String family) {
    String pattern = r'^([\u0600-\u06FF]+\s?)+$';
    RegExp regExp = new RegExp(pattern);
    if (family.length == 0) {
      return "لطفا نام خود را وارد کنید";
    } else if (!regExp.hasMatch(family)) {
      return "نام وارد شده نامعتبر است";
    }
    return null;
  }

  static String? isFamilyOK(String family) {
    String pattern = r'^([\u0600-\u06FF]+\s?)+$';
    RegExp regExp = new RegExp(pattern);
    if (family.length == 0) {
      return "لطفا نام خانوادگی خود را وارد کنید";
    } else if (!regExp.hasMatch(family)) {
      return "نام خانوادگی وارد شده نامعتبر است";
    }
    return null;
  }

  static String? isMobileNumberOK(String phoneNumber) {
    phoneNumber = replacePersianNumber(phoneNumber);
    String pattern = r'^09\d{2}\s*?\d{3}\s*?\d{4}$';
    RegExp regExp = new RegExp(pattern);
    if (phoneNumber.length == 0) {
      return "لطفا شماره تلفن را وارد کنید";
    } else if (!regExp.hasMatch(phoneNumber)) {
      return "شماره تلفن وارد شده نامعتبر است";
    }
    return null;
  }

  static String? isTelephoneNumberOK(String phoneNumber) {
    phoneNumber = replacePersianNumber(phoneNumber);
    String pattern = r'^0\d{3}\s*?\d{3}\s*?\d{4}$';
    RegExp regExp = new RegExp(pattern);
    if (phoneNumber.length == 0) {
      return "لطفا شماره تلفن را وارد کنید";
    } else if (!regExp.hasMatch(phoneNumber)) {
      return "شماره تلفن وارد شده نامعتبر است";
    }
    return null;
  }

  static String? isDateOK(String date) {
    if (date.length == 0) {
      return "لطفا تاریخ تولد خود را وارد کنید";
    }
    return null;
  }

  static String? isSerialOK(String date) {
    if (date.length == 0) {
      return "لطفا سریال محصول را وارد کنید";
    }
    return null;
  }

  static String? isSmsCodeOK(String code) {
    code = replacePersianNumber(code);
    String pattern = r'^[0-9]+$';
    RegExp regExp = new RegExp(pattern);
    if (code.length == 0) {
      return "کد ارسال شده را وارد کنید";
    } else if (code.length < 5) {
      return "کد باید 5 رقم باشد.";
    } else if (!regExp.hasMatch(code)) {
      return "کد نامعتبر است";
    }
    return null;
  }

  static String? isValidNationalCode(String nationalCode) {
    if (!RegExp("^\\d{10}").hasMatch(nationalCode)) return "کد ملی وارد شده معتبر نیست!";
    final check = int.parse(nationalCode[9]);
    final sum = Iterable<int>.generate(9).map((x) => int.parse(nationalCode[x]) * (10 - x)).reduce((x, y) => x + y) % 11;
    return (sum < 2 ? check == sum : check + sum == 11) ? null : "کد ملی وارد شده معتبر نیست!";
  }

  static String? isSearchTermOK(String searchTerm) {
    String pattern = r'^([\u0600-\u06FF]+\s?)+$';
    RegExp regExp = new RegExp(pattern);
    if (searchTerm.length == 0) {
      return "لطفا نام خانوادگی خود را وارد کنید";
    } else if (!regExp.hasMatch(searchTerm)) {
      return "نام خانوادگی وارد شده نامعتبر است";
    }
    return null;
  }

}
