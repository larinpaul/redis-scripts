// Async/Await = Async = makes a function return a promise
//               Await = makes an async function wait for a promise

//               Allows you write asynchronous code in a synchronous manner
//               Async doesn't have resolve or reject parameters
//               Everything after Await is placed in an event queue.

// Adding async to this function won't benefit us
function walkDog() {
    return new Promise((resolve, reject) => {
        setTimeout(() => {

            const dogWalked = true;

            if (dogWalked) {
                resolve("You walk the dog :)");
            }
            else {
                reject("You DIDN'T walk the dog...");
            }
        }, 1500);
    });
}

function cleanKitchen() {
    // ...

    // GOTTA COME BACK AND FINISH THIS!
}

function takeOutTrash() {
    // ...
}

// // We can write all this code into async function...
// walkDog.dog().then(value => {console.log(value); return cleanKitchen()})
//              .then(value => {console.log(value); return takeOutTrash()})
//              .then(value => {console.log(value); console.log("You finished all the chores")})
//              .catch(error => console.error(error));

async function doChores() {
 
    try {
        const walkDogResult = await walkDog();
        console.log(walkDogResult);
    
        const cleanKitchenResult = await cleanKitchen();
        console.log(cleanKitchenResult);
    
        const takeOutTrashResult = await takeOutTrash();
        console.log(takeOutTrashResult);
    
        console.log("You finished all the chores!");
    }
    catch(error) {
        console.error(error);
    }

}

doChores()
