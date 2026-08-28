// Author : Cristian Camilo Cortes Ortiz <Cristianco9>

// Request the traffic light state
const trafficLight = prompt("Enter the traffic light state: ").toLowerCase();
let message = "";

// switch statement
switch(trafficLight) {

    case "red":
        //alert("Stop the vehicle.");
        message = "Stop the vehicle.";
        break;

    case "yellow":
        //alert("Prepare to stop/go.");
        message = "Prepare to stop/go.";
        break;

    case "green":
        //alert("You can go.");
        message = "You can go.";
        break;
    
    default:
        //alert("Invalid traffic light color."); 
        message = "Invalid traffic light color.";
}

alert(message);

/*
--------------------------------------------------------------------------
Desktop Test
--------------------------------------------------------------------------

trafficLight = "red"        =>      "Stop the vehicle."
trafficLight = "yellow"     =>      "prepare to stop/go."
trafficLight = "green"      =>      "You can go."
trafficLight = "blue"       =>      "Invalid traffic light color."
trafficLight = 123          =>      "Invalid traffic light color."

--------------------------------------------------------------------------
*/