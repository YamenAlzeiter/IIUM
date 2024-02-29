function updateFormStepper(step) {
  let listItems = document.querySelectorAll("li");
  let sections = document.querySelectorAll("section");

  listItems.forEach((item) => {
    let itemStep = Number(item.getAttribute("step"));
    if (itemStep === step) {
      item.classList.remove(
        "form-stepper-unfinished",
        "form-stepper-completed",
      );
      item.classList.add("form-stepper-active");
    } else if (itemStep < step) {
      item.classList.remove("form-stepper-unfinished", "form-stepper-active");
      item.classList.add("form-stepper-completed");
    } else {
      item.classList.remove("form-stepper-active", "form-stepper-completed");
      item.classList.add("form-stepper-unfinished");
    }
  });

  sections.forEach((section) => {
    let sectionStep = Number(section.getAttribute("id").split("-").pop());
    if (sectionStep === step) {
      section.classList.remove("d-none");
    } else {
      section.classList.add("d-none");
    }
  });
}

document.querySelectorAll(".form-stepper-list").forEach((item) => {
  item.addEventListener("click", function () {
    let step = parseInt(item.getAttribute("step"));
    updateFormStepper(step);
  });
});

function validation() {
  let form = document.querySelector("form");
  let formElements = Array.from(form.elements);

  formElements.forEach((element) => {
    if (element.classList.contains("is-invalid")) {
      let step = element.closest("section");
      let stepId = step.getAttribute("id").split("-").pop();
      let invalidStep = document.querySelector(`li[step="${stepId}"]`);

      if (invalidStep) {
        invalidStep.classList.add("form-stepper-invalid");
        invalidStep.classList.remove(
          "form-stepper-unfinished",
          "form-stepper-active",
        );
      }
    }
  });

  let invalidStep = document.querySelector(".form-stepper-invalid");
  if (invalidStep) {
    updateFormStepper(Number(invalidStep.getAttribute("step")));
    invalidStep.classList.remove("form-stepper-invalid");
  } else {
    let firstStep = document.querySelector("li");
    firstStep.classList.add("form-stepper-active");
    updateFormStepper(Number(firstStep.getAttribute("step")));
  }
}

window.onload = function () {
  validation();
};
