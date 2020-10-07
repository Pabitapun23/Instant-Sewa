import 'package:instantsewa/model/payment_model.dart';

class PaymentsService {
  List<Payment> getPayments() {
    return <Payment>[
      Payment(paymentId: 1, payMethod: "Pay with cash"),
      Payment(paymentId: 2, payMethod: "Pay with card"),
    ];
  }
}
