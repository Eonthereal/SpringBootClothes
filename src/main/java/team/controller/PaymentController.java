package team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import static java.lang.Integer.parseInt;
import java.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import team.entity.Orders;
import team.entity.ProductOrders;
import team.entity.Response;
import team.entity.User;
import team.service.OrdersService;
import team.service.ProductService;
//import com.stripe.service.StripeService;
//import com.stripe.utils.Response;
import team.service.StripeService;
import team.service.UserService;

@Controller
@RequestMapping("user/cart/checkout/payment")
public class PaymentController {

//    @Value("${stripe.key.public}")
//    private String API_PUBLIC_KEY;
    @Autowired
    private StripeService stripeService;

    @Autowired
    OrdersService ordersService;
    @Autowired
    ProductService productService;
    @Autowired
    UserService userService;

//    public PaymentController(StripeService stripeService) {
//        this.stripeService = stripeService;
//    }
//	@GetMapping("/")
//	public String homepage() {
//		return "homepage";
//	}
//    @GetMapping("/subscription")
//    public String subscriptionPage(Model model) {
//        model.addAttribute("stripePublicKey", API_PUBLIC_KEY);
//        return "subscription";
//    }
//
//    @GetMapping("/charge")
//    public String chargePage(Model model) {
//        model.addAttribute("stripePublicKey", API_PUBLIC_KEY);
//        return "charge";
//    }
//    @PostMapping("/create-subscription")
//    public @ResponseBody
//    Response createSubscription(String email, String token, String plan, String coupon) {
//
//        if (token == null || plan.isEmpty()) {
//            return new Response(false, "Stripe payment token is missing. Please try again later.");
//        }
//
//        String customerId = stripeService.createCustomer(email, token);
//
//        if (customerId == null) {
//            return new Response(false, "An error accurred while trying to create customer");
//        }
//
//        String subscriptionId = stripeService.createSubscription(customerId, plan, coupon);
//
//        if (subscriptionId == null) {
//            return new Response(false, "An error accurred while trying to create subscription");
//        }
//
//        return new Response(true, "Success! your subscription id is " + subscriptionId);
//    }
//    @PostMapping("/cancel-subscription")
//    public @ResponseBody
//    Response cancelSubscription(String subscriptionId) {
//
//        boolean subscriptionStatus = stripeService.cancelSubscription(subscriptionId);
//
//        if (!subscriptionStatus) {
//            return new Response(false, "Faild to cancel subscription. Please try again later");
//        }
//
//        return new Response(true, "Subscription cancelled successfully");
//    }
//    @PostMapping("/coupon-validator")
//    public @ResponseBody
//    Response couponValidator(String code) {
//
//        Coupon coupon = stripeService.retriveCoupon(code);
//
//        if (coupon != null && coupon.getValid()) {
//            String details = (coupon.getPercentOff() == null ? "$" + (coupon.getAmountOff() / 100)
//                    : coupon.getPercentOff() + "%") + "OFF" + coupon.getDuration();
//            return new Response(true, details);
//        }
//        return new Response(false, "This coupon code is not available. This may be because it has expired or has "
//                + "already been applied to your account.");
//    }
//    @PostMapping("/create-charge")
//    public @ResponseBody
    @RequestMapping(value = "/create-charge/{ordersid}", method = RequestMethod.GET)
    public @ResponseBody
    //afou i vivvliothiki tou indou pairnei mono int os amount kai den pairnei float. ti kanoume?
    // orizoume sto controller to amount os string etsi oste meta to poso na to epexergastoume me java kodika oti morfi kai na exei
    Response createCharge(String email, String token, String amount, @PathVariable("ordersid") int ordersid) {

        System.out.println("--------Controller amount 1 :  " + amount);

        //afout opos katalavame i vivliothiki tou indou kanei ta dio teleutaia psifia tou arithmou dekadika tote kai emeis afairoume to koma apo to poso mas etsi oste na to perasoume sto rest api
        //me auto to tropo o int arithmos mas tha exei  kai ta dio dekadika mesa, kai to rest api tou indou afou ta 2 teleutaia psifia ta katalavainei os decimal tha ta kanei metatropi autos
        int fixedAmount = parseInt(amount.replace(".", "").replace(",", ""));

        System.out.println("--------Controller amount 1 :  " + fixedAmount);

        if (token == null) {
            return new Response(false, "Stripe payment token is missing. Please try again later.");
        }

        String chargeId = stripeService.createCharge(email, token, fixedAmount);// 9.99 usd

        if (chargeId != null) {

            System.out.println("--------Controller amount 2 :  " + amount);
            int productOrderQty;
            int productStock;

            Orders order = ordersService.findById(ordersid);

            for (ProductOrders x : order.getProductList()) {
                productOrderQty = x.getQuantity();
                productStock = x.getProduct().getStock();
                x.getProduct().setStock(productStock - productOrderQty);
                productService.saveProduct(x.getProduct());
                
            }
            int orderCredits = (int) Math.round(order.getTotalcost()/5);
            int currentCredits = order.getUser().getCredits();
            User user = order.getUser();
            
            user.setCredits(currentCredits+orderCredits);
            
            userService.updateUser(user);
            

            order.setStatus("SUBMITTED");
            order.setOrderdate(LocalDate.now());

            ordersService.saveOrder(order);

            return new Response(true, "The payment completed successfully with charge id:  " + chargeId);

        } else {

            return new Response(false, "An error occured with your payment. Please Contact Support.");
        }

        // System.out.println("dfasdfdsa fasdfasdf sadfas fsa");
    }
}
