// Author: Cristian Camilo Cortes Ortiz <Cristianco9>

// Storage the shipping variables
const shippingMethod = "express";
const region = "international";

// Global shipping cost variable
let cost = 0;

switch(shippingMethod) {

    case "standard":
        if (region === "local") {
            cost = 5;
        } else if (region === "national") {
            cost = 10;
        } else if (region === "international") {
            cost = 20;
        } else {
            console.log("Invalid region.");
            break;
        }
        console.log("Shipping cost : $", cost);
        break;

    case "express":
        if (region === "local") {
            cost = 10;
        } else if (region === "national") {
            cost = 20;
        } else if (region === "international") {
            cost = 40;
        } else {
            console.log("Invalid region.");
            break;
        }
        console.log("Shipping cost : $", cost);
        break;

    case "overnight":
        if (region === "local") {
            cost = 20;
        } else if (region === "national") {
            cost = 35;
        } else if (region === "international") {
            cost = 60;
        } else {
            console.log("Invalid region.");
            break;
        }
        console.log("Shipping cost : $", cost);
        break;
    
    default:
        console.log("Invalid shipping method.");
        
}

/*
---------------------------------------
Desktop Test
---------------------------------------

shippingMethod = "standard"
region = "local"
=> Shipping cost: $5

shippingMethod = "standard"
region = "national"
=> Shipping cost: $10

shippingMethod = "standard"
region = "international"
=> Shipping cost: $20


shippingMethod = "express"
region = "local"
=> Shipping cost: $10

shippingMethod = "express"
region = "national"
=> Shipping cost: $20

shippingMethod = "express"
region = "international"
=> Shipping cost: $40


shippingMethod = "overnight"
region = "local"
=> Shipping cost: $20

shippingMethod = "overnight"
region = "national"
=> Shipping cost: $35

shippingMethod = "overnight"
region = "international"
=> Shipping cost: $60


shippingMethod = "fast"
region = "local"
=> Invalid shipping method.

shippingMethod = "standard"
region = "mars"
=> Invalid region.
*/