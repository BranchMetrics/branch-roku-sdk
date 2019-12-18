'*************************************************************
'** Branch SDK Integration Sample Application
'*************************************************************

sub Main(args as dynamic)
    print "in showChannelSGScreen"
    screen = CreateObject("roSGScreen")
    m.port = CreateObject("roMessagePort")
    screen.setMessagePort(m.port)
    scene = screen.CreateScene("MainScene")
    screen.show()

    ConfigureBranchSdk(screen)

    while(true)
        msg = wait(0, m.port)
        msgType = type(msg)
        if msgType = "roSGScreenEvent"
            if msg.isScreenClosed() then return
        end if
    end while
end sub

sub ConfigureBranchSdk(screen as dynamic)
    options = {}
    ' For future use for advance features in Branch SDK'
    options.branchKey = "key_live_TODO_YOUR_BRANCH_KEY_HERE"
    options.logLevel = BranchSdkConstants().LOG_LEVEL.ALL
    options.environment = BranchSdkConstants().ENVIRONMENT.PRODUCTION

    ' Set Branch SDK congiguration parameter as required
    screen.getGlobalNode().addFields({branchSdkConfig: options})
end sub
