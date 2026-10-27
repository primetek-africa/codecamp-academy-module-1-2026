// Author: Cristian Camilo Cortes Ortiz

class ShoppingCart {

    constructor(customerName, productName, productPrice, quantity) {
        this.customerName = customerName;
        this.productName = productName;
        this.productPrice = productPrice;
        this.quantity = quantity;
    }

    addProducts(quantity) {
        if(isNaN(quantity)) {
            return "Quantity must be a number. Try again.";
        } else if (quantity < 1) {
            return "Quantity must be greater than 1."
        } else {
            this.quantity += quantity;
            return `${quantity} product(s) added successfully.`;
        }
    }

    removeProducts(quantity) {
        if(isNaN(quantity)) {
            return "Quantity must be a number. Try again.";
        } else if (quantity < 1) {
            return "Quantity must be greater than 1."
        } else if (quantity > this.quantity) {
            return "Not enough products in the cart.";
        } else {
            this.quantity -= quantity;
            return `${quantity} product(s) removed successfully.`;
        }
    }

    calculateTotal() {
        const totalPrice = this.productPrice * this.quantity;
        return `Products: ${this.quantity} Total price: $${totalPrice} USD.`;
    }

    showCartInfo() {
        return {
            customerName: this.customerName,
            productName: this.productName,
            productPrice: this.productPrice,
            quantity: this.quantity
        }
    }
}

const cart1 = new ShoppingCart(
    "Mark Anthony",
    "Mechanical Keyboard",
    120,
    2
);

console.log("====================================");
console.log(cart1);
console.log(typeof(cart1));
console.log("====================================");
console.log(cart1.addProducts("Hello guys!"));
console.log(cart1.addProducts(-2));
console.log(cart1.addProducts(4));
console.log("====================================");
console.log(cart1.removeProducts("Remove all!"));
console.log(cart1.removeProducts(-5));
console.log(cart1.removeProducts(10));
console.log(cart1.removeProducts(1));
console.log("====================================");
console.log(cart1.calculateTotal());
console.log("====================================");
console.log(cart1.showCartInfo());
