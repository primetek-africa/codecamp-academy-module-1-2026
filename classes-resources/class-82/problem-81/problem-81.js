// Author: Cristian Camilo Cortes Ortiz <Cristianco9>

class Dog {

    constructor(name, breed, age, color) {
        this.name = name;
        this.breed = breed;
        this.age = age;
        this.color = color;
        this.energy = 100;
    }

    bark() {
        console.log(`🐕 ${this.name} says: Woof! Woof!`);
    }

    eat() {
        if (this.energy >= 0 && this.energy <= 90) {
            // energy = 60
            // energy = energy + 10
            // energy = 60 + 10
            // energy += 10
            this.energy += 10;
            console.log(`🐶 ${this.name} is eating.....`);
        } else if(this.energy > 90) {
            console.log(`🐶 ${this.name} Is not hungry, it's full.`);
        } else if(this.energy < 0) {
            console.log(`☠️ ${this.name} is with Saint peter. RIP.`); 
        }
    }

    play() {
        if (this.energy >= 10 && this.energy <= 100) {
            this.energy -= 20;
            console.log(`🐕  ${this.name} is playing....`);
        } else if(this.energy < 10) {
            console.log(`🐶️ ${this.name} He's too tired to play.`);
        }
    }

    showInfo() {
        console.log(`
        ******************************
                    DOG Data
        ******************************
        Name:   ${this.name}
        Breed:  ${this.breed} 
        Age:    ${this.age} 
        Color:  ${this.color} 
        Energy: ${this.energy} 
        `);
    }
}

const pet1 = new Dog("Max", "German Shepherd", 4, "Black");
console.log(pet1);
console.log(typeof(pet1));
console.log("************************");
pet1.eat();
console.log("************************");
pet1.play();
pet1.play();
pet1.play();
pet1.play();
pet1.play();
pet1.play();
console.log("************************");
pet1.eat();
console.log("************************");
pet1.bark();
pet1.bark();
pet1.bark();
console.log("************************");
pet1.showInfo();
console.log("************************");


const pet2 = new Dog("Tony", "Golden Retriever", 6, "Golden");
console.log(pet2);
console.log(typeof(pet2));
console.log("************************");
pet2.eat();
console.log("************************");
pet2.play();
pet2.play();
pet2.play();
pet2.play();
pet2.play();
pet2.play();
console.log("************************");
pet2.eat();
console.log("************************");
pet2.bark();
pet2.bark();
pet2.bark();
console.log("************************");
pet2.showInfo();
console.log("************************");