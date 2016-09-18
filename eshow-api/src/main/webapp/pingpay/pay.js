// app_pay 需要配合 example-webview 的 iOS 或者 Android 项目使用，调用 Native 的支付 SDK。
function app_pay(url) {
    if (typeof PINGPP_IOS_SDK !== 'undefined') {
        PINGPP_IOS_SDK.callPay(url);
    } else if (typeof PINGPP_ANDROID_SDK !== 'undefined') {
        PINGPP_ANDROID_SDK.callPay(url);
    }
}