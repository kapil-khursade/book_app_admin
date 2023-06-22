//= require active_admin/base
$(document).on("change", "#book_section_id", function () {
  var sectionId = $(this).val();
  var shelvesSelect = $("#book_shelf_id");

  $.ajax({
    url: `http://127.0.0.1:3000/api/shelves?section_id=${sectionId}`,
    type: "GET",
    dataType: "json",
    success: function (data) {
      shelvesSelect.empty();
      $.each(data, function (key, value) {
        shelvesSelect.append(
          '<option value="' + value.id + '">' + value.name + "</option>"
        );
      });
    },
  });
});
