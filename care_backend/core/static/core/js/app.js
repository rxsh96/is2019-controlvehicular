
/*function abrir_modal(url)
{
  $('#popup').load(url, function()
  {
    console.log("entra a la función")
    $(this).modal('show');
  });
  return false;
}*/
$(function () {
  // Create book button
  $(".report-money").modalForm({formURL: "{% url 'report_money' %}"});

  // listar detalle de servicio
  $(".detalle-service").each(function () {
    $(this).modalForm({formURL: $(this).data('id')});
  });
});


$(function () {
  $(".detalle_personal").each(function () {
    console.log("hola")
    $(this).modalForm({formURL: $(this).data('id')});
  });
});

