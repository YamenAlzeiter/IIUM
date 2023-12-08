CKEDITOR.plugins.add('insertRecipientName', {
    init: function (editor) {
        editor.addCommand('insertRecipientName', {
            exec: function (editor) {
                var recipientName = 'John Doe'; // Replace with the actual recipient name or get it dynamically
                editor.insertHtml('<span id="username">HI</span>');
            }
        });

        editor.ui.addButton('InsertRecipientName', {
            label: 'Insert Recipient Name',
            command: 'insertRecipientName',
            toolbar: 'insert',
            icon: 'https://path-to-your-icon-image/icon.png' // Replace with the actual path to your icon
        });
    }
});
