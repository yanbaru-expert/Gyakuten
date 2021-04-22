document.addEventListener('turbolinks:load', () => {
  const stripe = Stripe('pk_live_TarpapV3tug0Vx2CphYOFECA00Ni3DM9JR');
  const checkoutButtons = document.querySelectorAll('.cta-btn');
  const priceId = 'price_1IdnvGGiRzWonoYFW4sxYrTM';

  let baseUrl = '';

  switch (location.host) {
    case 'www.yanbaru-code.com':
      baseUrl = 'https://www.yanbaru-code.com';
      break;
    case 'gyakuten-app-staging.herokuapp.com':
      baseUrl = 'https://gyakuten-app-staging.herokuapp.com';
      break;
  }

  checkoutButtons.forEach((checkoutButton) => {
    checkoutButton.addEventListener('click', () => {
      if (baseUrl === '') {
        alert('開発環境では Stripe に遷移できません');
      } else {
        stripe
          .redirectToCheckout({
            lineItems: [{ price: priceId, quantity: 1 }],
            mode: 'payment',
            successUrl: `${baseUrl}/design_success`,
            cancelUrl: `${baseUrl}/design`,
          })
          .then(function (result) {
            if (result.error) {
              const displayError = document.getElementById('error-message');
              displayError.textContent = result.error.message;
            }
          });
      }
    });
  });
});
