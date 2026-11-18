import 'package:get/get.dart';
import 'app_strings.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          AppStrings.appName: 'GhorBari',
          AppStrings.appTagline: 'Find Your Perfect Place',
          AppStrings.next: 'Next',
          AppStrings.back: 'Back',
          AppStrings.skip: 'Skip',
          AppStrings.getStarted: 'Get Started',
          AppStrings.continueBtn: 'Continue',

          // Onboarding
          AppStrings.onboarding1Title1: 'Buy, Sell or Rent\n',
          AppStrings.onboarding1Title2: 'Property ',
          AppStrings.onboarding1TitleHighlight: 'with Ease',
          AppStrings.onboarding1Desc:
              'Your trusted real estate partner\nin Bangladesh.',
          AppStrings.onboarding2Title1: 'Explore Properties\n',
          AppStrings.onboarding2TitleHighlight: 'Your Way',
          AppStrings.onboarding2Desc:
              'Buy, sell or rent houses, apartments\nand more — all in one place.',
          AppStrings.onboarding3Title1: 'Your Dream Home\n',
          AppStrings.onboarding3Title2: 'is Just a ',
          AppStrings.onboarding3TitleHighlight: 'Tap Away',
          AppStrings.onboarding3Desc:
              'Start your journey with GhorBari\ntoday!',

          // Auth - Sign In
          AppStrings.welcomeBack: 'Welcome Back!',
          AppStrings.signInToContinue: 'Sign in to continue your journey',
          AppStrings.emailAddress: 'Email Address',
          AppStrings.password: 'Password',
          AppStrings.rememberMe: 'Remember me',
          AppStrings.forgotPasswordQuestion: 'Forgot Password?',
          AppStrings.signIn: 'Sign In',
          AppStrings.orContinueWith: 'or continue with',
          AppStrings.dontHaveAccount: "Don't have an account?",
          AppStrings.register: 'Register',

          // Auth - Register
          AppStrings.createAccount: 'Create Account',
          AppStrings.joinGhorBari: 'Join GhorBari and find your dream home',
          AppStrings.fullName: 'Full Name',
          AppStrings.phoneNumber: 'Phone Number',
          AppStrings.confirmPassword: 'Confirm Password',
          AppStrings.termsAgree: 'I agree to the ',
          AppStrings.termsConditions: 'Terms & Conditions',
          AppStrings.and: ' and ',
          AppStrings.privacyPolicy: 'Privacy Policy',
          AppStrings.alreadyHaveAccount: 'Already have an account?',

          // Auth - Forgot Password
          AppStrings.forgotPasswordTitle: 'Forgot Password?',
          AppStrings.forgotPasswordDesc:
              "No worries! Enter your email address and we'll send you a reset link.",
          AppStrings.sendResetLink: 'Send Reset Link',
          AppStrings.rememberPasswordQuestion: 'Remember your password?',
          AppStrings.backToSignIn: 'Back to Sign In',

          // Auth - Verify Email
          AppStrings.verifyYourEmail: 'Verify Your Email',
          AppStrings.sentVerificationLinkTo: "We've sent a verification link to",
          AppStrings.checkInboxDesc:
              'Please check your inbox and click the link to verify your account.',
          AppStrings.didntReceiveEmail: "Didn't receive the email?",
          AppStrings.resendIn: 'Resend in ',
          AppStrings.resendEmail: 'Resend Email',

          // Auth - Reset Password
          AppStrings.resetPassword: 'Reset Password',
          AppStrings.enterNewPasswordBelow: 'Enter your new password below',
          AppStrings.newPassword: 'New Password',
          AppStrings.confirmNewPassword: 'Confirm New Password',
          AppStrings.reqAtLeast8: 'At least 8 characters',
          AppStrings.reqIncludeNumber: 'Include a number',
          AppStrings.reqIncludeLetter: 'Include a letter',

          // Auth - All Set
          AppStrings.allSet: 'All Set!',
          AppStrings.accountVerifiedSuccess:
              'Your account has been verified successfully.',
        },
        'bn_BD': {
          AppStrings.appName: 'ঘরবাড়ি',
          AppStrings.appTagline: 'আপনার পছন্দের আবাসন খুঁজুন',
          AppStrings.next: 'পরবর্তী',
          AppStrings.back: 'পেছনে',
          AppStrings.skip: 'এড়িয়ে যান',
          AppStrings.getStarted: 'শুরু করুন',
          AppStrings.continueBtn: 'এগিয়ে যান',

          // Onboarding
          AppStrings.onboarding1Title1: 'কেনা, বেচা বা ভাড়া\n',
          AppStrings.onboarding1Title2: 'সম্পত্তি ',
          AppStrings.onboarding1TitleHighlight: 'সহজেই',
          AppStrings.onboarding1Desc:
              'বাংলাদেশে আপনার বিশ্বস্ত রিয়েল এস্টেট পার্টনার।',
          AppStrings.onboarding2Title1: 'সম্পত্তি খুঁজুন\n',
          AppStrings.onboarding2TitleHighlight: 'আপনার মতো করে',
          AppStrings.onboarding2Desc:
              'বাড়ি, ফ্ল্যাট এবং আরও অনেক কিছু কিনুন, বিক্রি বা ভাড়া নিন — সবই এক সাথে।',
          AppStrings.onboarding3Title1: 'আপনার স্বপ্নের বাড়ি\n',
          AppStrings.onboarding3Title2: 'এখন মাত্র এক ',
          AppStrings.onboarding3TitleHighlight: 'ট্যাপ দূরে',
          AppStrings.onboarding3Desc:
              'আজই শুরু করুন ঘরবাড়ি-র সাথে আপনার যাত্রা!',

          // Auth - Sign In
          AppStrings.welcomeBack: 'স্বাগতম!',
          AppStrings.signInToContinue: 'চালিয়ে যেতে সাইন ইন করুন',
          AppStrings.emailAddress: 'ইমেইল অ্যাড্রেস',
          AppStrings.password: 'পাসওয়ার্ড',
          AppStrings.rememberMe: 'মনে রাখুন',
          AppStrings.forgotPasswordQuestion: 'পাসওয়ার্ড ভুলে গেছেন?',
          AppStrings.signIn: 'সাইন ইন',
          AppStrings.orContinueWith: 'অথবা এর মাধ্যমে চালিয়ে যান',
          AppStrings.dontHaveAccount: 'অ্যাকাউন্ট নেই?',
          AppStrings.register: 'নিবন্ধন করুন',

          // Auth - Register
          AppStrings.createAccount: 'অ্যাকাউন্ট তৈরি করুন',
          AppStrings.joinGhorBari: 'ঘরবাড়িতে যোগ দিন ও স্বপ্নের বাড়ি খুঁজুন',
          AppStrings.fullName: 'পুরো নাম',
          AppStrings.phoneNumber: 'ফোন নম্বর',
          AppStrings.confirmPassword: 'পাসওয়ার্ড নিশ্চিত করুন',
          AppStrings.termsAgree: 'আমি সম্মত ',
          AppStrings.termsConditions: 'শর্তাবলী',
          AppStrings.and: ' এবং ',
          AppStrings.privacyPolicy: 'গোপনীয়তা নীতি',
          AppStrings.alreadyHaveAccount: 'ইতিমধ্যে অ্যাকাউন্ট আছে?',

          // Auth - Forgot Password
          AppStrings.forgotPasswordTitle: 'পাসওয়ার্ড ভুলে গেছেন?',
          AppStrings.forgotPasswordDesc:
              'চিন্তা নেই! আপনার ইমেইল দিন, আমরা রিসেট লিঙ্ক পাঠাব।',
          AppStrings.sendResetLink: 'রিসেট লিঙ্ক পাঠান',
          AppStrings.rememberPasswordQuestion: 'পাসওয়ার্ড মনে পড়েছে?',
          AppStrings.backToSignIn: 'সাইন ইন-এ ফিরে যান',

          // Auth - Verify Email
          AppStrings.verifyYourEmail: 'ইমেইল যাচাই করুন',
          AppStrings.sentVerificationLinkTo: 'আমরা যাচাইকরণ লিঙ্ক পাঠিয়েছি',
          AppStrings.checkInboxDesc:
              'অনুগ্রহ করে আপনার ইনবক্স চেক করে লিঙ্কটিতে ক্লিক করুন।',
          AppStrings.didntReceiveEmail: 'ইমেইল পাননি?',
          AppStrings.resendIn: 'পুনরায় পাঠান ',
          AppStrings.resendEmail: 'ইমেইল পুনরায় পাঠান',

          // Auth - Reset Password
          AppStrings.resetPassword: 'পাসওয়ার্ড রিসেট করুন',
          AppStrings.enterNewPasswordBelow: 'নিচে নতুন পাসওয়ার্ড দিন',
          AppStrings.newPassword: 'নতুন পাসওয়ার্ড',
          AppStrings.confirmNewPassword: 'নতুন পাসওয়ার্ড নিশ্চিত করুন',
          AppStrings.reqAtLeast8: 'কমপক্ষে ৮টি অক্ষর',
          AppStrings.reqIncludeNumber: 'একটি সংখ্যা অন্তর্ভুক্ত করুন',
          AppStrings.reqIncludeLetter: 'একটি বর্ণ অন্তর্ভুক্ত করুন',

          // Auth - All Set
          AppStrings.allSet: 'সব ঠিক আছে!',
          AppStrings.accountVerifiedSuccess:
              'আপনার অ্যাকাউন্ট সফলভাবে যাচাই করা হয়েছে।',
        },
      };
}
