import React, { Component } from 'react';
import Cart from './Cart';

/**
 * OnlineShopping Class Component
 * 
 * Contains array of shopping items matching screenshot data,
 * maps through items array and renders <Cart /> rows into a table.
 */
class OnlineShopping extends Component {
  render() {
    // Shopping items list matching exact screenshot specification
    const CartItems = [
      { Itemname: 'Laptop', Price: 80000 },
      { Itemname: 'TV', Price: 120000 },
      { Itemname: 'Washing Machine', Price: 50000 },
      { Itemname: 'Mobile', Price: 30000 },
      { Itemname: 'Fridge', Price: 70000 }
    ];

    return (
      <div className="shopping-container">
        {/* Heading matching screenshot */}
        <h1 className="heading">Items Ordered :</h1>

        {/* Table rendering the headers and mapping Cart component rows */}
        <table className="shopping-table">
          <thead>
            <tr>
              <th>Name</th>
              <th>Price</th>
            </tr>
          </thead>
          <tbody>
            {CartItems.map((item, index) => (
              <Cart 
                key={index} 
                Itemname={item.Itemname} 
                Price={item.Price} 
              />
            ))}
          </tbody>
        </table>
      </div>
    );
  }
}

export default OnlineShopping;

