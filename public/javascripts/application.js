jQuery(document).ready(function( $ ){
    $("#formulario_codigo").focus();
    
    $('table > tbody > tr:odd').addClass('odd');
    $('table > tbody > tr').hover(function(){
      $(this).toggleClass('hover');
    });

});