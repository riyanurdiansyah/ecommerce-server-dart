class OtpM {
  OtpM({
    this.phone,
    this.otp,
  });

  String? phone;
  String? otp;

  factory OtpM.fromJsonSignup(Map<String, dynamic> json) => OtpM(
        phone: json["phone"],
        otp: json["otp"],
      );
}
