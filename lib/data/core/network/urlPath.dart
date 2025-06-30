class UrlPath {
  static const getKycStatus = '/api/auth/kyc-status';
  static const getTransactionHistory = '/api/transaction/gettransfers';
  static const initiateTransfer = '/api/transaction/initiatetransfer';
  static const login = "/api/auth/login";
  static const register = "/api/auth/sendUnboardedEmailOtp";
  static const verifyUnboardedEmail = "/api/auth/verify-unboarded-email";
  static const resendVerificationOtp = '/api/auth/resend-otp';
  static const requestPassword = "/forgot-password";
  static const resendPasswordOTP = "/resend-forgot-password-otp";
  static const verifyEmail = "/api/auth/verify-email";
  static const resendOTP = "/resend-verify-email-otp";
  static const resetPassword = "/reset-password";
  static const getKycLinks = '/api/auth/kyc-links';
  static const getWallet = '/api/wallet';
  static const getWalletBalance = '/api/wallet/balance';
  static const secureAuth = "/account/mfa/generate-secret";
  static const storePassword = '/api/auth/store-password';
  static const verifyAccessCode = '/api/auth/verify-access-code';
  static const verifySecureCode = "/account/mfa/verify-otp";
  static const updateBiodata = '/api/auth/update-user-biodata';
  static const user = "/user/account/profile";
  static const changePassword = "/user/account/changePassword";
}
