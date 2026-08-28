// Author: Cristian Camilo Cortes Ortiz <Cristianco9>

// Given variables
const salary = 2000;
const category = 3;

// Global variable to storage the new salary
let newSalary;

// Switch statement to determinate the salary increase
switch(category) {

    case 1:
        // 5% increase
        newSalary = salary + (salary * 0.05);
        break;

    case 2:
        // 10% increase
        newSalary = salary + (salary * 0.10);
        break;

    case 3:
        // 15% increase
        newSalary = salary + (salary * 0.15);
        break;

    case 4:
        // 20% increase
        newSalary = salary + (salary * 0.20);
        break;

    default:
        console.log("Invalid category code.");
        newSalary = null;
        
}

// Display the result if the category was valid
if (newSalary !== null) {
    console.log("Currently salary: $", salary); 
    console.log("New salary: $", newSalary);
}

/*
---------------------------------------
Desktop Test
---------------------------------------

salary = 2000    category = 1
=> 2000 + (2000 * 0.05)
=> New Salary: 2100

salary = 2000    category = 2
=> 2000 + (2000 * 0.10)
=> New Salary: 2200

salary = 2000    category = 3
=> 2000 + (2000 * 0.15)
=> New Salary: 2300

salary = 2000    category = 4
=> 2000 + (2000 * 0.20)
=> New Salary: 2400

salary = 1500    category = 1
=> 1500 + (1500 * 0.05)
=> New Salary: 1575

salary = 3000    category = 4
=> 3000 + (3000 * 0.20)
=> New Salary: 3600

salary = 2000    category = 7
=> Invalid category code.
=> No salary calculation

---------------------------------------
*/