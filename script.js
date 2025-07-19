 const cart = JSON.parse(localStorage.getItem('cart')) || [];
    const container = document.getElementById('cart-items');
    let total = 0;

    if (cart.length === 0) {
      container.innerHTML = "<p style='text-align:center;'>Votre panier est vide.</p>";
    } else {
      cart.forEach(item => {
        total += item.price;
        const div = document.createElement('div');
        div.className = 'product-card';
        div.innerHTML = `
          <h2>${item.name}</h2>
          <p class="price">${item.price} $</p>
        `;
        container.appendChild(div);
      });
      document.getElementById('total-price').textContent = "Total : " + total + " $";
    }
    