import 'package:ask_quotation_customer/company_data/company_data.dart';

class URLNetwork{
  urlNetwork(){
    var url = '127.0.0.1:5000';
    return url;
  }
// urlNetwork() {
//   var url = '10.0.2.2:5000';
//   return url;
// }
}

String uri = URLNetwork().urlNetwork();

requestUrl(var requestEndPoint){
  var requestUrl = Uri.http(uri, '$requestEndPoint');
  return requestUrl;
}

var customerRegistration = requestUrl('kaizen/api/customer/register');
var customerLogin = requestUrl('kaizen/api/customer/login');
var currentCustomerDetails = requestUrl('kaizen/api/customer/currentUser');
var customerRefreshToken = requestUrl('kaizen/api/customer/refreshToken');
var customerEmailVerification = requestUrl('kaizen/api/customer/emailVerification');
var customerMobileVerification = requestUrl('kaizen/api/customer/contactVerification');

var requestCompanyDataAccess = requestUrl('kaizen/api/bothAdmin/allowingCustomer');

var addItemToWishList = requestUrl('kaizen/api/customer/addToWishlist');
var deleteFromWishList = requestUrl('kaizen/api/customer/deleteItemWishlist');
var updateWishListItemQuantity = requestUrl('kaizen/api/customer/updateQtyWishlist');

getProducts(String category, String page){
  var getProducts = requestUrl('kaizen/api/customer/$companyUsername/$category/$page');
  return getProducts;
}
var getAllCategories = requestUrl('kaizen/api/customer/getAllCategory/$companyUsername');