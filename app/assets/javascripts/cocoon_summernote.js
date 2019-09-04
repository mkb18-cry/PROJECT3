$(document).on('cocoon:after-insert', 'form', function(e, insertedItem) {
    insertedItem.find('[data-provider="summernote"]').each(function() {
      $(this).summernote();  
    })  
});