# ReactNativeiMessageApp
React Native enabled Xcode template for iMessage App using BundleBus
<img src="https://github.com/zenome/ReactNativeiMessageApp/blob/master/screenshot/iMessage_with_BundleBus.png" alt="iMessageApp with Bundlebus" width="400" />

ReactNativeiMessageApp is a Xcode template project for iMessage Application which has enabled the React Native and Bundlebus.

# How to
1. Download repository and install npm modules.
~~~~
$> cd ReactNativeiMessageApp
$> npm install
~~~~

2. Open the Xcode project


3. Modify appkey and moduleName in MessagesViewController.m
Appkey
```objectivec
    NSString *appKey = @"YOUR_BUNDLEBUS_APP_KEY";
    BundleBus *bundlebus = [[BundleBus alloc] init];
    [bundlebus silentUpdate:appKey];
```

ModuleName
```objectivec
    RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                        moduleName:@"YOUR_REACTNATIVE_APP_NAME"
                                                 initialProperties:nil
                                                     launchOptions:nil];

```

4. Build
