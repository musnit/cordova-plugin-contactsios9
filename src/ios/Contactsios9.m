#import "Contactsios9.h"

@implementation Contactsios9

- (void)pickContacts:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
      self.command = command;
      CDVPluginResult* pluginResult = nil;
      CDVPluginResult* result = [CDVPluginResult
                                  resultWithStatus:CDVCommandStatus_OK
                                  message:@""
                                  ];
      [self success:result callbackId:command.callbackId];
    }];
}

@end
