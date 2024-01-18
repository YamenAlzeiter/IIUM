$(document).ready(function () {
  // Define a function to toggle the "Others" input field based on the selected option
  function toggleOthersField(dropdownId, othersInputId, otherOptionValue) {
    var dropdown = $("#" + dropdownId);
    var othersInput = $("#" + othersInputId).closest(".form__div");

    // Initially hide or show the "Others" input field based on the selected option
    toggle();

    // Add change event listener to the dropdown
    dropdown.change(function () {
      // Toggle the "Others" input field based on the selected option
      toggle();
    });

    // Function to toggle the "Others" input field based on the selected option
    function toggle() {
      var selectedOption = dropdown.val();

      // Check if the selected option is the specified "OTHERS" value
      if (selectedOption === otherOptionValue) {
        // Show and make the "Others" input field required
        $("#" + othersInputId).prop("disabled", false);
      } else {
        // Hide and remove the required attribute
        $("#" + othersInputId).prop("disabled", true);

        // Clear the value in the "Others" input field
        $("#" + othersInputId).val("");
      }
    }
  }

  // Example usage for the first dropdown
  toggleOthersField("kulliyyah", "validationCustomOthers", "OTHERS");

  // Example usage for the second dropdown
  toggleOthersField(
    "sponsoring_name",
    "validationCustomSponsoringNameOther",
    "OTHERS",
  );

  // Example usage for the third dropdown and input field
  toggleOthersField(
    "type_program",
    "validationCustomTypeProgramOther",
    "Other",
  );

  toggleOthersField("English_test_name", "English_other_test_name", "OTHERs");
  toggleOthersField(
    "Propose_type_of_programme",
    "validationTypeProgramOther",
    "Other",
  );
});

$(document).ready(function () {
  // Define a function to toggle the "Amount of Scholarship/grant (RM)" input field based on the selected radio button
  function toggleHostScholarshipAmountField() {
    var hostScholarshipYes = $("#host_scholarship_1");
    var scholarshipAmountInput = $(
      "#validationCustomHostScholarshipAmount",
    ).closest(".form__div");

    // Initially hide or show the "Amount of Scholarship/grant (RM)" input field based on the selected radio button
    toggle();

    // Add change event listener to the radio buttons
    $("input[name='Outbound[host_scholarship]']").change(function () {
      // Toggle the "Amount of Scholarship/grant (RM)" input field based on the selected radio button
      toggle();
    });

    // Function to toggle the "Amount of Scholarship/grant (RM)" input field based on the selected radio button
    function toggle() {
      // Check if the "Yes" radio button is checked
      if (hostScholarshipYes.is(":checked")) {
        // Show and make the "Amount of Scholarship/grant (RM)" input field required

        $("#validationCustomHostScholarshipAmount").prop("disabled", false);
      } else {
        // Hide and remove the required attribute

        $("#validationCustomHostScholarshipAmount").prop("disabled", true);

        // Clear the value in the "Amount of Scholarship/grant (RM)" input field
        $("#validationCustomHostScholarshipAmount").val("");
      }
    }
  }

  // Example usage for the new set of radio buttons and input field
  toggleHostScholarshipAmountField();
});
document.addEventListener("DOMContentLoaded", function () {
  var lvlEduSelect = document.getElementById("lvl_edu");
  var academicNameInput = document.getElementById("Academic_name_of_programme");
  var researchTitleTextarea = document.getElementById("Research_title");

  // Function to toggle visibility and set required attribute based on the selected value
  function toggleVisibility() {
    var selectedValue = lvlEduSelect.value;

    if (selectedValue === "Diploma" || selectedValue === "Degree") {
      academicNameInput.closest(".form__div").style.display = "block";
      researchTitleTextarea.closest(".form__div").style.display = "none";
      researchTitleTextarea.removeAttribute("required");
      academicNameInput.setAttribute("required", true);
    } else if (selectedValue === "Master" || selectedValue === "PhD") {
      researchTitleTextarea.closest(".form__div").style.display = "block";
      academicNameInput.closest(".form__div").style.display = "none";
      researchTitleTextarea.setAttribute("required", true);
      academicNameInput.removeAttribute("required");
    } else {
      academicNameInput.closest(".form__div").style.display = "block";
      researchTitleTextarea.closest(".form__div").style.display = "none";
      researchTitleTextarea.removeAttribute("required");
      academicNameInput.setAttribute("required", true);
    }
  }

  // Initial visibility setup
  toggleVisibility();

  // Add event listener to the lvl_edu select element
  lvlEduSelect.addEventListener("change", toggleVisibility);
});
