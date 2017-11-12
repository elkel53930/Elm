// Create a simple string
var someString = "some string";

// Update string 10,000 times
function updateString() {
  for( var i = 0 ; i <= 10000 ; i++ )
  {
    someString = "updated string";
  };
}

// Find out how long it takes to update a string 10,000 times
var t1 = performance.now();
updateString();
var t2 = performance.now();

console.log("It took " + (t2 - t1) + " ms to update a string.")
