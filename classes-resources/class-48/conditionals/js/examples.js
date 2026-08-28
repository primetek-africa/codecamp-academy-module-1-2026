export function runExamples() {

    console.clear();

    console.log("Conditional Examples Running...\n");

    const age = 20;

    if (age >= 18) {
        console.log("Example 1: User is an adult");
    }


    const score = 75;

    if (score >= 90) {
        console.log("Excellent");
    } else if (score >= 70) {
        console.log("Good score");
    } else {
        console.log("Needs improvement");
    }


    const isAdmin = false;
    const isModerator = true;

    if (isAdmin || isModerator) {
        console.log("Example 3: User has access privileges");
    }


    const salary = 2500;
    const creditScore = 720;

    if (salary >= 2000 && creditScore >= 700) {
        console.log("Example 4: Loan Approved");
    } else {
        console.log("Loan Rejected");
    }

}