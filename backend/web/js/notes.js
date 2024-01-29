$(function () {
  var updateModelId = null;
  var $btns = $(".note-link").click(function () {
    var category = this.id;

    if (category === "all-category" || category === "important") {
      var $el = $("." + category).fadeIn();
      $("#note-full-container > div").not($el).hide();
    }

    $btns.removeClass("active");
    $(this).addClass("active");
  });

  $("#add-user ,#add-pos, #add-notes").on("click", function (event) {
    // Set the form for creating a new record
    $("#formpoc").modal("show");
    $("#btn-n-save").hide();
    $("#btn-n-add").show();
    $("#formpoc-header").html(
      '<i class="ti ti-file text-dark me-2 text-dark"></i>Create New Record',
    );
    $("#submit-button").html('<i class = "ti ti-plus"></i> Add');
    // Reset the updateModelId
    updateModelId = null;
    $("#add-notes").data("update-model-id", updateModelId); // Update data attribute
  });

  function showModal(
    modalId,
    headerText,
    buttonText,
    formAction,
    recordId,
    ajaxUrl,
    successCallback,
  ) {
    $(modalId).modal("show");
    $("#btn-n-save, #btn-n-add").toggle(); // Toggle save and add buttons
    $(headerText).html(
      '<i class="ti ti-file text-dark me-2 text-white"></i>' + buttonText,
    );
    $(buttonText).html(
      '<i class = "ti ti-plus"></i>' + buttonText.split(" ")[0],
    );

    $("#formpoc form").attr("action", formAction + recordId);

    $.ajax({
      url: ajaxUrl,
      method: "GET",
      data: { id: recordId },
      success: successCallback,
      error: function () {
        // Handle error if needed
      },
    });

    updateModelId = recordId;
    $("#add-notes").data("update-model-id", updateModelId);
  }

  $("#add-pos").on("click", function () {
    $("#formpoc").modal("show");
    $("#formpoc form").attr("action", "/poc/create");
  });

  $("#add-user").on("click", function () {
    $("#formpoc").modal("show");
    $("#formpoc form").attr("action", "/user/index");
  });

  $("#action").on("click", function () {
    showModal(
      "#foraction",
      "#action-header",
      "#action-button",
      "/status/create",
      null,
      "/status/get-record",
      function (data) {
        $("#status-description").val(data.description);
        //... populate other fields for status action if available
      },
    );
  });

  function setUpdateForm(
    modalId,
    formAction,
    recordId,
    ajaxUrl,
    fieldsCallback,
  ) {
    $(modalId).modal("show");
    $("#formpoc form").attr("action", formAction + recordId);

    $.ajax({
      url: ajaxUrl,
      method: "GET",
      data: { id: recordId },
      success: fieldsCallback,
      error: function () {
        // Handle error if needed
      },
    });

    updateModelId = recordId;
    $("#add-notes").data("update-model-id", updateModelId);
  }

  $(".update-button").on("click", function () {
    $("#formpoc").modal("show");
    $("#formpoc form").attr("action", "/poc/update?id=" + recordId); // Adjust the action URL
    $("#btn-n-save").show();
    $("#btn-n-add").hide();
    $("#formpoc-header").html(
      '<i class="ti ti-eye text-dark me-2"></i>Update Record',
    );
    $("#submit-button").html('<i class = "ti ti-pencil"></i> Update');
    var recordId = $(this).data("id");
    setUpdateForm(
      "#formpoc",
      "/poc/update?id=",
      recordId,
      "/poc/get-record",
      function (data) {
        $("#poc-name").val(data.name);
        $("#poc-email").val(data.email);
        $("#poc-email_cc").val(data.email_cc);
        $("#poc-name_cc1").val(data.name_cc1);
        $("#poc-email_cc_additional").val(data.email_cc_additional);
        $("#poc-name_cc2").val(data.name_cc2);
        $("#validationKCDIO").val(data.KCDIO);
      },
    );
  });

  $(".updateStatus-button").on("click", function () {
    $("#formpoc").modal("show");
    $("#formpoc form").attr("action", "/poc/update?id=" + recordId); // Adjust the action URL
    $("#btn-n-save").show();
    $("#btn-n-add").hide();
    $("#formpoc-header").html(
      '<i class="ti ti-eye text-dark me-2 text-dark"></i>Update Record',
    );
    $("#submit-button").html('<i class = "ti ti-pencil"></i> Update');
    var recordId = $(this).data("id");
    setUpdateForm(
      "#formpoc",
      "/status/update?id=",
      recordId,
      "/status/get-record",
      function (data) {
        $("#status-status").val(data.status);
        //... populate other fields for update status action if available
      },
    );
  });

  $(".updateuser-button").on("click", function () {
    $("#formpoc").modal("show");
    $("#formpoc form").attr("action", "/poc/update?id=" + recordId); // Adjust the action URL
    $("#btn-n-save").show();
    $("#btn-n-add").hide();
    $("#formpoc-header").html(
      '<i class="ti ti-eye text-dark me-2 text-white"></i>Update Record',
    );
    $("#submit-button").html('<i class = "ti ti-pencil"></i> Update');
    var recordId = $(this).data("id");
    setUpdateForm(
      "#formpoc",
      "/user/update?id=",
      recordId,
      "/user/get-record",
      function (data) {
        $("#useradmin-username").val(data.username);
        $("#useradmin-matric_number").val(data.matric_number);
        $("#useradmin-email").val(data.email);
        //... populate other fields for update user action if available
      },
    );
  });

  $("#btn-n-add").attr("disabled", false); // Enable the button

  $("#formpoc").on("hidden.bs.modal", function (e) {
    // Reset the form fields when the modal is closed
    $(this).find("form")[0].reset();
  });
});

//confirmation

$(document).ready(function () {
  // When any checkbox is changed
  $('input[name="selection[]"]').change(function () {
    // If any checkbox is checked, show the Delete Selected button; otherwise, hide it
    if ($('input[name="selection[]"]:checked').length > 0) {
      $("#fake-delete-btn").show();
    } else {
      $("#fake-delete-btn").hide();
    }
  });
});
$(document).ready(function () {
  // When the fake delete button is clicked
  $("#fake-delete-btn").click(function () {
    // Trigger the click event of the hidden submit button
    $("#delete-selected-btn").click();
  });
});
