import 'package:ecommerce/domain/entities/CategoryResponseEntity.dart';

class CategoryResponseDto extends CategoryResponseEntity {
  CategoryResponseDto(
      {super.results,
      super.metadata,
      super.data,
      super.message,
      super.statusMsg});

  CategoryResponseDto.fromJson(Map<String, dynamic> json) {
    results = json['results'];
    metadata = json['metadata'] != null
        // ignore: unnecessary_new
        ? new MetadataDto.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = <DataDto>[];
      json['data'].forEach((v) {
        // ignore: unnecessary_new
        data!.add(new DataDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['results'] = results;
    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MetadataDto extends MetadataEntity {
  MetadataDto({super.currentPage, super.numberOfPages, super.limit});

  MetadataDto.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }
  @override
  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['currentPage'] = currentPage;
    data['numberOfPages'] = numberOfPages;
    data['limit'] = limit;
    return data;
  }
}

class DataDto extends DataEntity {
  DataDto(
      {super.id,
      super.name,
      super.slug,
      super.image,
      super.createdAt,
      super.updatedAt});

  DataDto.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  @override
  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['image'] = image;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
