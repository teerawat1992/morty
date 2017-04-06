$(document).ready(function () {
  $("#donation").submit(function () {
    var form = $(this);

    form.find("input[type=submit]").prop("disabled", true);

    var card = {
      "name":             form.find("#name").val(),
      "number":           form.find("#number").val(),
      "expiration_month": form.find("#expiration_month").val(),
      "expiration_year":  form.find("#expiration_year").val(),
      "security_code":    form.find("#cvv").val()
    };

    Omise.createToken("card", card, function (statusCode, response) {
      if (response.object == "error") {
        $("#errors").html('<div class="alert alert-danger">' + response.message + '</div>');
        form.find("input[type=submit]").prop("disabled", false);
      } else {
        form.find("[name=card]").val(response.id);
        form.find("#number").val("");
        form.find("#cvv").val("");
        form.get(0).submit();
      };
    });

    return false;
  });
});
