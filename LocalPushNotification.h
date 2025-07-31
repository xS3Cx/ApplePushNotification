

#import <UIKit/UIKit.h>

@interface ApplePushNotification : NSObject
+ (void)requestPermissions;
+ (void)Notification:(NSString *)title message:(NSString *)message;
+ (void)NotificationWithSubtitle:(NSString *)title subtitle:(NSString *)subtitle message:(NSString *)message;
+ (void)hide;
+ (BOOL)isEnabled;
@end 