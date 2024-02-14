$(document).ready(function () {
  if (typeof dropdownData !== "undefined") {
    dropdownData.forEach(function (data) {
      setupCountryStateDropdown(
        data.countryId,
        data.stateId,
        data.countryModel,
        data.stateModel,
      );
    });
    $.ajax({
      url: "/outbound/get-nationality",
      method: "GET",
      success: function (response) {
        $("#validationCustomCitizenship").html(response);
        if (nationalityModelValue !== "") {
          $("#validationCustomCitizenship").val(nationalityModelValue).change();
          console.log("Selected citizenship:", nationalityModelValue);
        }
      },
      error: function (xhr, status, error) {
        console.error("Error fetching nationality data:", error);
      },
    });
  }
});

function setupCountryStateDropdown(
  countryIdSelector,
  stateIdSelector,
  countryModelValue,
  stateModelValue,
) {
  // AJAX call for populating countries
  $.ajax({
    url: "/outbound/get-countries",
    method: "GET",
    success: function (response) {
      $(countryIdSelector).html(response);
      if (countryModelValue !== "") {
        $(countryIdSelector).val(countryModelValue).change();
      }
    },
  });

  // Change event for country dropdown
  $(countryIdSelector).change(function () {
    var countryId = $(this).val();
    if (countryId !== "") {
      // AJAX call for populating states based on selected country
      $.ajax({
        url: "/outbound/get-states",
        method: "POST",
        data: { countryId: countryId },
        success: function (response) {
          $(stateIdSelector).html(response);
          if (stateModelValue !== "") {
            $(stateIdSelector).val(stateModelValue).change();
          }
        },
      });
    } else {
      $(stateIdSelector).html('<option value="">Select State</option>');
    }
  });
}
