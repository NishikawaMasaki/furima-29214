window.addEventListener('mouseover', function(){
  
  const price = document.getElementById("item-price")
  const commission = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

price.addEventListener('change', function(){
  let item_price = price.value;
  let item_commission = Math.floor(item_price * 0.1)
  let item_profit = item_price - item_commission
  console.log(item_commission)
  console.log(item_profit)
  commission.innerHTML = item_commission
  profit.innerHTML = item_profit
})
    
})




