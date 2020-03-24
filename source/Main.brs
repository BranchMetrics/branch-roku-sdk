'*************************************************************
'** Branch SDK Integration Sample Application
'*************************************************************

sub Main(args as dynamic)
    print "Main ShowChannelSGScreen args : " args
    screen = CreateObject("roSGScreen")

    ConfigureBranchSdk(screen)

    m.port = CreateObject("roMessagePort")
    screen.setMessagePort(m.port)
    if (args <> invalid and (args.contentId <> invalid or args.mediatype <> invalid)) then
        screen.getGlobalNode().addFields({launchArgs: args})
    end if

    scene = screen.CreateScene("MainScene")
    screen.show()
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
    options.branchKey = "key_live_leQPfBKv29C2cfSj75oWSmkgtFn6u3M1"
    options.logLevel = BranchSdkConstants().LOG_LEVEL.DEBUG
    options.environment = BranchSdkConstants().ENVIRONMENT.PRODUCTION

    ' Set Branch SDK configuration parameter as required
    screen.getGlobalNode().addFields({branchSdkConfig: options})
end sub
