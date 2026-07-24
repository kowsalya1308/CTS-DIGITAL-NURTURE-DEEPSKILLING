import React, { Component } from 'react';

/**
 * Cart Class Component
 * Receives 'Itemname' and 'Price' props and renders a table row <tr>.
 */
class Cart extends Component {
  render() {
    // Access props passed from parent component (OnlineShopping)
    const { Itemname, Price } = this.props;

    return (
      <tr>
        <td>{Itemname}</td>
        <td>{Price}</td>
      </tr>
    );
  }
}

export default Cart;

