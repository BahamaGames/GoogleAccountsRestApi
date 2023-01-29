/*
by		: BAHAMAGAMES / rickky
GMail	: bahamagames@gmail.com 
Discord	: rickky#1696
GitHub	: https://github.com/BahamaGames

Source	: https://cloud.google.com/identity-platform/docs/reference/rest/v1/accounts
*/

/// Feather disable all

/*
Uses Google's account REST API: https://cloud.google.com/identity-platform/docs/reference/rest/v1/accounts
Go to respective end-point to see response json.

If <bahamagames> instance doesnt exists go to <__bg_google_accounts_http_request>, and delete marked line.
*/

//Default apikey to be used if function api keys are are not passed.
#macro GOOGLE_APIKEY				"ENTER_API_KEY_HERE"

//Destroy map when done: ds_map_destroy(GOOGLE_ACCOUNTS_HTTP_MAP);
#macro GOOGLE_ACCOUNTS_HTTP_MAP		global.__BG_GOOGLE_ACCOUNTS_HTTP_MAP

//  end-point						https://cloud.google.com/identity-platform/docs/reference/rest/v1/accounts/createAuthUri
/// @description					If an email identifier is specified, checks and returns if any user account is 
///									registered with the email. If there is a registered account, fetches all providers 
///									associated with the account's email. If the provider ID of an Identity Provider (IdP)
///									is specified, creates an authorization URI for the IdP. The user can be directed to 
///									this URI to sign in with the IdP.
/// @param {Struct}		fields		- Keys that can be entered can be found at end-point.
/// @param {Function}	callback	- Function to execute with http async_load as parameter.
/// @param {String}		apikey		- Api key from google.
/// @return {Real}					Http Async Request ID.
function google_account_create_auth_uri(__bg_fields, __bg_callback = undefined, __bg_apikey = GOOGLE_APIKEY)
{
	return __bg_google_accounts_http_request("createAuthUri", json_stringify(__bg_fields), __bg_callback, __bg_apikey);
}

//  end-point						https://cloud.google.com/identity-platform/docs/reference/rest/v1/accounts/delete
/// @description					Deletes a user's account.
/// @param {Struct}		fields		- Keys that can be entered can be found at end-point.
/// @param {Function}	callback	- Function to execute with http async_load as parameter.
/// @param {String}		apikey		- Api key from google.
/// @return {Real}					Http Async Request ID.
function google_account_delete(__bg_fields, __bg_callback = undefined, __bg_apikey = GOOGLE_APIKEY)
{
	return __bg_google_accounts_http_request("delete", json_stringify(__bg_fields), __bg_callback, __bg_apikey);
}

//  end-point						https://cloud.google.com/identity-platform/docs/reference/rest/v1/accounts/lookup
/// @description					Gets account information for all matched accounts. For an end user request, 
///									retrieves the account of the end user. For an admin request with Google OAuth 2.0 
///									credential, retrieves one or multiple account(s) with matching criteria.
/// @param {Struct}		fields		- Keys that can be entered can be found at end-point.
/// @param {Function}	callback	- Function to execute with http async_load as parameter.
/// @param {String}		apikey		- Api key from google.
/// @return {Real}					Http Async Request ID.
function google_account_lookup(__bg_fields, __bg_callback = undefined, __bg_apikey = GOOGLE_APIKEY)
{
	return __bg_google_accounts_http_request("lookup", json_stringify(__bg_fields), __bg_callback, __bg_apikey);
}

//  end-point						https://cloud.google.com/identity-platform/docs/reference/rest/v1/accounts/resetPassword
/// @description					Resets the password of an account either using an out-of-band code generated by sendOobCode
///									or by specifying the email and password of the account to be modified. Can also check the 
///									purpose of an out-of-band code without consuming it.
/// @param {Struct}		fields		- Keys that can be entered can be found at end-point.
/// @param {Function}	callback	- Function to execute with http async_load as parameter.
/// @param {String}		apikey		- Api key from google.
/// @return {Real}					Http Async Request ID.
function google_account_reset_password(__bg_fields, __bg_callback = undefined, __bg_apikey = GOOGLE_APIKEY)
{
	return __bg_google_accounts_http_request("resetPassword", json_stringify(__bg_fields), __bg_callback, __bg_apikey);
}

//  end-point						https://cloud.google.com/identity-platform/docs/reference/rest/v1/accounts/sendOobCode
/// @description					Sends an out-of-band confirmation code for an account. Requests from a authenticated 
///									request can optionally return a link including the OOB code instead of sending it.
/// @param {Struct}		fields		- Keys that can be entered can be found at end-point.
/// @param {Function}	callback	- Function to execute with http async_load as parameter.
/// @param {String}		apikey		- Api key from google.
/// @return {Real}					Http Async Request ID.
function google_account_send_oob_code(__bg_fields, __bg_callback = undefined, __bg_apikey = GOOGLE_APIKEY)
{
	return __bg_google_accounts_http_request("sendOobCode", json_stringify(__bg_fields), __bg_callback, __bg_apikey);
}

//  end-point						https://cloud.google.com/identity-platform/docs/reference/rest/v1/accounts/sendVerificationCode
/// @description					Sends a SMS verification code for phone number sign-in.
/// @param {Struct}		fields		- Keys that can be entered can be found at end-point.
/// @param {Function}	callback	- Function to execute with http async_load as parameter.
/// @param {String}		apikey		- Api key from google.
/// @return {Real}					Http Async Request ID.
function google_account_send_verification_code(__bg_fields, __bg_callback = undefined, __bg_apikey = GOOGLE_APIKEY)
{
	return __bg_google_accounts_http_request("sendVerificationCode", json_stringify(__bg_fields), __bg_callback, __bg_apikey);
}

//  end-point						https://cloud.google.com/identity-platform/docs/reference/rest/v1/accounts/signInWithCustomToken
/// @description					Signs in a user with email and password. If the sign-in succeeds,
///									a new Identity Platform ID token and refresh token are issued for
///									the user.
/// @param {String}		token		- A JSON Web Token (JWT) that includes the claims listed in the (end-point API reference under the "Custom Token Claims" section).
/// @param {Function}	callback	- Function to execute with http async_load as parameter.
/// @param {String}		apikey		- Api key from google.
/// @return {Real}					Http Async Request ID.
function google_account_signin_with_custom_token(__bg_token, __bg_callback = undefined, __bg_apikey = GOOGLE_APIKEY)
{
	var 
	__bg_fields	= {"requestSecureToken": true, "token": __bg_token},
	__bg_id		= __bg_google_accounts_http_request("signInWithCustomToken", json_stringify(__bg_fields), __bg_callback, __bg_apikey);
	delete __bg_fields;
	return __bg_id;
}

//  end-point						https://cloud.google.com/identity-platform/docs/reference/rest/v1/accounts/signInWithEmailLink
/// @description					Signs in or signs up a user with a out-of-band code from an email link. If a user does not exist 
///									with the given email address, a user record will be created. If the sign-in succeeds, an Identity 
///									Platform ID and refresh token are issued for the authenticated user.
/// @param {Struct}		fields		- Keys that can be entered can be found at end-point.
/// @param {Function}	callback	- Function to execute with http async_load as parameter.
/// @param {String}		apikey		- Api key from google.
/// @return {Real}					Http Async Request ID.
function google_account_signin_with_email_link(__bg_fields, __bg_callback = undefined, __bg_apikey = GOOGLE_APIKEY)
{
	return __bg_google_accounts_http_request("signInWithEmailLink", json_stringify(__bg_fields), __bg_callback, __bg_apikey);
}

//  end-point						https://cloud.google.com/identity-platform/docs/reference/rest/v1/accounts/signInWithGameCenter
/// @description					Signs in or signs up a user with iOS Game Center credentials. If the sign-in succeeds, a new 
///									Identity Platform ID token and refresh token are issued for the authenticated user. The bundle ID
///									is required in the request header as x-ios-bundle-identifier.
/// @param {Struct}		fields		- Keys that can be entered can be found at end-point.
/// @param {Function}	callback	- Function to execute with http async_load as parameter.
/// @param {String}		apikey		- Api key from google.
/// @return {Real}					Http Async Request ID.
function google_account_signin_with_game_center(__bg_fields, __bg_callback = undefined, __bg_apikey = GOOGLE_APIKEY)
{
	return __bg_google_accounts_http_request("signInWithGameCenter", json_stringify(__bg_fields), __bg_callback, __bg_apikey);
}

//  end-point						https://cloud.google.com/identity-platform/docs/reference/rest/v1/accounts/signInWithIdp
/// @description					Signs in or signs up a user using credentials from an Identity Provider (IdP). This is done by 
///									manually providing an IdP credential, or by providing the authorization response obtained via the
///									authorization request from accounts.createAuthUri. If the sign-in succeeds, a new Identity Platform
///									ID token and refresh token are issued for the authenticated user. A new Identity Platform user 
///									account will be created if the user has not previously signed in to the IdP with the same account. 
///									In addition, when the "One account per email address" setting is enabled, there should not be an 
///									existing Identity Platform user account with the same email address for a new user account to be created.
/// @param {Struct}		fields		- Keys that can be entered can be found at end-point.
/// @param {Function}	callback	- Function to execute with http async_load as parameter.
/// @param {String}		apikey		- Api key from google.
/// @return {Real}					Http Async Request ID.
function google_account_signin_with_idp(__bg_fields, __bg_callback = undefined, __bg_apikey = GOOGLE_APIKEY)
{
	return __bg_google_accounts_http_request("signInWithIdp", json_stringify(__bg_fields), __bg_callback, __bg_apikey);
}

//  end-point						https://cloud.google.com/identity-platform/docs/reference/rest/v1/accounts/signInWithPassword
/// @description					Signs in a user with email and password. If the sign-in succeeds, a new Identity Platform ID 
///									token and refresh token are issued for the authenticated user.
/// @param {Struct}		email		- The email the user is signing in with. The length of email should be less than 256 characters and in the format of name@domain.tld. The email should also match the RFC 822 addr-spec production.
/// @param {String}		password	- The password the user provides to sign in to the account.
/// @param {Function}	callback	- Function to execute with http async_load as parameter.
/// @param {String}		apikey		- Api key from google.
/// @return {Real}					Http Async Request ID.
function google_account_signin_with_password(__bg_email, __bg_password, __bg_callback = undefined, __bg_apikey = GOOGLE_APIKEY)
{
	var 
	__bg_fields = {"returnSecureToken": true, "email": __bg_email, "password": __bg_password},
	__bg_id		= __bg_google_accounts_http_request("signInWithPassword", json_stringify(__bg_fields), __bg_callback, __bg_apikey);
	delete __bg_fields;
	return __bg_id;
}

//  end-point						https://cloud.google.com/identity-platform/docs/reference/rest/v1/accounts/signInWithPhoneNumber
/// @description					Completes a phone number authentication attempt. If a user already exists with the given phone 
///									number, an ID token is minted for that user. Otherwise, a new user is created and associated with
///									the phone number. This method may also be used to link a phone number to an existing user.
/// @param {Struct}		fields		- Keys that can be entered can be found at end-point.
/// @param {Function}	callback	- Function to execute with http async_load as parameter.
/// @param {String}		apikey		- Api key from google.
/// @return {Real}					Http Async Request ID.
function google_account_signin_with_phone_number(__bg_fields, __bg_callback = undefined, __bg_apikey = GOOGLE_APIKEY)
{
	return __bg_google_accounts_http_request("signInWithPhoneNumber", json_stringify(__bg_fields), __bg_callback, __bg_apikey);
}

//  end-point						https://cloud.google.com/identity-platform/docs/reference/rest/v1/accounts/signUp
/// @description					Signs up a new email and password user or anonymous user, or upgrades an anonymous 
///									user to email and password. For an admin request with a Google OAuth 2.0 credential
///									with the proper permissions, creates a new anonymous, email and password, or phone 
///									number user.
/// @param {Struct}		fields		- Keys that can be entered can be found at end-point.
/// @param {Function}	callback	- Function to execute with http async_load as parameter.
/// @param {String}		apikey		- Api key from google.
/// @return {Real}					Http Async Request ID.
function google_account_signup(__bg_fields = {}, __bg_callback = undefined, __bg_apikey = GOOGLE_APIKEY)
{	
	__bg_fields[$ "returnSecureToken"] = true;
	return __bg_google_accounts_http_request("signUp", json_stringify(__bg_fields), __bg_callback, __bg_apikey);
}

//  end-point						https://cloud.google.com/identity-platform/docs/reference/rest/v1/accounts/update
/// @description					Updates account-related information for the specified user by setting specific 
///									fields or applying action codes. Requests from administrators and end users are
///									supported.
/// @param {Struct}		fields		- Keys that can be entered can be found at end-point.
/// @param {Function}	callback	- Function to execute with http async_load as parameter.
/// @param {String}		apikey		- Api key from google.
/// @return {Real}					Http Async Request ID.
function google_account_update(__bg_fields, __bg_callback = undefined, __bg_apikey = GOOGLE_APIKEY)
{
	__bg_fields[$ "returnSecureToken"] = true;
	return __bg_google_accounts_http_request("update", json_stringify(__bg_fields), __bg_callback, __bg_apikey);
}

//  end-point						https://cloud.google.com/identity-platform/docs/reference/rest/v1/accounts/verifyIosClient
/// @description					Verifies an iOS client is a real iOS device. If the request is valid, a reciept will be sent 
///									in the response and a secret will be sent via Apple Push Notification Service. The client should
///									send both of them back to certain Identity Platform APIs in a later call 
///									(for example, /accounts:sendVerificationCode), in order to verify the client. The bundle ID is 
///									required in the request header as x-ios-bundle-identifier.
/// @param {String}		appToken	- A device token that the iOS client gets after registering to APNs (Apple Push Notification service).
/// @param {String}		isSandBox	- Whether the app token is in the iOS sandbox. If false, the app token is in the production environment.
/// @param {Function}	callback	- Function to execute with http async_load as parameter.
/// @param {String}		apikey		- Api key from google.
/// @return {Real}					Http Async Request ID.
function google_account_verify_ios_client(__bg_token, __bg_is_sandbox, __bg_callback = undefined, __bg_apikey = GOOGLE_APIKEY)
{
	var 
	__bg_fields = {"appToken": __bg_token, "isSandbox": __bg_is_sandbox},
	__bg_id		= __bg_google_accounts_http_request("verifyIosClient", json_stringify(__bg_fields), __bg_callback, __bg_apikey);
	delete __bg_fields;
	return __bg_id;
}

//Helper function to build google's account http request.
function __bg_google_accounts_http_request(__bg_url, __bg_body, __bg_callback, __bg_apikey)
{
	var __bg_id =  http_request("https://identitytoolkit.googleapis.com/v1/accounts:" + __bg_url + "?key=" + __bg_apikey, "POST", global.__BG_GOOGLE_ACCOUNTS_HTTP_MAP, __bg_body);
	global.__bg_http_async_struct[$ __bg_id] = __bg_callback;//DELETE IF NOT USING WITHIN BG FRAMEWORK
	return __bg_id;
}

global.__BG_GOOGLE_ACCOUNTS_HTTP_MAP					= ds_map_create();
global.__BG_GOOGLE_ACCOUNTS_HTTP_MAP[? "Content-Type"]	= "application/json";
