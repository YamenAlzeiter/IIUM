$(function () {
    var updateModelId = null;
    var $formUpload = $('#form-upload');
    var $addDocs = $("#upload");
    var $btnNAdd = $("#btn-n-add");
    var $btnNSave = $("#btn-n-save");
    var $form = $formUpload.find('form');

    function resetFormAndModal() {
        updateModelId = null;
        // $form[0].reset();
        $btnNSave.hide();
        $btnNAdd.show();
        console.log('im here')
        $form.attr("");
    }

    function showModal(headerText, buttonText) {
        $formUpload.modal("show");
        $("#form-upload-header").html(headerText);
        $("#form-upload-button").html(buttonText);
    }
    $addDocs.on("click", function () {
        resetFormAndModal();
        showModal('<i class="ti ti-file text-dark me-2 text-white"></i>Upload Your Documnets', '<i class = "ti ti-plus"></i> Add');
    });

    $("#btn-n-add").attr("disabled", false);
});