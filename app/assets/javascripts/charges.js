$(document).on('turbolinks:load', function(){

  let value = 0
  $(".stripe-button-el").on('click', function(){
    value = $(".deposit").val()
    console.log(value)
  })

})
