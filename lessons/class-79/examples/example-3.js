const superBike = {
    brand: "BMW",
    type: "Motorcycle",
    category: "Super bike",
    line: 'S1000',
    model: 'RR',
    releaseYear: 2021,
    engine: {
        type: "4 cylinders inline",
        time: "4-stroke",
        capacity: 999,
        horsePawer: 210,
        torqueNM: 113,
    },
    color: "multicolor",
    topSpeedKm: 300,
    warranty: 5,
    fuelType: "Premium",
    fuelCapacity: 16.5,
    price: 30000,
    weightKg: 198
};

console.log("******************************");
console.log("Vehicle:");
console.log(superBike);
console.log("******************************");
console.log("Vehicle engine:");
console.log(superBike.engine);
console.log("******************************");
superBike.price = 45000
console.log("******************************");
console.log("Vehicle price:");
console.log("$", superBike.price, " USD.");
console.log("******************************");
superBike.licenseRegistration = "56454343345453UDF";
superBike.owner = "George Foreman";
console.log("******************************");
console.log("Vehicle:");
console.log(superBike);
console.log("******************************");
delete superBike.licenseRegistration;
delete superBike.owner;
console.log("******************************");
console.log("Vehicle:");
console.log(superBike);
console.log("******************************");