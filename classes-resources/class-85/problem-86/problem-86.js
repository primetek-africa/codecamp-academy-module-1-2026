// Author: Cristian Camilo Cortes Ortiz

class BankAccount {

    constructor(ownerName, accountNumber, balance) {
        this.ownerName = ownerName;
        this.accountNumber = accountNumber;
        this.balance = balance;
    }

    deposit(amount) {
        if (isNaN(amount)) {
            return "The deposit amount must be a number.";
        } else if(amount < 1) {
            return "The deposit amount must be greater or equal than $1 USD.";
        } else {
            this.balance += amount;
            return `Deposit successful. New balance: $${this.balance} USD.`;
        }
    }

    withdraw(amount) {
        if (isNaN(amount)) {
            return "The withdraw amount must be a number.";
        } else if(amount < 1) {
            return "The withdraw amount must be greater or equal than $1 USD."; 
        } else if (amount > this.balance) {
            return "Insufficient founds."
        } else {
            this.balance -= amount;
            return `Withdrawal successful. Remaining balance: $${this.balance} USD.`
        }
    }

    showInformation() {
        return {
            owner: this.ownerName,
            accountNumber: this.accountNumber,
            balance: this.balance
        }
    }
}

class SavingsAccount extends BankAccount {

    constructor(ownerName, accountNumber, balance, interestRate) {
        super(ownerName, accountNumber, balance);
        this.interestRate = interestRate;
    }

    addInterest() {
        if(isNaN(this.interestRate)) {
            return "Interest rate must be a number."
        } else {
            const interest = this.balance * (this.interestRate / 100);
            this.balance += interest;
            return "Interest added successfully."
        }
    }
}

class CheckingAccount extends BankAccount {

    constructor(ownerName, accountNumber, balance, monthlyFee) {
        super(ownerName, accountNumber, balance);
        this.monthlyFee = monthlyFee;
    }

    chargeFee() {
        if(isNaN(this.monthlyFee)) {
            return "Monthly fee must be a number.";
        } else {
            this.balance -= this.monthlyFee;
            return "Monthly fee paid successful.";
        }
    }
}
const savings = new SavingsAccount(
    "Tony Stark",
    "SAW-123",
    1000,
    5
);

const checking = new CheckingAccount(
    "Lois Santos",
    "CHK-456",
    2000,
    15
);

// Testing savings account
console.log("===============================");
console.log("SAVINGS ACCOUNT");
console.log("===============================");
console.log(savings);
console.log("===============================");
console.log(savings.deposit("Hello"));
console.log(savings.deposit(-23));
console.log(savings.deposit(500));
console.log("===============================");
console.log(savings.withdraw("Hello"));
console.log(savings.withdraw(-200));
console.log(savings.withdraw(300));
console.log("===============================");
console.log(savings.addInterest());
console.log(savings.showInformation());


// Testing checking account
console.log("===============================");
console.log("CHECKING ACCOUNT");
console.log("===============================");
console.log(checking);
console.log(checking.deposit("Hello"));
console.log(checking.deposit(-23));
console.log(checking.deposit(500));
console.log("===============================");
console.log(checking.withdraw("Hello"));
console.log(checking.withdraw(-200));
console.log(checking.withdraw(300));
console.log("===============================");
console.log(checking.chargeFee());
console.log(checking.showInformation());