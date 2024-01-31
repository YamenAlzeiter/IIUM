// Wait for the DOM content to be fully loaded before executing JavaScript
document.addEventListener("DOMContentLoaded", function () {
  // Define a function to handle button clicks and insert content into TinyMCE editor
  function handleButtonClick(content) {
    // Get the TinyMCE editor instance by its ID (replace 'emailtemplate-body' with your textarea's ID)
    const editor = tinymce.get("emailtemplate-body");

    // If the editor instance exists
    if (editor) {
      // Insert the provided content into the editor
      editor.insertContent(content);
    }
  }

  // Check if the recipientNameButton element exists before attaching the event listener
  const recipientButton = document.getElementById("recipientNameButton");
  if (recipientButton) {
    // Add a click event listener to the recipientNameButton
    recipientButton.addEventListener("click", function () {
      // When clicked, insert the '{recipientName}' placeholder into the editor
      handleButtonClick("{recipientName}");
    });
  }

  // Check if the reasonButton element exists before attaching the event listener
  const reasonButton = document.getElementById("reasonButton");
  if (reasonButton) {
    // Add a click event listener to the reasonButton
    reasonButton.addEventListener("click", function () {
      // When clicked, insert the '{reason}' placeholder into the editor
      handleButtonClick("{reason}");
    });
  }

  // Check if the linkButton element exists before attaching the event listener
  const linkButton = document.getElementById("linkButton");
  if (linkButton) {
    // Add a click event listener to the linkButton
    linkButton.addEventListener("click", function () {
      // Prompt the user to enter anchor text
      const text = prompt("Enter anchor text:");
      // If the user entered text
      if (text !== null) {
        // Insert the anchor tag with the provided text and '{link}' placeholder into the editor
        handleButtonClick('<a href="{link}">' + text + "</a>");
      }
    });
  }
});
