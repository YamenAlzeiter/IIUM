$(document).ready(function () {
  // When the delete button is clicked
  $("#delete-selected-btn").click(function (e) {
    e.preventDefault(); // Prevent the default form submission

    // Show SweetAlert2 confirmation dialog
    Swal.fire({
      icon: "warning",
      title: "Are you sure?",
      text: "You are about to delete selected items.",
      showCancelButton: true,
      confirmButtonText: "Yes, delete them!",
      cancelButtonText: "No, cancel!",
      confirmButtonColor: "#FA896B",
      cancelButtonColor: "#5D87FF",
      iconColor: "#FFAE1F",
      reverseButtons: true,
      customClass: {
        title: "title", // Apply custom class to title
      },
    }).then((result) => {
      // If user confirms deletion
      if (result.isConfirmed) {
        // Proceed with form submission
        var form = $(this).closest("form");
        $.post(
          form.attr("action"),
          form.serialize(),
          function (data) {
            if (data.success) {
              Swal.fire({
                icon: "success",
                title: "Success",
                text: "Selected items deleted successfully.",
                showConfirmButton: false,
                timer: 2000,
                customClass: {
                  title: "title", // Apply custom class to title
                },
              }).then(function () {
                location.reload(); // Reload page after successful deletion
              });
            } else {
              Swal.fire({
                icon: "error",
                title: "Oops...",
                text: "No items selected for deletion.",
                confirmButtonColor: "#5D87FF",
                iconColor: "#FA896B",
                customClass: {
                  title: "title", // Apply custom class to title
                },
              });
            }
          },
          "json",
        );
      }
    });
  });
});

$(document).ready(function () {
  // When a delete action link is clicked
  $(".delete-record").click(function (e) {
    e.preventDefault(); // Prevent default action

    var deleteUrl = $(this).data("action"); // Get the delete action URL from data attribute

    // Show SweetAlert confirmation dialog
    Swal.fire({
      icon: "warning",
      title: "Are you sure?",
      text: "You are about to delete?",
      showCancelButton: true,
      confirmButtonText: "Yes, delete them!",
      cancelButtonText: "No, cancel!",
      confirmButtonColor: "#FA896B",
      cancelButtonColor: "#5D87FF",
      iconColor: "#FFAE1F",
      reverseButtons: true,
      customClass: {
        title: "title",
      },
    }).then((result) => {
      if (result.isConfirmed) {
        // If user confirms, proceed with the deletion
        $.post(deleteUrl, {}, function (data) {
          // Handle success or failure response if needed
          // Reload the page or update the grid after deletion
          location.reload();
        });
      }
    });
  });
});

$(document).ready(function () {
  $(document).on("click", "#download", function (e) {
    e.preventDefault(); // Prevent default anchor behavior
    var link = $(this);
    $.post(
      link.attr("href"),

      function (data) {
        if (!data.success) {
          Swal.fire({
            icon: "error",
            title: "Oops...",
            text: "File might be missing or corrupted.",
            confirmButtonColor: "#5D87FF",
            iconColor: "#FA896B",
            customClass: {
              title: "title", // Apply custom class to title
            },
          });
        } else {
          var downloadLink = document.createElement("a");
          downloadLink.href = link
            .attr("href")
            .replace("/download", "/downloader");

          console.log(downloadLink);
          downloadLink.download = "filename_to_save_as";
          downloadLink.click();
        }
      },
      "json",
    );
  });
});
