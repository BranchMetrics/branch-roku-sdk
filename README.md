# Main outstanding tasks before v1.0.0

- [ ] Scoping all params by Branch Key

Smaller fixes we'd like:

- [ ] `setPreinstalldata` -> `setPreinstallData`
- [ ] `SetIdentity` -> `setIdentity`

# Overview

The Branch Roku SDK enables:
1. Session count tracking
2. Providing info for attribution on the backend
3. Deep linking
4. Identifying users
5. Event tracking
6. Preinstall tracking
7. Logging out users

# Quickstart to our test app

To test out this app, open `./input/source/libs/Main.brs` and modify the following line:

```
options.branchKey = "key_live_TODO_YOUR_BRANCH_KEY_HERE"
```

Replace `key_live_TODO_YOUR_BRANCH_KEY_HERE` with your Branch Key from the [Branch Dashboard](https://branch.dashboard.branch.io/account-settings/profile).

Next, within the `input` folder, select all (`components`, `images`, `manifest`, `source`). Compress these four files into a zip file. Move this zip file to the `output` folder for convenience.

Next, connect to your Roku and upload the zip file. If you have not previously done this, be sure to check out [Roku's guide](https://blog.roku.com/developer/developer-setup-guide) to configuring your device, uploading builds from your computer, and so on. Feel free to email derrick@branch.io with any questions.

Note: you can use telnet to view your Roku device logs: `telnet ROKU_LOCAL_IP 8085`.

# Contents

```
├── README.md
├── input
│   ├── components
│   │   ├── MainScene.brs
│   │   ├── MainScene.xml
│   │   └── tasks
│   │       ├── BranchSdkTask.brs
│   │       └── BranchSdkTask.xml
│   ├── images
│   │   ├── branchlogo.png
│   │   ├── icon_focus_fhd.png
│   │   ├── icon_focus_hd.png
│   │   ├── icon_focus_sd.png
│   │   ├── splash_fhd.png
│   │   ├── splash_hd.png
│   │   └── splash_sd.png
│   ├── manifest
│   └── source
│       ├── Main.brs
│       └── libs
│           └── BranchSdkLibrary.brs
└── output
    └── BranchSdkSampleApplication-RokuSceneGraph.zip
```

# Integration guide

This section describes steps to integrate Branch Roku SDK into your Roku SceneGraph application.

## Required Library files

1. BranchSdkLibrary.brs 
2. BranchSdkTask.xml 
3. BranchSdkTask.brs

Within the `input` folder, there is a test app as well as the required Branch SDK files. The Branch SDK files are:

```
├── input
│   ├── components
│   │   └── tasks
│   │       ├── BranchSdkTask.brs
│   │       └── BranchSdkTask.xml
│   └── source
│       └── libs
│           └── BranchSdkLibrary.brs
...
```

## Steps for putting BranchSDK files into your SceneGraph application:

*TL;DR:* copy the three Branch SDK files from the section above into your own project.

*Full explanation:*

1. Create a new folder called `libs` in the `source` folder of your application
2. Copy the `BranchSdkLibrary.brs` file from the Branch repo into your project's new `libs` folder
3. Create a new folder called `tasks` in `components` folder of your
application
4. Copy both the `BranchSdkTask.xml` and `BranchSdkTask.brs` files into your project's new
`tasks` folder

## Steps for integration into your application code files:

### Configuring Branch

1. Open the `Main.brs` file of your project which functions as the entry point of SceneGraph application.
2. Inside the `sub Main()`, add the following line: `ConfigureBranchSdk(screen)` (example [here](https://github.com/BranchMetrics/branch-roku-sdk/blob/master/input/source/Main.brs#L13))
3. Next, let's define a new sub below `Main()`

```
sub ConfigureBranchSdk(screen as dynamic)
    options = {}
    ' For future use for advance features in Branch SDK'
    options.branchKey = "key_live_TODO_YOUR_BRANCH_KEY_HERE"
    options.logLevel = BranchSdkConstants().LOG_LEVEL.ALL
    options.environment = BranchSdkConstants().ENVIRONMENT.PRODUCTION

    ' Set Branch SDK congiguration parameter as required
    screen.getGlobalNode().addFields({branchSdkConfig: options})
end sub
```

Then be sure to replace `key_live_TODO_YOUR_BRANCH_KEY_HERE` with your Branch Key from the [Branch Dashboard](https://branch.dashboard.branch.io/account-settings/profile).

You can see an example of this code [here](https://github.com/BranchMetrics/branch-roku-sdk/blob/master/input/source/Main.brs#L24-L33).

### Initializing Branch

1. Open your file which extends `Scene`, let say its `MainScene.xml` file.
2. Add new script file path of `BranchSdkLibrary.brs`

```
<script type="text/brightscript" uri="pkg:/source/libs/BranchSdkLibrary.brs"/>
```

You can see an example of this code [here](https://github.com/BranchMetrics/branch-roku-sdk/blob/master/input/components/MainScene.xml#L5).

3. Open `MainScene.brs` file and create instance of the Branch SDK library:

```
m.branchSdkObj = CreateBranchSdkForSceneGraphApp()
```

You can see an example of this code [here](https://github.com/BranchMetrics/branch-roku-sdk/blob/master/input/components/MainScene.brs#L25).

4. Now do first API call which is InitSession like following: 

```
m.branchSdkObj.initSession("your_branch_key_value", "", "OnInitSessionCallbackFunc")
```

You can see an example of this code [here](https://github.com/BranchMetrics/branch-roku-sdk/blob/master/input/components/MainScene.brs#L118). An example of the callback function can be found [here](https://github.com/BranchMetrics/branch-roku-sdk/blob/master/input/components/MainScene.brs#L145-L158)

That's it! Now Roku session count tracking should function, and you'll start to see Roku installs and opens tracked on the Branch Dashboard!

### Providing info for attribution on the backend

To test out attribution, you can modify the initSession call to include a Branch link:

```
m.branchSdkObj.initSession("your_branch_key_value", "https://your.app.link/some-link", "OnInitSessionCallbackFunc")
```

You can see an example of this code [here](https://github.com/BranchMetrics/branch-roku-sdk/blob/master/input/components/MainScene.brs#L118).

Be sure to remove this link before pushing to production.

### Deep linking

You can test basic deep linking using the method in the previous section, `Providing info for attribution on the backend`. However, let's discuss any concrete use cases you have, like linking from App 1 to App 2. Please initiate a conversation with derrick@branch.io.

### Identifying users

As with other Branch SDKs, you can use your own user identifiers to make session and conversion event tracking easier. 

```
m.branchSdkObj.SetIdentity("UserUniqueNameOrID", "OnSetIdentityCallbackFunc")
```

You can see an example of this code [here](https://github.com/BranchMetrics/branch-roku-sdk/blob/master/input/components/MainScene.brs#L124).

### Event tracking

To log standard Branch events, such as purchases, you can invoke the following:

```
m.branchSdkObj.logEvent(BranchSdkConstants().EVENT_TYPE.PURCHASE, "Example customer_event_alias", "transaction_id", "USD", 99.99, "OnLogEventPurchaseCallbackFunc")
```

You can see an example of this code [here](https://github.com/BranchMetrics/branch-roku-sdk/blob/master/input/components/MainScene.brs#L130).

NOTE: Refer to 'Branch SDK Standard Event List' section in the [BranchSdkLibrary.brs](TODO) file for all available predefined EVENT_TYPE values.

You can also log custom events by invoking the following:

```
m.branchSdkObj.logEvent("Example Custom Event Name", "", "", "", 0, "OnLogEventCustomCallbackFunc")
```

You can see an example of this code [here](https://github.com/BranchMetrics/branch-roku-sdk/blob/master/input/components/MainScene.brs#L136)

### Preinstall tracking

If your app is preinstalled on Roku devices, for builds distributed to Roku, you should invoke the following method.

Replace `MyCampaign` with any string, which will then appear in the Branch Dashboard under the variable "campaign" (`last_attributed_touch_data_tilde_campaign`).

Replace `MyPartner` with a $3p value, which will then appear in the Branch Dashboard under the variable "$3p" (`last_attributed_touch_data_dollar_3p`). Most likely you will keep this blank for Roku. You can email derrick@branch.io to discuss further.


```
m.branchSdkObj.setPreinstalldata("MyCampaign", "MyPartner")
```

You can see an example of this code [here](https://github.com/BranchMetrics/branch-roku-sdk/blob/master/input/components/MainScene.brs#L29).

### Logging out users

If the current user logs out of your app, you can notify Branch of this by invoking logout.

```
m.branchSdkObj.logout("OnLogoutCallbackFunc")
```

You can see an example of this code [here](https://github.com/BranchMetrics/branch-roku-sdk/blob/master/input/components/MainScene.brs#L142).
