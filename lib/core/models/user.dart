class User {
  int? userId;
  String? firstName;
  String? firstNameAr;
  String? lastName;
  String? address;
  String? addressAr;
  String? city;
  String? state;
  int? countryId;
  int? stateId;
  int? zip;
  String? phone;
  String? fullNumber;
  String? email;
  bool? isTrash;
  String? status;
  String? dateAdded;
  String? sendMe;
  String? verificationCode;
  String? vSendAt;
  String? resetKey;
  String? dob;
  String? callsMe;
  String? country;
  String? image;
  String? mobile;
  String? slug;
  String? emailVerified;
  String? timezone;
  String? adminApproved;
  String? aNotify;
  String? rNotify;
  String? wNotify;
  int? otp;
  int? otpLogin;
  String? otpLoginSend;
  String? isVerified;
  int? phoneVerified;
  String? otpAttempt;
  String? loginAttempt;
  String? userStatus;
  String? userCountry;
  String? nationalId;
  String? fullName;

  User(
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
        this.fullName,
      });

  User.fromJson(Map<String, dynamic> json) {
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
    isVerified = json['is_verified'] as String;
    phoneVerified = json['phone_verified'];
    otpAttempt = json['otp_attempt'];
    loginAttempt = json['login_attempt'];
    userStatus = json['user_status'];
    userCountry = json['user_country'];
    nationalId = json['national_id'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    //add null check to all fields

    if(userId != null) data['user_id'] = userId;
    if(firstName != null) data['first_name'] = firstName;
    if(firstNameAr != null) data['first_name_ar'] = firstNameAr;
    if(lastName != null) data['last_name'] = lastName;
    if(address != null) data['address'] = address;
    if(addressAr != null) data['address_ar'] = addressAr;
    if(city != null) data['city'] = city;
    if(state != null) data['state'] = state;
    if(countryId != null) data['country_id'] = countryId;
    if(stateId != null) data['state_id'] = stateId;
    if(zip != null) data['zip'] = zip;
    if(phone != null) data['phone'] = phone;
    if(fullNumber != null) data['full_number'] = fullNumber;
    if(email != null) data['email'] = email;
    if(isTrash != null) data['isTrash'] = isTrash;
    if(status != null) data['status'] = status;
    if(dateAdded != null) data['date_added'] = dateAdded;
    if(sendMe != null) data['send_me'] = sendMe;
    if(verificationCode != null) data['verification_code'] = verificationCode;
    if(vSendAt != null) data['v_send_at'] = vSendAt;
    if(resetKey != null) data['reset_key'] = resetKey;
    if(dob != null) data['dob'] = dob;
    if(callsMe != null) data['calls_me'] = callsMe;
    if(country != null) data['country'] = country;
    if(image != null) data['image'] = image;
    if(mobile != null) data['mobile'] = mobile;
    if(slug != null) data['slug'] = slug;
    if(emailVerified != null) data['email_verified'] = emailVerified;
    if(timezone != null) data['timezone'] = timezone;
    if(adminApproved != null) data['admin_approved'] = adminApproved;
    if(aNotify != null) data['a_notify'] = aNotify;
    if(rNotify != null) data['r_notify'] = rNotify;
    if(wNotify != null) data['w_notify'] = wNotify;
    if(otp != null) data['otp'] = otp;
    if(otpLogin != null) data['otp_login'] = otpLogin;
    if(otpLoginSend != null) data['otp_login_send'] = otpLoginSend;
    if(isVerified != null) data['is_verified'] = isVerified;
    if(phoneVerified != null) data['phone_verified'] = phoneVerified;
    if(otpAttempt != null) data['otp_attempt'] = otpAttempt;
    if(loginAttempt != null) data['login_attempt'] = loginAttempt;
    if(userStatus != null) data['user_status'] = userStatus;
    if(userCountry != null) data['user_country'] = userCountry;
    if(nationalId != null) data['national_id'] = nationalId;
    if(fullName != null) data['full_name'] = fullName;

    return data;
  }
}
