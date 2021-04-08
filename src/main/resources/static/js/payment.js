
                        var API_KEY = 'pk_test_51IcYb5LHOzT4nl4bd3BYOpBNl3SAPSsGwEX0K1AFxlbLce5G7hNkSnaExlsCYu1ZMzutv8nwvY27xMoEaZ99GaCL00FYjiILpS';
                        // Create a Stripe client.
                        var stripe = Stripe(API_KEY);

                        // Create an instance of Elements.
                        var elements = stripe.elements();

                        // Create an instance of the card Element.
                        var card = elements.create('card');

                        // Add an instance of the card Element into the `card-element` <div>.
                        card.mount('#card-element');

                        // Handle real-time validation errors from the card Element.
                        card.addEventListener('change', function (event) {
                            var displayError = document.getElementById('card-errors');
                            if (event.error) {
                                displayError.textContent = event.error.message;
                            } else {
                                displayError.textContent = '';
                            }
                        });

                        // Handle form submission.
                        var form = document.getElementById('payment-form');
                        form.addEventListener('submit', function (event) {
                            event.preventDefault();
                            // handle payment
                            handlePayments();
                        });

                        //handle card submission
                        function handlePayments() {
                            stripe.createToken(card).then(function (result) {
                                if (result.error) {
                                    // Inform the user if there was an error.
                                    var errorElement = document.getElementById('card-errors');
                                    errorElement.textContent = result.error.message;
                                } else {
                                    // Send the token to your server.
                                    var token = result.token.id;
                                    var email = $('#email').val();
                                    var pPrice = $('#product-price').html();
                                    //var pPrice = $('#product-price').html(); 
                                    //var pPrice =parseDouble($('#product-price').html());

                                    $.get(
                                            "payment/create-charge",
                                            {email: email, token: token, amount: pPrice},
                                            function (data) {
                                                alert(data.details);
                                            }, 'json');
                                }
                            });
                        }
             