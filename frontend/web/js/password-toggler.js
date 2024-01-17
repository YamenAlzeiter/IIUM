$(document).ready(function () {
  $("#show-password-toggle").change(function () {
    var passwordInput = $("#password");
    var passwordType = passwordInput.attr("type");

    // Toggle the password input type between 'password' and 'text'
    passwordInput.attr(
      "type",
      passwordType === "password" ? "text" : "password",
    );
  });
});
