#import "Contactsios9.h"
@import ContactsUI;

@implementation Contactsios9

- (void)pickContacts:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        self.command = command;
        CNContactPickerViewController* contactsPickerController = [[CNContactPickerViewController alloc] init];
        NSPredicate * predicate = [NSPredicate predicateWithFormat: @"emailAddresses.@count > 0 || phoneNumbers.@count > 0"];
        contactsPickerController.predicateForEnablingContact = predicate;
        contactsPickerController.delegate = self;
        [self.viewController presentViewController: contactsPickerController
                                          animated: true
                                        completion: nil];
        CDVPluginResult* pluginResult = nil;
    }];
}

/*- (void)contactPicker:(CNContactPickerViewController *)picker
    didSelectContacts:(NSArray<CNContact *> *)contacts
{
    NSMutableArray *contactArray = [NSMutableArray array];
    
    for (CNContact* contact in contacts) {
        NSString *thumbnailImage = @"";
        if (contact.imageDataAvailable){
            thumbnailImage = [contact.thumbnailImageData cdv_base64EncodedString];
        }
        
        NSString *email = @"";
        if ([contact.emailAddresses count] > 0) {
            email = contact.emailAddresses[0].value;
        }
        
        NSString *phone = @"";
        if ([contact.phoneNumbers count] > 0) {
            phone = contact.phoneNumbers[0].value.stringValue;
        }
        NSString *linkedin = @"";
        NSString *twitter = @"";
        for (CNLabeledValue* socialProfile in contact.socialProfiles) {
            if([socialProfile.label isEqualToString:@"twitter"]){
                twitter = ((CNSocialProfile*)socialProfile.value).urlString;
            }
            if([socialProfile.label isEqualToString:@"linkedin"]){
                linkedin = ((CNSocialProfile*)socialProfile.value).urlString;
            }
        }
        
        NSDictionary *contactDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                           contact.givenName, @"givenName",
                                           contact.middleName, @"middleName",
                                           contact.familyName, @"familyName",
                                           phone, @"phone",
                                           email, @"email",
                                           linkedin, @"linkedIn",
                                           twitter, @"twitter",
                                           thumbnailImage, @"photo",
                                           nil];
        [contactArray addObject:contactDictionary];
    }
    
    
    
    CDVPluginResult* result = [CDVPluginResult
                               resultWithStatus:CDVCommandStatus_OK
                               messageAsArray:contactArray
                               ];
    [self success:result callbackId:self.command.callbackId];
}*/

- (void)contactPicker:(CNContactPickerViewController *)picker
    didSelectContact:(CNContact *)contact
{
    NSString *thumbnailImage = @"";
    if (contact.imageDataAvailable){
        thumbnailImage = [contact.thumbnailImageData cdv_base64EncodedString];
    }
    
    NSString *email = @"";
    if ([contact.emailAddresses count] > 0) {
        email = contact.emailAddresses[0].value;
    }
    
    NSString *phone = @"";
    if ([contact.phoneNumbers count] > 0) {
        phone = contact.phoneNumbers[0].value.stringValue;
    }
    NSString *linkedin = @"";
    NSString *twitter = @"";
    for (CNLabeledValue* socialProfile in contact.socialProfiles) {
        if([socialProfile.label isEqualToString:@"twitter"]){
            twitter = ((CNSocialProfile*)socialProfile.value).urlString;
        }
        if([socialProfile.label isEqualToString:@"linkedin"]){
            linkedin = ((CNSocialProfile*)socialProfile.value).urlString;
        }
    }
    
    NSDictionary *contactDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                       contact.givenName, @"givenName",
                                       contact.middleName, @"middleName",
                                       contact.familyName, @"familyName",
                                       phone, @"phone",
                                       email, @"email",
                                       linkedin, @"linkedIn",
                                       twitter, @"twitter",
                                       thumbnailImage, @"photo",
                                       nil];
    
    CDVPluginResult* result = [CDVPluginResult
                               resultWithStatus:CDVCommandStatus_OK
                               messageAsDictionary:contactDictionary
                               ];

    [self success:result callbackId:self.command.callbackId];
}

@end
