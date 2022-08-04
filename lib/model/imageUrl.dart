class ImageModel {
  String? url;
  String? path;
  String? uploadedBy;
  String? description;
  String? name;
  ImageModel(
      {this.url, this.path, this.uploadedBy, this.description, this.name});

  ImageModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    path = json['path'];
    uploadedBy = json['uploaded_by'];
    description = json['description'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['path'] = this.path;
    data['uploaded_by'] = this.uploadedBy;
    data['description'] = this.description;
    data['name'] = this.name;
    return data;
  }
}
