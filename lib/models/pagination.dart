import 'package:json_annotation/json_annotation.dart';

part 'pagination.g.dart';

@JsonSerializable()
class Pagination {
  final int totalResults;
  final int startIndex;
  final int itemsPerPage;

  Pagination({
    required this.totalResults,
    required this.startIndex,
    required this.itemsPerPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}
