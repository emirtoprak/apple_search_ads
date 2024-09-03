// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_amount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BudgetAmount _$BudgetAmountFromJson(Map<String, dynamic> json) => BudgetAmount(
      amount: json['amount'] as String,
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$BudgetAmountToJson(BudgetAmount instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'currency': instance.currency,
    };
