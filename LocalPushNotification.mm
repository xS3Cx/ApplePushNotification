#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>

@interface ApplePushNotification : NSObject <UNUserNotificationCenterDelegate>
@end

@implementation ApplePushNotification

+ (void)requestPermissions {
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    center.delegate = [self sharedInstance];
    [center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert | UNAuthorizationOptionSound | UNAuthorizationOptionBadge) completionHandler:nil];
}

+ (instancetype)sharedInstance {
    static ApplePushNotification *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ApplePushNotification alloc] init];
    });
    return instance;
}

+ (BOOL)isEnabled {
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    __block BOOL authorized = NO;
    
    [center getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings *settings) {
        authorized = (settings.authorizationStatus == UNAuthorizationStatusAuthorized);
        dispatch_semaphore_signal(semaphore);
    }];
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    return authorized;
}

+ (void)Notification:(NSString *)title message:(NSString *)message {
    if (![self isEnabled]) {
        [self requestPermissions];
        return;
    }
    
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = title;
    content.body = message;
    content.sound = [UNNotificationSound defaultSound];
    content.badge = @1;
    
    NSString *identifier = [NSString stringWithFormat:@"notification_%f", [[NSDate date] timeIntervalSince1970]];
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:0.1 repeats:NO];
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:identifier content:content trigger:trigger];
    
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:nil];
}

+ (void)NotificationWithSubtitle:(NSString *)title subtitle:(NSString *)subtitle message:(NSString *)message {
    if (![self isEnabled]) {
        [self requestPermissions];
        return;
    }
    
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = title;
    content.subtitle = subtitle;
    content.body = message;
    content.sound = [UNNotificationSound defaultSound];
    
    NSString *identifier = [NSString stringWithFormat:@"notification_subtitle_%f", [[NSDate date] timeIntervalSince1970]];
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:0.1 repeats:NO];
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:identifier content:content trigger:trigger];
    
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:nil];
}

+ (void)hide {
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    [center removeAllPendingNotificationRequests];
    [center removeAllDeliveredNotifications];
}

#pragma mark - UNUserNotificationCenterDelegate

- (void)userNotificationCenter:(UNUserNotificationCenter *)center 
       willPresentNotification:(UNNotification *)notification 
         withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler {
    completionHandler(UNNotificationPresentationOptionAlert | UNNotificationPresentationOptionSound | UNNotificationPresentationOptionBadge);
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center 
didReceiveNotificationResponse:(UNNotificationResponse *)response 
         withCompletionHandler:(void(^)(void))completionHandler {
    completionHandler();
}

@end 