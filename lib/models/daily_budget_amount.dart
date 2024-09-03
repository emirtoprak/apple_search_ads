import 'package:json_annotation/json_annotation.dart';

part 'daily_budget_amount.g.dart';

@JsonSerializable()
class DailyBudgetAmount {
  final String amount;
  final String currency;

  DailyBudgetAmount({required this.amount, required this.currency});

  factory DailyBudgetAmount.fromJson(Map<String, dynamic> json) =>
      _$DailyBudgetAmountFromJson(json);

  Map<String, dynamic> toJson() => _$DailyBudgetAmountToJson(this);
}