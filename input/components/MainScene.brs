sub init()
    m.lSessionApiResultDetails = m.top.findNode("lSessionApiResultDetails")
    m.bClearRegistry = m.top.findNode("bClearRegistry")
    m.bClearRegistry.observeField("buttonSelected", "ClearRegistry_Clicked")
    m.bPrintRegistry = m.top.findNode("bPrintRegistry")
    m.bPrintRegistry.observeField("buttonSelected", "PrintRegistry_Clicked")
    m.bInitSession = m.top.findNode("bInitSession")
    m.bInitSession.observeField("buttonSelected", "InitSession_Clicked")
    m.bSetIdentity = m.top.findNode("bSetIdentity")
    m.bSetIdentity.observeField("buttonSelected", "SetIdentity_Clicked")
    m.bLogEventPurchase = m.top.findNode("bLogEventPurchase")
    m.bLogEventPurchase.observeField("buttonSelected", "LogEventPurchase_Clicked")
    m.bLogEventCustom = m.top.findNode("bLogEventCustom")
    m.bLogEventCustom.observeField("buttonSelected", "LogEventCustom_Clicked")
    m.bLogout = m.top.findNode("bLogout")
    m.bLogout.observeField("buttonSelected", "Logout_Clicked")

    m.bInitSession.setFocus(true)

    print "MainScene : Initializing"
    print "MainScene : Creating Task"
    print "MainScene : Creating CreateBranchSdkForSceneGraphApp"

    ' BRANCH SDK INTEGRATION - Create Instance'
    m.branchSdkObj = CreateBranchSdkForSceneGraphApp()

    print "MainScene : initSession"
    ' BRANCH SDK INTEGRATION - Call API'
    m.branchSdkObj.setPreinstalldata("MyCampaign", "MyPartner")
end sub

function onKeyEvent(key as string, press as boolean) as boolean
    ' print "MainScene : Key = " key " Press = " press

    if (press) then
        if (key = "down") then
            if (m.bClearRegistry.hasFocus() = true) then
                m.bPrintRegistry.setFocus(true)
            else if (m.bPrintRegistry.hasFocus() = true) then
                m.bInitSession.setFocus(true)
            else if (m.bInitSession.hasFocus() = true) then
                m.bSetIdentity.setFocus(true)
            else if (m.bSetIdentity.hasFocus() = true) then
                m.bLogEventPurchase.setFocus(true)
            else if (m.bLogEventPurchase.hasFocus() = true) then
                m.bLogEventCustom.setFocus(true)
            else if (m.bLogEventCustom.hasFocus() = true) then
                m.bLogout.setFocus(true)
            end if

            return true
        else if (key = "up") then
            if (m.bLogout.hasFocus() = true) then
                m.bLogEventCustom.setFocus(true)
            else if (m.bLogEventCustom.hasFocus() = true) then
                m.bLogEventPurchase.setFocus(true)
            else if (m.bLogEventPurchase.hasFocus() = true) then
                m.bSetIdentity.setFocus(true)
            else if (m.bSetIdentity.hasFocus() = true) then
                m.bInitSession.setFocus(true)
            else if (m.bInitSession.hasFocus() = true) then
                m.bPrintRegistry.setFocus(true)
            else if (m.bPrintRegistry.hasFocus() = true) then
                m.bClearRegistry.setFocus(true)
            end if

            return true
        else if (key = "back") then
        end if

    end if

    return false
end function

sub ClearRegistry_Clicked()
    print "Registry clearAll : "
    print "====================> Clear registry values <===================="
    reg = CreateObject("roRegistry")
    for each section in reg.GetSectionList()
        regSection = CreateObject("roRegistrySection", section)
        index = Instr(0, section, "BranchSdk_registry_")
        if (index <> 0) then
            print "Registry section : " section
            for each key in regSection.GetKeyList()
                print "Registry Key : " key
                print "Registry Value : " regSection.Read(key)
                regSection.Delete(key)
            end for
            regSection.flush()
            sectionDeleted = reg.Delete(section)
        end if
    end for
    print "================================================================="
end sub

sub PrintRegistry_Clicked()
    print "Registry printAll : "
    print "====================> Print registry values <===================="
    reg = CreateObject("roRegistry")
    for each section in reg.GetSectionList()
        regSection = CreateObject("roRegistrySection", section)
        index = Instr(0, section, "BranchSdk_registry_")
        if (index <> 0) then
            print "Registry section : " section
            for each key in regSection.GetKeyList()
                print "Registry Key : " key
                print "Registry Value : " regSection.Read(key)
            end for
        end if
    end for
    print "================================================================="
end sub

sub InitSession_Clicked()
    print "Calling Branch InitSession API"
    ' BRANCH SDK INTEGRATION - Call API'
     m.branchSdkObj.initSession("https://something.app.link/a-link", "OnInitSessionCallbackFunc")
end sub

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

sub Logout_Clicked()
    print "Calling Branch Logout API"
    ' BRANCH SDK INTEGRATION - Call API'
    m.branchSdkObj.logout("OnLogoutCallbackFunc")
end sub

function OnInitSessionCallbackFunc(event as object) as void
    data = event.GetData()
    print "OnInitSessionCallbackFunc: " data
    if (data <> invalid) then
        m.lSessionApiResultDetails.text = FormatJson(data)
    else
        m.lSessionApiResultDetails.text = "initSession API response received!!"
    end if
    message = "API Succeeded!"
    if (data.error <> invalid)
        message = "API Error!"
    end if
    ShowMessageDialog("initSession" + " " + message)
end function

function OnSetIdentityCallbackFunc(event as object) as void
    data = event.GetData()
    print "OnSetIdentityCallbackFunc: " data
    message = "API Succeeded!"
    if (data.error <> invalid)
        message = "API Error!"
    end if
    ShowMessageDialog("setIdentity" + " " + message)
end function

function OnLogEventPurchaseCallbackFunc(event as object) as void
    data = event.GetData()
    print "OnLogEventPurchaseCallbackFunc: " data
    message = "API Succeeded!"
    if (data.error <> invalid)
        message = "API Error!"
    end if
    ShowMessageDialog("logEvent Purchase" + " " + message)
end function

function OnLogEventCustomCallbackFunc(event as object) as void
    data = event.GetData()
    print "OnLogEventCustomCallbackFunc: " data
    message = "API Succeeded!"
    if (data.error <> invalid)
        message = "API Error!"
    end if
    ShowMessageDialog("logEvent Custom" + " " + message)
end function

function OnLogoutCallbackFunc(event as object) as void
    data = event.GetData()
    print "OnLogoutCallbackFunc: " data
    message = "API Succeeded!"
    if (data.error <> invalid)
        message = "API Error!"
    end if
    ShowMessageDialog("logout" + " " + message)
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
