// Select all elements with the class 'value' and store them in the counters array
const counters = document.querySelectorAll(".value");

// Define the speed of animation
const speed = 200;

// Iterate over each counter element
counters.forEach((counter) => {
  // Define the animate function for each counter
  const animate = () => {
    // Get the target value to animate to from the custom attribute 'akhi'
    const value = +counter.getAttribute("akhi");
    // Get the current value displayed in the counter
    const data = +counter.innerText;

    // Calculate the time needed for the animation based on speed
    const time = value / speed;

    // If the current value is less than the target value
    if (data < value) {
      // Update the displayed value with a smooth animation
      counter.innerText = Math.ceil(data + time);
      // Schedule the next animation frame
      setTimeout(animate, 10);
    } else {
      // If the current value equals or exceeds the target value, set it to the target value
      counter.innerText = value;
    }
  };

  // Start the animation for this counter
  animate();
});
