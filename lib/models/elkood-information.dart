class ElkoodInformation {
  final dynamic phone;
  final dynamic facebook;
  final dynamic insta;
  final dynamic telegram;
  final dynamic whatsapp;
  final dynamic linkedin;
  final dynamic place;
  final dynamic mail;
  final dynamic desc;

  ElkoodInformation({this.phone, this.facebook, this.insta, this.telegram, this.whatsapp, this.linkedin, this.place, this.mail, this.desc});

  factory ElkoodInformation.fromJson(Map<dynamic, dynamic> json) {
    return ElkoodInformation(
      phone: json['elkoodphone'],
      desc: json['elkooddesc'],
      facebook: json['elkoodfacebook'],
      insta: json['elkoodinsta'],
      linkedin: json['elkoodlinkedin'],
      mail: json['elkoodmail'],
      place: json['elkoodPlace'],
      telegram: json['elkoodtelegram'],
      whatsapp: json['elkoodwhatsapp'],
    );
  }
}
