$(document).ready(function () {
  // Handling changes for inline radio buttons 1
  $("#inlineRadio1").on("change", function () {
    if (this.checked) {
      $(".conditional-form-elements").show();
      $(".conditional-form-elements-reject").hide();
      $(".conditional-form-elements-incomplete").hide();
    }
  });

  // Handling changes for inline radio buttons 2 and 5
  $("#inlineRadio2, #inlineRadio5").on("change", function () {
    if (this.checked) {
      $(".conditional-form-elements-reject").show();
      $(".conditional-form-elements").hide();
      $(".conditional-form-elements-incomplete").hide();
      $(".resend").hide();
    }
  });

  // Handling changes for inline radio button 3
  $("#inlineRadio3").on("change", function () {
    if (this.checked) {
      $(".conditional-form-elements-incomplete").show();
      $(".conditional-form-elements").hide();
      $(".conditional-form-elements-reject").hide();
    }
  });

  // Handling changes for inline radio button 4
  $("#inlineRadio4").on("change", function () {
    if (this.checked) {
      $(".resend").show();
      $(".conditional-form-elements").hide();
      $(".conditional-form-elements-reject").hide();
    }
  });
});

$(document).ready(function () {
  // Handling changes for inline radio buttons 1
  $("#inlineRadio1").on("change", function () {
    if (this.checked) {
      $(".conditional-form-elements").show();
      $(".conditional-form-elements-reject").hide();
      $(".conditional-form-elements-incomplete").hide();
    }
  });

  // Handling changes for inline radio buttons 2 and 5
  $("#inlineRadio2, #inlineRadio5").on("change", function () {
    if (this.checked) {
      $(".conditional-form-elements-reject").show();
      $(".conditional-form-elements").hide();
      $(".conditional-form-elements-incomplete").hide();
      $(".resend").hide();
    }
  });

  // Handling changes for inline radio button 3
  $("#inlineRadio3").on("change", function () {
    if (this.checked) {
      $(".conditional-form-elements-incomplete").show();
      $(".conditional-form-elements").hide();
      $(".conditional-form-elements-reject").hide();
    }
  });

  // Handling changes for inline radio button 4
  $("#inlineRadio4").on("change", function () {
    if (this.checked) {
      $(".resend").show();
      $(".conditional-form-elements").hide();
      $(".conditional-form-elements-reject").hide();
    }
  });
});

$(document).ready(function () {
  // Handling changes for dropdown with ID 'kcdio-dropdown'
  $("#kcdio-dropdown").on("change", function () {
    var selectedValueFromKedio = $(this).find("option:selected").text();
    var personInChargeDropdown = $("#personInChargeDropdown");
    var emailValue = $("#emailAddress").val();
    var personInChargeEmail = $("#emailAddress");
    var selectedPersonInChargeName = $(this)
      .find("option:selected")
      .data("name");
    var personInChargeCCEmail = $("#ccEmailAddress");

    if (selectedValueFromKedio) {
      // Make an AJAX request to load people based on the selected KCDIO
      $.ajax({
        url: loadPeopleUrl,
        type: "POST",
        data: {
          kcdio: selectedValueFromKedio,
          emailAddress: emailValue,
          name: selectedPersonInChargeName,
        },
        success: function (data) {
          console.log(data);

          personInChargeDropdown.empty();
          personInChargeDropdown.append(
            $('<option value="">Select a Person in Charge</option>'),
          );

          // Populate the Person in Charge dropdown with the loaded data
          $.each(data, function (index, person) {
            personInChargeDropdown.append(
              $(
                '<option value="' +
                  person.id +
                  '">' +
                  person.name +
                  "</option>",
              ),
            );
          });

          // based on selection of person in charge --> auto fill needed information
          personInChargeDropdown.on("change", function () {
            var selectedPersonInCharge = $(this).val();
            var selectedPersonInCharge = data.find(function (person) {
              return person.id == selectedPersonInCharge;
            });

            if (selectedPersonInCharge) {
              // Display the email
              personInChargeEmail.val(selectedPersonInCharge.email);
              personInChargeCCEmail.val(selectedPersonInCharge.email);
              $("#selectedPersonId").val(selectedPersonInCharge.id);
            } else {
              personInChargeEmail.val("");
              personInChargeCCEmail.val("");
              $("#selectedPersonId").val("");
            }
          });
        },
        error: function () {
          console.log("Error loading data.");
        },
      });
    } else {
      // If no KCDIO is selected, reset the Person in Charge dropdown
      personInChargeDropdown.empty();
      personInChargeDropdown.append(
        $('<option value="">Select KCDIO first</option>'),
      );
    }
  });
});
