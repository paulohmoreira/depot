import React, { useState } from 'react'

import NoPayType from './NoPayType';
import CreditCardPayType from './CreditCardPayType';
import CheckPayType from './CheckPayType';
import PurchaseOrderPayType from './PurchaseOrderPayType';

export default function PayTypeSelector() {
  const [payType, setPayType] = useState(null);

  function onPayTypeSelected(event) {
    setPayType(event.target.value);
  }

  let PayTypeCustomComponent = NoPayType;
  if (payType == "Credit card") {
    PayTypeCustomComponent = CreditCardPayType;
  } else if (payType == "Check") {
    PayTypeCustomComponent = CheckPayType;
  } else if (payType == "Purchase order") {
    PayTypeCustomComponent = PurchaseOrderPayType;
  }

  return (
    <div>
      <div className="field">
        <label htmlFor="order_pay_type">Pay type</label>
        <select
          id="pay_type"
          onChange={onPayTypeSelected}
          name="order[pay_type]"
        >
          <option value="">Select a payment method</option>
          <option value="Check">Check</option>
          <option value="Credit card">Credit card</option>
          <option value="Purchase order">Purchase order</option>
        </select>
      </div>
      <PayTypeCustomComponent />
    </div>
  );
}
