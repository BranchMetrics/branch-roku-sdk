sub init()
    m.lSessionApiResultDetails = m.top.findNode("lSessionApiResultDetails")
    m.bSetIdentity = m.top.findNode("bSetIdentity")
    m.bSetIdentity.observeField("buttonSelected", "SetIdentity_Clicked")
    m.bLogEventPurchase = m.top.findNode("bLogEventPurchase")
    m.bLogEventPurchase.observeField("buttonSelected", "LogEventPurchase_Clicked")
    m.bLogEventCustom = m.top.findNode("bLogEventCustom")
    m.bLogEventCustom.observeField("buttonSelected", "LogEventCustom_Clicked")

    m.bSetIdentity.setFocus(true)

    print "MainScene : Initializing"
    print "MainScene : Creating Task"
    print "MainScene : Creating CreateBranchSdkForSceneGraphApp"

    ' BRANCH SDK INTEGRATION - Create Instance'
    m.branchSdkObj = CreateBranchSdkForSceneGraphApp()

    print "MainScene : initSession"
    ' BRANCH SDK INTEGRATION - Call API'
    m.branchSdkObj.setPreinstalldata("MyCampaign", "MyPartner")

    ' BRANCH SDK INTEGRATION - Call API'
    m.branchSdkObj.initSession("key_live_TODO", "", "OnInitSessionCallbackFunc")
end sub

function onKeyEvent(key as string, press as boolean) as boolean
    print "MainScene : Key = " key " Press = " press

    if (press) then
        if (key = "down") then
            if (m.bSetIdentity.hasFocus() = true) then
                m.bLogEventPurchase.setFocus(true)
            else if (m.bLogEventPurchase.hasFocus() = true) then
                m.bLogEventCustom.setFocus(true)
            end if

            return true
        else if (key = "up") then
            if (m.bLogEventCustom.hasFocus() = true) then
                m.bLogEventPurchase.setFocus(true)
            else if (m.bLogEventPurchase.hasFocus() = true) then
                m.bSetIdentity.setFocus(true)
            end if

            return true
        else if (key = "back") then
        end if

    end if

    return false
end function

sub SetIdentity_Clicked()
    print "Calling Branch SetIdentity API"
    ' BRANCH SDK INTEGRATION - Call API'
    m.branchSdkObj.SetIdentity("User123", "OnSetIdentityCallbackFunc")
end sub

sub LogEventPurchase_Clicked()
    print "Calling Branch LogEvent Standard API"
    ' BRANCH SDK INTEGRATION - Call API'
    m.branchSdkObj.logEvent(BranchSdkConstants().EVENT_TYPE.PURCHASE, "My First Purchase as customer_event_alias", "transaction_id", "INR", 99.99, "OnLogEventPurchaseCallbackFunc")
end sub

sub LogEventCustom_Clicked()
    print "Calling Branch LogEvent Custom API"
    ' BRANCH SDK INTEGRATION - Call API'
    m.branchSdkObj.logEvent("Custom Event Name", "Custom Event Customer_event_alias", "transaction_id", "INR", 1199.99, "OnLogEventCustomCallbackFunc")
end sub

function OnInitSessionCallbackFunc(event as object) as void
    data = event.GetData()
    print "OnInitSessionCallbackFunc: " data
    if (data <> invalid) then
        m.lSessionApiResultDetails.text = FormatJson(data)
    else
        m.lSessionApiResultDetails.text = "initSession API response received!!"
    end if
    message = "API response received."
    if (data.error <> invalid)
        message = "API Error response received."
    end if
    ShowMessageDialog("initSession" + " " + message)
end function

function OnSetIdentityCallbackFunc(event as object) as void
    data = event.GetData()
    print "OnSetIdentityCallbackFunc: " data
    message = "API response received."
    if (data.error <> invalid)
        message = "API Error response received."
    end if
    ShowMessageDialog("setIdentity" + " " + message)
end function

function OnLogEventPurchaseCallbackFunc(event as object) as void
    data = event.GetData()
    print "OnLogEventPurchaseCallbackFunc: " data
    message = "API response received."
    if (data.error <> invalid)
        message = "API Error response received."
    end if
    ShowMessageDialog("logEvent Purchase" + " " + message)
end function

function OnLogEventCustomCallbackFunc(event as object) as void
    data = event.GetData()
    print "OnLogEventCustomCallbackFunc: " data
    message = "API response received."
    if (data.error <> invalid)
        message = "API Error response received."
    end if
    ShowMessageDialog("logEvent Custom" + " " + message)
end function

sub ShowMessageDialog(message as string)
    dialog = createObject("roSGNode", "Dialog")

    dialog.title = tr("Information")
    dialog.message = tr(message)
    dialog.buttons = [tr("Ok")]
    dialog.observeField("buttonSelected", "InformationDialog_ButtonSelected")
    m.top.getscene().dialog = dialog
end sub

sub InformationDialog_ButtonSelected(event as dynamic)
    index = event.GetData()
    m.top.getscene().dialog.close = true
end sub
