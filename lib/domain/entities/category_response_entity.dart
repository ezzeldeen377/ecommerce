class CategoryResponseEntity {
  int? results;
  MetadataEntity? metadata;
  List<DataEntity>? data;
  String? message;
  String? statusMsg;

  CategoryResponseEntity(
      {this.results, this.metadata, this.data, this.message, this.statusMsg});
}

class MetadataEntity {
  int? currentPage;
  int? numberOfPages;
  int? limit;

  MetadataEntity({this.currentPage, this.numberOfPages, this.limit});

  toJson() {}
}

class DataEntity {
  String? sId;
  String? name;
  String? slug;
  String? image;

  DataEntity({
    this.sId,
    this.name,
    this.slug,
    this.image,
  });

  toJson() {}
}
