function post () {

  const price_breakdown = document.getElementById("item-price")
  price_breakdown.addEventListener("input", function(){
    const total_price = document.getElementById("item-price").value;
    const tax_price_with_decimal = total_price * 0.1
    const tax_price = Math.floor(tax_price_with_decimal).toLocaleString();
    const margin_with_decimal = total_price * 0.9
    const margin = Math.floor(margin_with_decimal).toLocaleString();
    const add_tax_price = document.getElementById("add-tax-price")
    const profit = document.getElementById("profit")
    add_tax_price.innerHTML = tax_price + " "
    profit.innerHTML = margin + " "
  });
};

window.addEventListener('load', post);
