//
//  ArabicWords.swift
//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//


import Foundation

enum TabBarTitle
{
    static let messages = "الرسائل"
    static let home = "الرئيسية"
}

enum ActiveStatus
{
    static let online = "متاح الأن"
    static let offline = "غير متاح"
}

enum AlertTitles
{
    static let appTitle = "منصة القاضى"
    static let support =  "فريق الدعم"
    static let login    =  "تسجيل الدخول"
}

enum EmptyDataAlert
{
    static let notifications = "لا توجد تنبيهات"
    static let messages = "لا توجد رسائل"
    static let chat = "لا توجد محادثات"
    static let categories = "لا توجد أقسام رئيسية"
    static let favourites = "لا توجد مفضلة"
}

enum AlertMessages
{
    static let  tryAgainAlert = "عذراً\nبرجاء المحاولة مرة أخرى"
    static let  enterSearchKeyAlert = "من فضلك ادخل كلمة البحث"
    static let  loginFailureAlert = "خطأ فى الاسم او كلمة المرور"
    static let  emptyEmailAlert = " من فضلك, أدخل البريد الإلكترونى صحيح!"
    static let  emptyPasswordAlert = "من فضلك, أدخل كلمة المرور (أكتر من ٨ أحرف) !"
    static let  successRestPassowdAlert = "تم ارسال رابط الى بريدك الالكترونى"
    static let  wrongEmailAlert = "هذا البريد غير موجود"
    static let  emptyPhoneAlert = "من فضلك ادخل رقم الهاتف !"
    static let  emptyUserNameAlert = "من فضلك ادخل اسم المستخدم صحيح !"
    static let  passwordNotMatchAlert = "كلمة المرور لا تتطابق !"
    static let  verifyPhoneErrorAlert = "من فضلك التأكد من ادخال رقم الهاتف بشكل صحيح"
    static let  wrongCodeAlert = "كود التفعيل خاطئ !"
    static let  emptyNameAlert = "برجاء ادخال الاسم"
    static let  emptyCategoryAlert = "برجاء اختيار القسم الرئيسى"
    static let  emptySubCategoryAlert = "برجاء اختيار القسم الفرعي"
    static let  noNumberToCallAlert = "لا يوجد رقم للإتصال به !!!"
    static let  cannotMakeCallAlert = "لا يمكن الإتصال بهذا الرقم !!!"
    static let  notLoginAlert = "يجب عليك تسجيل الدخول أولاً!\nهل تريد تسجيل الدخول؟"
    static let  emptyFieldsAlert = "برجاء ملء جميع البيانات\nتأكد أن جميع البيانات صحيحة"
    static let  profileUpdatedAlert = "تم تعديل حسابك الشخصي بنجاح"
}

enum Time
{
    static let day = "يوم"
    static let days = "أيام"
    
    static let minute = "دقيقة"
    static let minutes = "دقائق"
    
    static let hour = "ساعة"
    static let hours = "ساعات"
    
    static let justNow = "الآن"
    static let ago = "منذ"
}

enum MessageStatus
{
    static let sent = "غير مقروئه"
    static let seen = "مقروئه"
}
