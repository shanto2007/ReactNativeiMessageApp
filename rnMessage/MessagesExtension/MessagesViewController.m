//
//  MessagesViewController.m
//  MessagesExtension
//
//  Created by y on 2016. 10. 6..
//  Copyright © 2016년 zenome. All rights reserved.
//

// Some code taken from https://medium.com/rendez-voo/messages-app-app-extension-ios10-with-react-native-6d22ece64598#.akp79gup3

#import "MessagesViewController.h"

#import "RCTBundleURLProvider.h"
#import "RCTRootView.h"
#import "Bundlebus.h"

@interface MessagesViewController ()

@end

@implementation MessagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Conversation Handling

-(void) willBecomeActiveWithConversation:(MSConversation*)conversation {
    [super willBecomeActiveWithConversation:conversation];
    [self presentReactNativeView:self.presentationStyle];
}

-(void)didBecomeActiveWithConversation:(MSConversation *)conversation {
    // Called when the extension is about to move from the inactive to active state.
    // This will happen when the extension is about to present UI.
    
    // Use this method to configure the extension and restore previously stored state.
}

-(void)willResignActiveWithConversation:(MSConversation *)conversation {
    // Called when the extension is about to move from the active to inactive state.
    // This will happen when the user dissmises the extension, changes to a different
    // conversation or quits Messages.
    
    // Use this method to release shared resources, save user data, invalidate timers,
    // and store enough state information to restore your extension to its current state
    // in case it is terminated later.
}

-(void)didReceiveMessage:(MSMessage *)message conversation:(MSConversation *)conversation {
    // Called when a message arrives that was generated by another instance of this
    // extension on a remote device.
    
    // Use this method to trigger UI updates in response to the message.
}

-(void)didStartSendingMessage:(MSMessage *)message conversation:(MSConversation *)conversation {
    // Called when the user taps the send button.
}

-(void)didCancelSendingMessage:(MSMessage *)message conversation:(MSConversation *)conversation {
    // Called when the user deletes the message without sending it.
    
    // Use this to clean up state related to the deleted message.
}

-(void)willTransitionToPresentationStyle:(MSMessagesAppPresentationStyle)presentationStyle {
    // Called before the extension transitions to a new presentation style.
    
    // Use this method to prepare for the change in presentation style.
    [self presentReactNativeView:presentationStyle];
}

-(void)didTransitionToPresentationStyle:(MSMessagesAppPresentationStyle)presentationStyle {
    // Called after the extension transitions to a new presentation style.
    
    // Use this method to finalize any behaviors associated with the change in presentation style.
}

-(void) presentReactNativeView:(MSMessagesAppPresentationStyle)presentationStyle {
    // If you need you can pass the presentation style to your view

    NSString *appKey = @"d52c77b9-3231-4149-8228-68f69ca2a644";
    BundleBus *bundlebus = [[BundleBus alloc] init];
    
    NSURL *jsCodeLocation;
    jsCodeLocation = [bundlebus bundleUrl:appKey];
    if(jsCodeLocation != nil) {
        RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                            moduleName:@"rnmessage"
                                                     initialProperties:nil
                                                         launchOptions:nil];
        
        UIViewController *vc = [UIViewController new];
        vc.view = rootView;
        for (UIViewController* cc in self.childViewControllers) {
            [cc willMoveToParentViewController:nil];
            [cc.view removeFromSuperview];
            [cc removeFromParentViewController];
        }
        [self addChildViewController:vc];
        vc.view.frame = self.view.bounds;
        [self.view addSubview:vc.view];
        [vc didMoveToParentViewController:self];
    }
    
    [bundlebus configServerAddressAndPort:@"192.168.0.4" port:3000];
    [bundlebus silentUpdate:appKey];
}

@end
