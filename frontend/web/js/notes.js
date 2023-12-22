$(function () {
    var updateModelId = null;
    var $formpoc = $('#formpoc');
    var $addNotes = $("#add-notes");
    var $btnNAdd = $("#btn-n-add");
    var $btnNSave = $("#btn-n-save");
    var $form = $formpoc.find('form');

    function resetFormAndModal() {
        updateModelId = null;
        $form[0].reset();
        $btnNSave.hide();
        $btnNAdd.show();
        console.log('im here')
        $form.attr("");
    }

    function showModal(headerText, buttonText) {
        $formpoc.modal("show");
        $("#formpoc-header").html(headerText);
        $("#formpoc-button").html(buttonText);
    }

    function populateFormWithData(url, id, dataSelectors) {
        $.ajax({
            url: url, method: "GET", data: {id: id}, success: function (data) {
                for (var key in dataSelectors) {
                    $(dataSelectors[key]).val(data[key]);
                }
            }, error: function () {
                // Handle error if needed
            }
        });
    }

    $(".note-link").click(function () {
        var category = this.id;

        if (category === "all-category" || category === "important") {
            var $el = $("." + category).fadeIn();
            $("#note-full-container > div").not($el).hide();
        }

        $(".note-link").removeClass("active");
        $(this).addClass("active");
    });

    $('#formpoc').on('hidden.bs.modal', function () {
        resetFormAndModal();
    });

    $addNotes.on("click", function () {

        updateModelId = null;
        $addNotes.data("update-model-id", updateModelId);
        resetFormAndModal();
        showModal('<i class="ti ti-file text-dark me-2 text-white"></i>Create New Record', '<i class = "ti ti-plus"></i> Add');
    });

    $("#action").on("click", function () {
        $("#foraction").modal("show");
        resetFormAndModal();
        showModal('<i class="ti ti-file text-dark me-2 text-white"></i>Take an Action', '<i class = "ti ti-plus"></i> Submit');
    });

    $(".update-button, .updateStatus-button, .updateuser-button").on("click", function () {
        var recordId = $(this).data("id");
        $formpoc.modal("show");
        $btnNSave.show();
        $btnNAdd.hide();
        $("#formpoc-header").html('<i class="ti ti-eye text-dark me-2 text-white"></i>Update Record');
        $("#formpoc-button").html('<i class = "ti ti-pencil"></i> Update');

        if ($(this).hasClass("update-button")) {

            populateFormWithData("/outbound/get-record", recordId, {
                Proof_of_sponsorship: "#Proof_of_sponsorship",
                Proof_insurance_cover: "#Proof_insurance_cover",
                Letter_of_indemnity: "#Letter_of_indemnity",
                Flight_ticket: "#Flight_ticket",

            });
        }
        $("#formpoc-button").on("click", function () {
            if ($(this).hasClass("update-button")) {
                $form.attr("action", "/outbound/update?id=" + recordId);
            }
        });

        updateModelId = recordId;
        $addNotes.data("update-model-id", updateModelId);
    });

    $("#btn-n-add").attr("disabled", false);
});
//to do : fix update/ create glitch still not working loser ;)