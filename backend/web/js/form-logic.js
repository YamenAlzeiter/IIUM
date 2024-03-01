// Get the start date input element
const startDateInput = document.getElementById("Propose_duration_start");
// Get the end date input element
const endDateInput = document.getElementById("Propose_duration_end");

$(document).ready(function () {
  // Function to toggle the disabled property of the "other" dropdowns
  function toggleLvlEdu(value) {
    switch (value) {
      case "PG":
        showElement("PG");
        hideElement("ugTable");
        hideElement("error");
        break;
      case "UG":
        showElement("ugTable");
        hideElement("PG");
        hideElement("error");
        break;
      default:
        hideElement("ugTable");
        hideElement("PG");
        showElement("error");
    }
  }

  // Event handlers for each dropdown
  $("#edu-lvl").change(function () {
    var value = $(this).val();
    console.log(value);
    toggleLvlEdu(value);
  });
  $("#edu-lvl").trigger("change");
});

function showElement(id) {
  document.getElementById(id).classList.remove("d-none");
}

function hideElement(id) {
  document.getElementById(id).classList.add("d-none");
}

$(document).ready(function () {
  // Function to toggle the disabled property of the "other" dropdowns
  function toggleOtherDropdown(value, otherdropdown) {
    if (value === "Other") {
      otherdropdown.prop("disabled", false);
    } else if (value === "1") {
      otherdropdown.prop("disabled", false);
    } else {
      otherdropdown.prop("disabled", true);
    }
  }

  // Event handlers for each dropdown
  $("#kulliyyah").change(function () {
    var value = $(this).val();
    var otherdropdown = $("#kulliyyah_other");
    toggleOtherDropdown(value, otherdropdown);
  });

  $("#english").change(function () {
    var value = $(this).val();
    var otherdropdown = $("#english_other");
    toggleOtherDropdown(value, otherdropdown);
  });

  $("#sponsor_name").change(function () {
    var value = $(this).val();
    var otherdropdown = $("#sponsor_other");
    toggleOtherDropdown(value, otherdropdown);
  });

  $("#mobility_programme").change(function () {
    var value = $(this).val();
    var otherdropdown = $("#mobility_other");
    toggleOtherDropdown(value, otherdropdown);
  });
  $("#programme").change(function () {
    var value = $(this).val();
    var otherdropdown = $("#programme_other");
    toggleOtherDropdown(value, otherdropdown);
  });
  $("#accommodation").change(function () {
    var value = $("#i12").prop("checked") ? "1" : "0";
    var otherdropdown = $("#campus");
    toggleOtherDropdown(value, otherdropdown);
    toggleOtherDropdown(value, $("#room"));
  });
});

$(document).ready(function () {
  function updateState(countryDropdown) {
    var countryId = countryDropdown.val();
    console.log(countryId);
    var stateDropdown = countryDropdown.closest(".row").find("#state-dropdown");
    if (countryId) {
      $.ajax({
        url: "/inbound/get-states",
        type: "post",
        data: { countryId: countryId },
        success: function (response) {
          stateDropdown.html(response);
        },
      });
    } else {
      $("#state-dropdown").html('<option value="0">Select State</option>');
    }
  }

  $("#country-dropdown").change(function () {
    updateState($(this));
  });
  $("#emergency-country-dropdown").change(function () {
    updateState($(this));
  });
  $("#host-country-dropdown").change(function () {
    updateState($(this));
  });
  $("#host-country-dropdown").change(function () {
    updateState($(this));
  });
});
$(document).ready(function () {
  function showOptions(countryDropdown) {
    console.log("showOptions");
  }

  $("#country-dropdown").change(function () {
    showOptions($(this));
  });
});
$(document).ready(function () {
  $('#funding input[type="radio"]').change(function () {
    var value = $(this).val();

    switch (value) {
      case "Self-sponsor":
        hideElement("funding_scholarship");
        hideElement("funding_other");
        break;
      case "Scholarship":
        showElement("funding_scholarship");
        hideElement("funding_other");
        break;
      case "Other":
        showElement("funding_other");
        hideElement("funding_scholarship");
        break;
      default:
        hideElement("funding_scholarship");
        hideElement("funding_other");
    }
  });

  // Trigger the change event initially to handle the initial state
  $('#funding input[type="radio"]:checked').change();
});
