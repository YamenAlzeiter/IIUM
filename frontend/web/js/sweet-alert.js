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
            .replace("/outbound/download", "/outbound/downloader");

          console.log(downloadLink);
          downloadLink.download = "filename_to_save_as";
          downloadLink.click();
        }
      },
      "json",
    );
  });
});
