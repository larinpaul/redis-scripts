// Async/Await = Async = makes a function return a promise
//               Await = makes an async function wait for a promise

//               Allows you write asynchronous code in a synchronous manner
//               Async doesn't have resolve or reject parameters
//               Everything after Await is placed in an event queue.

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

}

function takeOutTrash() {

}

walkDog.dog().then(value => {console.log(value); return cleanKitchen()})
             .then(value => {console.log(value); return takeOutTrash()})
             .then(value => {console.log(value); console.log("You finished all the chores")})
             .catch(error => console.error(error));

console.log("Hey there! :)");


