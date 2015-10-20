#import <Cordova/CDV.h>

@interface Contactsios9 : CDVPlugin
@property CDVInvokedUrlCommand* command;

- (void) pickContacts:(CDVInvokedUrlCommand*)command;

@end

@interface CNContactPickerDelegate
- (void) contactPicker:(CDVInvokedUrlCommand*)command;

@end
