class Visitor {
  int? userId;
  String? firstName;
  Null? firstNameAr;
  Null? lastName;
  Null? address;
  Null? addressAr;
  Null? city;
  Null? state;
  Null? countryId;
  Null? stateId;
  Null? zip;
  String? phone;
  Null? fullNumber;
  String? email;
  Null? isTrash;
  String? status;
  Null? dateAdded;
  Null? sendMe;
  Null? verificationCode;
  Null? vSendAt;
  Null? resetKey;
  Null? dob;
  Null? callsMe;
  Null? country;
  Null? image;
  Null? mobile;
  Null? slug;
  String? emailVerified;
  Null? timezone;
  String? adminApproved;
  Null? aNotify;
  Null? rNotify;
  Null? wNotify;
  Null? otp;
  Null? otpLogin;
  Null? otpLoginSend;
  String? isVerified;
  int? phoneVerified;
  Null? otpAttempt;
  Null? loginAttempt;
  String? userStatus;
  Null? userCountry;
  Null? nationalId;
  String? fullName;

  Visitor(
      {this.userId,
        this.firstName,
        this.firstNameAr,
        this.lastName,
        this.address,
        this.addressAr,
        this.city,
        this.state,
        this.countryId,
        this.stateId,
        this.zip,
        this.phone,
        this.fullNumber,
        this.email,
        this.isTrash,
        this.status,
        this.dateAdded,
        this.sendMe,
        this.verificationCode,
        this.vSendAt,
        this.resetKey,
        this.dob,
        this.callsMe,
        this.country,
        this.image,
        this.mobile,
        this.slug,
        this.emailVerified,
        this.timezone,
        this.adminApproved,
        this.aNotify,
        this.rNotify,
        this.wNotify,
        this.otp,
        this.otpLogin,
        this.otpLoginSend,
        this.isVerified,
        this.phoneVerified,
        this.otpAttempt,
        this.loginAttempt,
        this.userStatus,
        this.userCountry,
        this.nationalId,
        this.fullName});

  Visitor.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    firstName = json['first_name'];
    firstNameAr = json['first_name_ar'];
    lastName = json['last_name'];
    address = json['address'];
    addressAr = json['address_ar'];
    city = json['city'];
    state = json['state'];
    countryId = json['country_id'];
    stateId = json['state_id'];
    zip = json['zip'];
    phone = json['phone'];
    fullNumber = json['full_number'];
    email = json['email'];
    isTrash = json['isTrash'];
    status = json['status'];
    dateAdded = json['date_added'];
    sendMe = json['send_me'];
    verificationCode = json['verification_code'];
    vSendAt = json['v_send_at'];
    resetKey = json['reset_key'];
    dob = json['dob'];
    callsMe = json['calls_me'];
    country = json['country'];
    image = json['image'];
    mobile = json['mobile'];
    slug = json['slug'];
    emailVerified = json['email_verified'];
    timezone = json['timezone'];
    adminApproved = json['admin_approved'];
    aNotify = json['a_notify'];
    rNotify = json['r_notify'];
    wNotify = json['w_notify'];
    otp = json['otp'];
    otpLogin = json['otp_login'];
    otpLoginSend = json['otp_login_send'];
    isVerified = json['is_verified'];
    phoneVerified = json['phone_verified'];
    otpAttempt = json['otp_attempt'];
    loginAttempt = json['login_attempt'];
    userStatus = json['user_status'];
    userCountry = json['user_country'];
    nationalId = json['national_id'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['first_name'] = this.firstName;
    data['first_name_ar'] = this.firstNameAr;
    data['last_name'] = this.lastName;
    data['address'] = this.address;
    data['address_ar'] = this.addressAr;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country_id'] = this.countryId;
    data['state_id'] = this.stateId;
    data['zip'] = this.zip;
    data['phone'] = this.phone;
    data['full_number'] = this.fullNumber;
    data['email'] = this.email;
    data['isTrash'] = this.isTrash;
    data['status'] = this.status;
    data['date_added'] = this.dateAdded;
    data['send_me'] = this.sendMe;
    data['verification_code'] = this.verificationCode;
    data['v_send_at'] = this.vSendAt;
    data['reset_key'] = this.resetKey;
    data['dob'] = this.dob;
    data['calls_me'] = this.callsMe;
    data['country'] = this.country;
    data['image'] = this.image;
    data['mobile'] = this.mobile;
    data['slug'] = this.slug;
    data['email_verified'] = this.emailVerified;
    data['timezone'] = this.timezone;
    data['admin_approved'] = this.adminApproved;
    data['a_notify'] = this.aNotify;
    data['r_notify'] = this.rNotify;
    data['w_notify'] = this.wNotify;
    data['otp'] = this.otp;
    data['otp_login'] = this.otpLogin;
    data['otp_login_send'] = this.otpLoginSend;
    data['is_verified'] = this.isVerified;
    data['phone_verified'] = this.phoneVerified;
    data['otp_attempt'] = this.otpAttempt;
    data['login_attempt'] = this.loginAttempt;
    data['user_status'] = this.userStatus;
    data['user_country'] = this.userCountry;
    data['national_id'] = this.nationalId;
    data['full_name'] = this.fullName;
    return data;
  }
}
