// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

//const channels = require.context('.', true, /_channel\.js$/)
//channels.keys().forEach(channels)

window.addEventListener('load', function(){
  
  const price = document.getElementById("item-price")
  const commission = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

price.addEventListener('change', function(){
  let item_price = price.value;
  let item_commission = item_price * 0.1
  let item_profit = item_price * 0.9
  console.log(item_commission)
  console.log(item_profit)
  commission.innerHTML = item_commission
  profit.innerHTML = item_profit
})
    
})




