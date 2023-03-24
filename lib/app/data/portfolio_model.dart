class Portfolio {
  Config? config;
  Portfolio? portfolio;

  Portfolio({this.config, this.portfolio});

  Portfolio.fromJson(Map<String, dynamic> json) {
    config = json['config'] != null ? Config?.fromJson(json['config']) : null;
    portfolio = json['portfolio'] != null
        ? Portfolio?.fromJson(json['portfolio'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (config != null) {
      data['config'] = config?.toJson();
    }
    if (portfolio != null) {
      data['portfolio'] = portfolio?.toJson();
    }
    return data;
  }
}

class Config {
  String? bgColor;
  String? titleColor;
  String? subtitleColor;
  String? titleWeight;
  String? subtitleWeight;
  String? progressColor;

  Config(
      {this.bgColor,
      this.titleColor,
      this.subtitleColor,
      this.titleWeight,
      this.subtitleWeight,
      this.progressColor});

  Config.fromJson(Map<String, dynamic> json) {
    bgColor = json['bg_color'];
    titleColor = json['title_color'];
    subtitleColor = json['subtitle_color'];
    titleWeight = json['title_weight'];
    subtitleWeight = json['subtitle_weight'];
    progressColor = json['progress_color'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['bg_color'] = bgColor;
    data['title_color'] = titleColor;
    data['subtitle_color'] = subtitleColor;
    data['title_weight'] = titleWeight;
    data['subtitle_weight'] = subtitleWeight;
    data['progress_color'] = progressColor;
    return data;
  }
}

class Info {
  String? name;
  String? description;

  Info({this.name, this.description});

  Info.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    return data;
  }
}

class UserImages {
  Avatar? avatar;
  List<HeaderImages>? headerImages;

  UserImages({this.avatar, this.headerImages});

  UserImages.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'] != null ? Avatar?.fromJson(json['avatar']) : null;
    if (json['header_images'] != null) {
      headerImages = <HeaderImages>[];
      json['header_images'].forEach((v) {
        headerImages?.add(HeaderImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (avatar != null) {
      data['avatar'] = avatar?.toJson();
    }
    if (headerImages != null) {
      data['header_images'] = headerImages?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Avatar {
  String? url;
  String? blurHash;

  Avatar({this.url, this.blurHash});

  Avatar.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    blurHash = json['blur_hash'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['url'] = url;
    data['blur_hash'] = blurHash;
    return data;
  }
}

class HeaderImages {
  String? url;
  String? blurHash;

  HeaderImages({this.url, this.blurHash});

  HeaderImages.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    blurHash = json['blur_hash'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['url'] = url;
    data['blur_hash'] = blurHash;
    return data;
  }
}

class Contact {
  String? icon;
  String? text;

  Contact({this.icon, this.text});

  Contact.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['icon'] = icon;
    data['text'] = text;
    return data;
  }
}

class Social {
  String? icon;
  String? name;
  String? url;

  Social({this.icon, this.name, this.url});

  Social.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['icon'] = icon;
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class Skills {
  Info? info;
  String? type;
  int? percent;
  HeaderImage? headerImage;

  Skills({this.info, this.type, this.percent, this.headerImage});

  Skills.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ? Info?.fromJson(json['info']) : null;
    type = json['type'];
    percent = json['percent'];
    headerImage = json['header_image'] != null
        ? HeaderImage?.fromJson(json['header_image'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (info != null) {
      data['info'] = info?.toJson();
    }
    data['type'] = type;
    data['percent'] = percent;
    if (headerImage != null) {
      data['header_image'] = headerImage?.toJson();
    }
    return data;
  }
}

class HeaderImage {
  String? url;
  String? blurHash;

  HeaderImage({this.url, this.blurHash});

  HeaderImage.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    blurHash = json['blur_hash'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['url'] = url;
    data['blur_hash'] = blurHash;
    return data;
  }
}

class Projects {
  Info? info;
  String? url;
  HeaderImage? headerImage;

  Projects({this.info, this.url, this.headerImage});

  Projects.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ? Info?.fromJson(json['info']) : null;
    url = json['url'];
    headerImage = json['header_image'] != null
        ? HeaderImage?.fromJson(json['header_image'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (info != null) {
      data['info'] = info?.toJson();
    }
    data['url'] = url;
    if (headerImage != null) {
      data['header_image'] = headerImage?.toJson();
    }
    return data;
  }
}

class Posts {
  Info? info;
  HeaderImage? headerImage;

  Posts({this.info, this.headerImage});

  Posts.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ? Info?.fromJson(json['info']) : null;
    headerImage = json['header_image'] != null
        ? HeaderImage?.fromJson(json['header_image'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (info != null) {
      data['info'] = info?.toJson();
    }
    if (headerImage != null) {
      data['header_image'] = headerImage?.toJson();
    }
    return data;
  }
}

class Education {
  Info? info;
  int? startDate;
  int? endDate;
  HeaderImage? headerImage;

  Education({this.info, this.startDate, this.endDate, this.headerImage});

  Education.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ? Info?.fromJson(json['info']) : null;
    startDate = json['start_date'];
    endDate = json['end_date'];
    headerImage = json['header_image'] != null
        ? HeaderImage?.fromJson(json['header_image'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (info != null) {
      data['info'] = info?.toJson();
    }
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    if (headerImage != null) {
      data['header_image'] = headerImage?.toJson();
    }
    return data;
  }
}
