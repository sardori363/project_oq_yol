import "package:flutter_riverpod/flutter_riverpod.dart";

final Provider<TransactionViewModel> transactionVM = Provider((ProviderRef<TransactionViewModel> ref) => TransactionViewModel());

class TransactionViewModel {
  List<String> getTransactions(String filter) {
    // This is just an example. Replace with your actual logic.
    return [
      "Transaction 1 - $filter",
      "Transaction 2 - $filter",
      "Transaction 3 - $filter",
    ];
  }
}
