let currentMarket = null;
let currentLanguage = null;
let currentPaymentMethods = null;
let cart = [];
let selectedPaymentMethod = null;

// Initialize when market opens
window.addEventListener('message', function(event) {
    const data = event.data;
    
    switch(data.action) {
        case 'openMarket':
            currentMarket = data.marketData;
            currentLanguage = data.language;
            currentPaymentMethods = data.paymentMethods;
            openMarket();
            break;
        case 'closeMarket':
            closeMarket();
            break;
    }
});

function openMarket() {
    document.getElementById('market-container').classList.remove('hidden');
    document.getElementById('market-title').textContent = currentMarket.label;
    
    // Update language
    updateLanguage();
    
    // Populate items
    populateItems();
    
    // Setup event listeners
    setupEventListeners();
    
    // Initialize cart with default item (matching the image)
    updateCartDisplay();
}

function closeMarket() {
    document.getElementById('market-container').classList.add('hidden');
    document.getElementById('market-interface').classList.remove('hidden');
    document.getElementById('payment-interface').classList.add('hidden');
    cart = [];
    selectedPaymentMethod = null;
    
    // Reset payment UI
    document.querySelectorAll('.payment-option').forEach(btn => {
        btn.classList.remove('selected');
    });
    
    const confirmBtn = document.getElementById('confirm-payment-btn');
    confirmBtn.disabled = true;
    confirmBtn.textContent = 'Öde';
}

function updateLanguage() {
    document.getElementById('search-input').placeholder = currentLanguage.search_placeholder;
}

function populateItems() {
    const itemsGrid = document.getElementById('items-grid');
    itemsGrid.innerHTML = '';
    
    currentMarket.items.forEach(item => {
        const itemElement = createItemElement(item);
        itemsGrid.appendChild(itemElement);
    });
}

function createItemElement(item) {
    const itemDiv = document.createElement('div');
    itemDiv.className = 'item-card';
    itemDiv.onclick = () => addToCart(item);

    const imageDiv = document.createElement('div');
    imageDiv.className = 'item-image';

    const image = document.createElement('img');
    image.src = `nui://qb-inventory/html/images/${item.name}.png`;
    image.alt = item.label;
    image.onerror = function() {
        this.src = 'images/placeholder.png'; // yerel fallback görsel (istersen)
    };

    imageDiv.appendChild(image);

    const nameDiv = document.createElement('div');
    nameDiv.className = 'item-name';
    nameDiv.textContent = item.label;

    const priceDiv = document.createElement('div');
    priceDiv.className = 'item-price';
    priceDiv.textContent = `$${item.price.toFixed(2)}`;


    itemDiv.appendChild(nameDiv);
    itemDiv.appendChild(imageDiv);
    itemDiv.appendChild(priceDiv);

    return itemDiv;
}


function addToCart(item) {
    const existingItem = cart.find(cartItem => cartItem.name === item.name);
    
    if (existingItem) {
        existingItem.quantity += 1;
    } else {
        cart.push({
            name: item.name,
            label: item.label,
            price: item.price,
            quantity: 1
        });
    }
    
    updateCartDisplay();
}

function updateCartDisplay() {
    const cartItems = document.getElementById('cart-items');
    const cartTotal = document.getElementById('cart-total');
    
    cartItems.innerHTML = '';
    
    let totalPrice = 0;
    
    cart.forEach(item => {
        const cartItemDiv = createCartItemElement(item);
        cartItems.appendChild(cartItemDiv);
        
        totalPrice += item.price * item.quantity;
    });
    
    cartTotal.textContent = `$${totalPrice.toFixed(2)}`;
}

function createCartItemElement(item) {
    const itemDiv = document.createElement('div');
    itemDiv.className = 'cart-item';

    // Item image
    const imageDiv = document.createElement('div');
    imageDiv.className = 'cart-item-image';

    const image = document.createElement('img');
    image.src = `https://cfx-nui-qb-inventory/html/images/${item.name}.png`;
    image.alt = item.label;
    image.onerror = () => {
        image.src = 'https://cfx-nui-qb-inventory/html/images/no-image.png';
    };

    imageDiv.appendChild(image);

    // Item name
    const nameDiv = document.createElement('div');
    nameDiv.className = 'cart-item-name';
    nameDiv.textContent = item.label;

    // Item details (price and quantity)
    const detailsDiv = document.createElement('div');
    detailsDiv.className = 'cart-item-details';

    const priceDiv = document.createElement('div');
    priceDiv.className = 'cart-item-price';
    priceDiv.textContent = `$${item.price.toFixed(2)}`;

    const quantityDiv = document.createElement('div');
    quantityDiv.className = 'cart-item-quantity';

    const minusBtn = document.createElement('button');
    minusBtn.className = 'quantity-btn';
    minusBtn.textContent = '-';
    minusBtn.onclick = () => updateQuantity(item.name, -1);

    const quantitySpan = document.createElement('span');
    quantitySpan.textContent = item.quantity;

    const plusBtn = document.createElement('button');
    plusBtn.className = 'quantity-btn';
    plusBtn.textContent = '+';
    plusBtn.onclick = () => updateQuantity(item.name, 1);

    quantityDiv.appendChild(minusBtn);
    quantityDiv.appendChild(quantitySpan);
    quantityDiv.appendChild(plusBtn);

    detailsDiv.appendChild(quantityDiv);

    itemDiv.appendChild(imageDiv);
    itemDiv.appendChild(detailsDiv);

    return itemDiv;
}


function updateQuantity(itemName, change) {
    const item = cart.find(cartItem => cartItem.name === itemName);
    
    if (item) {
        item.quantity += change;
        
        if (item.quantity <= 0) {
            cart = cart.filter(cartItem => cartItem.name !== itemName);
        }
        
        updateCartDisplay();
    }
}

function clearCart() {
    cart = [];
    updateCartDisplay();
}

function openPayment() {
    if (cart.length === 0) {
        // Send notification to client instead of alert
        fetch(`https://${GetParentResourceName()}/showNotification`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                message: currentLanguage.cart_empty,
                type: 'error'
            })
        });
        return;
    }
    
    const total = cart.reduce((sum, item) => sum + (item.price * item.quantity), 0);
    
    document.getElementById('market-interface').classList.add('hidden');
    document.getElementById('payment-interface').classList.remove('hidden');
    document.getElementById('payment-total').textContent = `$${total.toFixed(2)}`;
    
    selectedPaymentMethod = null;
    updatePaymentUI();
}

function selectPaymentMethod(method) {
    selectedPaymentMethod = method;
    
    // Update UI
    document.querySelectorAll('.payment-option').forEach(btn => {
        btn.classList.remove('selected');
    });
    
    document.querySelector(`[data-method="${method}"]`).classList.add('selected');
    updatePaymentUI();
}

function updatePaymentUI() {
    const confirmBtn = document.getElementById('confirm-payment-btn');
    confirmBtn.disabled = !selectedPaymentMethod;
}

function confirmPayment() {
    if (!selectedPaymentMethod) {
        // Send notification to client instead of alert
        fetch(`https://${GetParentResourceName()}/showNotification`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                message: 'Lütfen bir ödeme yöntemi seçin!',
                type: 'error'
            })
        });
        return;
    }
    
    const total = cart.reduce((sum, item) => sum + (item.price * item.quantity), 0);
    
    // Disable the button to prevent multiple clicks
    const confirmBtn = document.getElementById('confirm-payment-btn');
    confirmBtn.disabled = true;
    confirmBtn.textContent = 'Öde';
    
    console.log('Sending purchase request:', {
        paymentMethod: selectedPaymentMethod,
        items: cart,
        total: total
    });
    
    fetch(`https://${GetParentResourceName()}/purchaseItems`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            paymentMethod: selectedPaymentMethod,
            items: cart,
            total: total
        })
    })
    .then(response => {
        console.log('Response received:', response);
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        return response.json();
    })
    .then(data => {
        console.log('Purchase response:', data);
        
        // Re-enable button
        confirmBtn.disabled = false;
        confirmBtn.textContent = 'Öde';
        
        if (data.success) {
            // Clear cart and close market completely
            cart = [];
            selectedPaymentMethod = null;
            
            // Force close the entire market interface
            setTimeout(() => {
                closeMarket();
                
                // Also send close message to client
                fetch(`https://${GetParentResourceName()}/closeMarket`, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({})
                });
            }, 1000); // Small delay to show success message
            
        } else {
            // Go back to market interface on failure
            cancelPayment();
        }
    })
    .catch(error => {
        console.error('Purchase error:', error);
        
        // Re-enable button
        confirmBtn.disabled = false;
        confirmBtn.textContent = 'Öde';
        
        // Send error notification to client
        fetch(`https://${GetParentResourceName()}/showNotification`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                message: 'Bir hata oluştu: ' + error.message,
                type: 'error'
            })
        });
        
        // Go back to market interface on error
        cancelPayment();
    });
}

function cancelPayment() {
    document.getElementById('payment-interface').classList.add('hidden');
    document.getElementById('market-interface').classList.remove('hidden');
    selectedPaymentMethod = null;
    
    // Reset payment method selection
    document.querySelectorAll('.payment-option').forEach(btn => {
        btn.classList.remove('selected');
    });
    
    // Reset confirm button
    const confirmBtn = document.getElementById('confirm-payment-btn');
    confirmBtn.disabled = true;
    confirmBtn.textContent = 'Öde';
}

function setupEventListeners() {
    const closeBtn = document.getElementById('close-btn');
    if (closeBtn) {
        closeBtn.onclick = () => {
            fetch(`https://${GetParentResourceName()}/closeMarket`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({})
            });
        };
    }

    const exitBtn = document.getElementById('exit-btn');
    if (exitBtn) {
        exitBtn.onclick = () => {
            fetch(`https://${GetParentResourceName()}/closeMarket`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({})
            });
        };
    }

    const payBtn = document.getElementById('pay-btn');
    if (payBtn) {
        payBtn.onclick = openPayment;
    }

    const clearCartBtn = document.getElementById('clear-cart-btn');
    if (clearCartBtn) {
        clearCartBtn.onclick = clearCart;
    }

    const cancelBtn = document.getElementById('cancel-payment-btn');
    if (cancelBtn) {
        cancelBtn.onclick = cancelPayment;
    }

    const confirmBtn = document.getElementById('confirm-payment-btn');
    if (confirmBtn) {
        confirmBtn.onclick = confirmPayment;
    }

    document.querySelectorAll('.payment-option').forEach(btn => {
        btn.onclick = () => selectPaymentMethod(btn.dataset.method);
    });

    const searchInput = document.getElementById('search-input');
    if (searchInput) {
        searchInput.addEventListener('input', function () {
            filterItems();
        });
    }

    const categorySelect = document.getElementById('category-select');
    if (categorySelect) {
        categorySelect.addEventListener('change', function () {
            filterItems();
        });
    }

    document.addEventListener('keyup', function (event) {
        if (event.key === 'Escape') {
            fetch(`https://${GetParentResourceName()}/closeMarket`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({})
            });
        }
    });
}

function filterItems() {
    const searchTerm = document.getElementById('search-input').value.toLowerCase();
    const selectedCategory = document.getElementById('category-select').value;
    
    const itemCards = document.querySelectorAll('.item-card');
    
    itemCards.forEach(card => {
        const itemName = card.querySelector('.item-name').textContent.toLowerCase();
        const matchesSearch = itemName.includes(searchTerm);
        const matchesCategory = selectedCategory === 'all' || selectedCategory === 'teknoloji';
        
        if (matchesSearch && matchesCategory) {
            card.style.display = 'flex';
        } else {
            card.style.display = 'none';
        }
    });
}

function GetParentResourceName() {
    return 'qg_markets';
}