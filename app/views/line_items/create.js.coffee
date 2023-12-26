cart = document.querySelector("#cart") 
cart.innerHTML = "<%= j render(@cart) %>"

notice = document.querySelector("#notice")
if notice
  notice.style.display = "none"