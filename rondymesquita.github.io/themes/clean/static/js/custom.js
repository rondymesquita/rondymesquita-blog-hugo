$(document).ready(function(){

  descriptions = [
  	"Coffee and Code",
  	"Um café e um bom dia não se nega a ninguém",
  	"Já tomou seu café hoje?",
  	"Que o café esteja com você!",
  	"Paciência você deve ter meu jovem Padawan.",
  	"Mais de 8000?",
  	"Fu-são! Ráááááá",
  	"Arrrrrrrggggggghhhh - Chewbacca",
  	"Luke, I am your father!",
  	"Ka-me-ha-me-haaaaaaaaa",
  	"Em todos esses anos nessa industria vital...",
  	"Why so serious? >D",
  	"My precious...",
  	"I am Batman"
  ]

  //change site desccription
  var random = Math.floor(Math.random() * descriptions.length);
  $("#site-description").text(descriptions[random])

});
