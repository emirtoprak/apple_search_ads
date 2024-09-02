import 'package:json_annotation/json_annotation.dart';

part 'budget_amount.g.dart';

@JsonSerializable()
class BudgetAmount {
  final String amount;
  final String currency;

  BudgetAmount({required this.amount, required this.currency});

  factory BudgetAmount.fromJson(Map<String, dynamic> json) =>
      _$BudgetAmountFromJson(json);

  Map<String, dynamic> toJson() => _$BudgetAmountToJson(this);
}
