// Function to navigate between form steps
// Function to navigate between form steps
const navigateToFormStep = (stepNumber) => {
    // Hide all form steps
    document.querySelectorAll(".form-step").forEach((formStepElement) => {
        formStepElement.classList.add("d-none");
    });

    // Mark all form steps as unfinished
    document.querySelectorAll(".form-stepper-list").forEach((formStepHeader) => {
        formStepHeader.classList.add("form-stepper-unfinished");
        formStepHeader.classList.remove("form-stepper-active", "form-stepper-completed", "is-invalid", "form-stepper-invalid");
    });

    // Show the current form step
    document.querySelector("#step-" + stepNumber).classList.remove("d-none");

    // Select the form step circle (progress bar)
    const formStepCircle = document.querySelector('li[step="' + stepNumber + '"]');

    // Mark the current form step as active
    formStepCircle.classList.remove("form-stepper-unfinished", "form-stepper-completed", "is-invalid");
    formStepCircle.classList.add("form-stepper-active");

    // Loop through each form step circle up to the current step number
    for (let index = 0; index < stepNumber; index++) {
        const formStepCircle = document.querySelector('li[step="' + index + '"]');
        if (formStepCircle) {
            // Mark the form step as completed
            formStepCircle.classList.remove("form-stepper-unfinished", "form-stepper-active", "is-invalid");
            formStepCircle.classList.add("form-stepper-completed");
        }
    }
};

// Function to validate the form step before navigating to the next step
const validateFormStep = (stepNumber) => {
    const formStep = document.querySelector("#step-" + stepNumber);
    const inputElements = formStep.querySelectorAll("input, select, textarea");

    // Perform your custom validation logic here
    let isValid = true;

    inputElements.forEach((input) => {
        // Add an event listener to track changes in the input fields
        input.addEventListener("input", () => {
            input.classList.remove("is-invalid");
        });

        if (!input.checkValidity()) {
            isValid = false;
            input.classList.add("is-invalid");
        } else {
            input.classList.remove("is-invalid");
        }
    });

    // Highlight the step in the form-stepper when it's not valid
    const formStepperList = document.querySelector('li[step="' + stepNumber + '"]');
    if (!isValid) {
        formStepperList.classList.remove("form-stepper-completed")

        formStepperList.classList.add("form-stepper-invalid");
    } else {
        formStepperList.classList.remove("form-stepper-invalid");
    }

    // Return whether the form step is valid or not
    return isValid;
};

document.querySelectorAll(".form-stepper-list").forEach((formStepperList) => {
    formStepperList.addEventListener("click", () => {
        const stepNumber = parseInt(formStepperList.getAttribute("step"));
        navigateToFormStep(stepNumber);
    });
});

// Add click event listeners to form navigation buttons
document.querySelectorAll(".btn-navigate-form-step").forEach((formNavigationBtn) => {
    formNavigationBtn.addEventListener("click", () => {
        const stepNumber = parseInt(formNavigationBtn.getAttribute("step_number"));

        // Call the function to navigate to the target form step
        navigateToFormStep(stepNumber);
    });
});


// Function to submit the form
function submitForm(validationType) {
    // Get the last step number
    const lastStepNumber = document.querySelectorAll(".form-step").length;

    if (validationType === 'validate') {
        // Validate all form steps before submitting
        for (let i = 1; i <= lastStepNumber; i++) {
            if (!validateFormStep(i)) {
                return; // Do not proceed if validation fails
            }
        }
        if (getCurrentStepNumber() === lastStepNumber) {
            document.getElementById('statusInput').value = 10;
        }
    }

    // Capture the form element
    const form = document.getElementById('myForm'); // Make sure to use the correct form ID

    // Set the status to 10 if it's the last step


    // document.querySelector('.submit-btn').type = 'submit';

    // Submit the form
    document.getElementById("myForm").submit();
    console.log("Form submitted successfully");
}

// Function to get the current step number
function getCurrentStepNumber() {
    const activeStep = document.querySelector('.form-stepper-active');
    return activeStep ? parseInt(activeStep.getAttribute('step')) : 0;
}

// Example starter JavaScript for disabling form submissions if there are invalid fields
(function () {
    'use strict'

    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.querySelectorAll('.needs-validation')

    // Loop over them and prevent submission
    Array.prototype.slice.call(forms)
        .forEach(function (form) {
            form.addEventListener('submit', function (event) {
                if (!form.checkValidity()) {
                    event.preventDefault()
                    event.stopPropagation()
                }

                form.classList.add('was-validated')
            }, false)
        })
})()

function getCurrentStepNumber() {
    const activeStep = document.querySelector('.form-stepper-active');
    return activeStep ? parseInt(activeStep.getAttribute('step')) : 0;
}
