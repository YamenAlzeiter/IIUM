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

    $("#add-notes").on("click", function (event) {
        // Set the form for creating a new record
        $("#formpoc").modal("show");
        $("#btn-n-save").hide();
        $("#btn-n-add").show();
        $("#formpoc-header").html('<i class="ti ti-file text-dark me-2 text-white"></i>Create New Record');
        $("#formpoc-button").html('<i class = "ti ti-plus"></i> Add');
        // Reset the updateModelId
        updateModelId = null;
        $("#add-notes").data("update-model-id", updateModelId); // Update data attribute
    });
    $("#action").on("click", function (event) {
        // Set the form for creating a new record
        $("#foraction").modal("show");
        $("#btn-n-save").hide();
        $("#btn-n-add").show();
        $("#action-header").html('<i class="ti ti-file text-dark me-2 text-white"></i>Take an Action');
        $("#action-button").html('<i class = "ti ti-plus"></i> Submit');
        // Reset the updateModelId
        updateModelId = null;
        $("#add-notes").data("update-model-id", updateModelId); // Update data attribute
    });

    $(".update-button").on("click", function (event) {
        // Set the form for updating an existing record
        var recordId = $(this).data("id");
        $("#formpoc").modal("show");
        $("#formpoc form").attr("action", "/poc/update?id=" + recordId); // Adjust the action URL
        $("#btn-n-save").show();
        $("#btn-n-add").hide();
        $("#formpoc-header").html('<i class="ti ti-eye text-dark me-2 text-white"></i>Update Record');
        $("#formpoc-button").html('<i class = "ti ti-pencil"></i> Update');
        // Retrieve and populate existing record data
        $.ajax({
            url: "/poc/get-record", // Add a new action to retrieve record data
            method: "GET",
            data: { id: recordId },
            success: function (data) {
                // Assuming data is in JSON format
                $("#poc-name").val(data.name);
                $("#poc-email").val(data.email);
                $("#poc-email_cc").val(data.email_cc);
                $("#poc-phone_number").val(data.phone_number);
                $("#validationKCDIO").val(data.KCDIO);
                $("#poc-kulliah").val(data.kulliah);
            },
            error: function () {
                // Handle error if needed
            }
        });

        // Set the updateModelId
        updateModelId = recordId;
        $("#add-notes").data("update-model-id", updateModelId); // Update data attribute
    });

    $(".updateStatus-button").on("click", function (event) {
        // Set the form for updating an existing record
        var recordId = $(this).data("id");

        $("#formpoc").modal("show");
        $("#formpoc form").attr("action", "/status/update?id=" + recordId); // Adjust the action URL
        $("#btn-n-save").show();
        $("#btn-n-add").hide();
        $("#formpoc-header").html('<i class="ti ti-eye text-dark me-2 text-white"></i>Update Record');
        $("#formpoc-button").html('<i class = "ti ti-pencil"></i> Update');
        // Retrieve and populate existing record data
        $.ajax({
            url: "/status/get-record", // Add a new action to retrieve record data
            method: "GET",
            data: { id: recordId },
            success: function (data) {
                // Assuming data is in JSON format
                console.log(data.description)
                $("#status-description").val(data.description);

            },
            error: function () {
                // Handle error if needed
            }
        });

        // Set the updateModelId
        updateModelId = recordId;
        $("#add-notes").data("update-model-id", updateModelId); // Update data attribute
    });

    $(".updateuser-button").on("click", function (event) {
        // Set the form for updating an existing record
        var recordId = $(this).data("id");
        $("#formpoc").modal("show");
        $("#formpoc form").attr("action", "/user/update?id=" + recordId); // Adjust the action URL
        $("#btn-n-save").show();
        $("#btn-n-add").hide();
        $("#formpoc-header").html('<i class="ti ti-eye text-dark me-2 text-white"></i>Update Record');
        $("#formpoc-button").html('<i class = "ti ti-pencil"></i> Update');
        // Retrieve and populate existing record data
        $.ajax({
            url: "/user/get-record", // Add a new action to retrieve record data
            method: "GET",
            data: { id: recordId },
            success: function (data) {
                // Assuming data is in JSON format
                $("#useradmin-username").val(data.username);
                $("#useradmin-matric_number").val(data.matric_number);
                $("#useradmin-email").val(data.email);
            },
            error: function () {
                // Handle error if needed
            }
        });

        // Set the updateModelId
        updateModelId = recordId;
        $("#add-notes").data("update-model-id", updateModelId); // Update data attribute
    });

    $("#btn-n-add").attr("disabled", false); // Enable the button
});



