document.addEventListener('DOMContentLoaded', function() {
    function handleButtonClick(content) {
        const editor = tinymce.get('emailtemplate-body'); // Replace 'emailtemplate-body' with your textarea's ID

        if (editor) {
            editor.insertContent(content);
        }
    }

    // Check if the button elements exist before attaching event listeners
    const recipientButton = document.getElementById('recipientNameButton');
    if (recipientButton) {
        recipientButton.addEventListener('click', function () {
            handleButtonClick('{recipientName}');
        });
    }

    const reasonButton = document.getElementById('reasonButton');
    if (reasonButton) {
        reasonButton.addEventListener('click', function () {
            handleButtonClick('{reason}');
        });
    }

    const linkButton = document.getElementById('linkButton');
    if (linkButton) {
        linkButton.addEventListener('click', function () {
            const text = prompt('Enter anchor text:');
            if (text !== null) {
                handleButtonClick('<a href = "{link}">' + text + '</a>');
            }

        });
    }
});
