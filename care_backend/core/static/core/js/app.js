
$(function () {
  // listar detalle de negocio
  $(".business_detail").each(function () {
    $(this).modalForm({formURL: $(this).data('id')});
  });

  // Actualizar detalle de negocio
  $(".business_update").each(function () {
    $(this).modalForm({formURL: $(this).data('id')});
  });

  // Eliminar detalle de negocio
  $(".business_delete").each(function () {
    $(this).modalForm({formURL: $(this).data('id')});
  })


  $(".alert").fadeTo(2000, 500).slideUp(500, function(){
    $(".alert").slideUp(500);
  });
});