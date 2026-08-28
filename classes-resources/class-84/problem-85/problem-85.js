// Author: Cristian Camilo Cortes Ortiz <Cristianco9>

// Parent class
class Vehicle {

    constructor(brand, model, color, year) {
        this.brand = brand;
        this.model = model;
        this.color = color;
        this.year = year;
    }

    showInformation() {
        return {
            brand: this.brand,
            model: this.model,
            color: this.color,
            year: this.year
        };
    }
}

// Child class
class Car extends Vehicle {

    constructor(brand, model, color, year, numberOfDoors, numberOfSeats) {
        super(brand, model, color, year);
        this.numberOfDoors = numberOfDoors;
        this.numberOfSeats = numberOfSeats;
    }

    startEngine() {
        console.log("The car engine has started.");
    }

    stopEngine() {
        console.log("The car engine has stopped."); 
    }

    showInformation() {
        return {
            brand: this.brand,
            model: this.model,
            color: this.color,
            year: this.year,
            numberOfDoors: this.numberOfDoors,
            numberOfSeats: this.numberOfSeats
        };
    }
}

// Child class
class Motorcycle extends Vehicle {

    constructor(brand, model, color, year, engineCapacity, quickShifter) {
        super(brand, model, color, year);
        this.engineCapacity = engineCapacity;
        this.quickShifter = quickShifter;
    }

    doWheelie() {
        console.log("The motorcycle is doing a wheelie!!!");
    }

    showInformation() {
        return {
            brand: this.brand,
            model: this.model,
            color: this.color,
            year: this.year,
            engineCapacity: this.engineCapacity,
            quickShifter: this.quickShifter
        };
    }
}

// test
const AudiR8 = new Car(
    "Audi",
    "R8",
    ["Navy Blue"],
    2026,
    3,
    2
);

console.log("=======================================");
console.log(AudiR8);
console.log(typeof(AudiR8));
console.log("=======================================");
console.log(AudiR8.showInformation());
console.log("=======================================");
AudiR8.startEngine();
AudiR8.stopEngine();


const HondaCBR600R = new Motorcycle(
    "Honda",
    "CBR600R",
    ["Red", "White", "Black"],
    2026,
    599,
    true
);

console.log("=======================================");
console.log(HondaCBR600R);
console.log(typeof(HondaCBR600R));
console.log("=======================================");
console.log(HondaCBR600R.showInformation());
console.log("=======================================");
HondaCBR600R.doWheelie();

