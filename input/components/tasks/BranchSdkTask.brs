'*************************************************************
' Branch Roku SDK - Branch SDK Task Node for Scene Graph
' Copyright 2019 Branch, Inc.
'*************************************************************

sub init()
    print "Initializing the task"
    m.port = createObject("roMessagePort")
    m.top.observeField("callBranchApi", m.port)
    m.top.functionName = "setupApiLoop"
    m.top.control = "RUN"
end sub

sub setupApiLoop()
    options = m.global.branchSdkConfig
    print "===> Starting Branch SDK Main Task Loop : "
    StartBranchSdk(options, m.port)
    m.branchSdkInstance = GetBranchSdk()
    while true
        msg = wait(20*1000, m.port)
        printCurrentTime()
        ' Timer event to start uploading process
        if (msg = invalid) then
            m.branchSdkInstance.networking.processTimeOutMessages()
            m.branchSdkInstance.networking.processUploads()
        else
            mt = type(msg)

            ' Event for calling API
            if mt = "roSGNodeEvent"
                if msg.getField()=BranchSdkConstants().TASK_EVENT_FIELDS.CALL_BRANCH_API
                    executeBranchApi(msg.getData())
                end if
            ' Event for API response
            else if (mt = "roUrlEvent")
                if m.branchSdkInstance.isBranchSdkEvent(msg.getSourceIdentity())
                    sourceMessage = m.branchSdkInstance.networking.pendingTransfers[msg.getSourceIdentity().tostr()]
                    response = m.branchSdkInstance.onUrlEvent(msg)
                    if (response <> invalid) then
                        if (sourceMessage <> invalid) then
                            m.top[sourceMessage.request.callbackField] = response
                            m.top.unobserveField(sourceMessage.request.callbackField)
                            m.top.removeField(sourceMessage.request.callbackField)
                        else
                            print "*** Error *** : Could not find details of the sent message!!!"
                        end if
                    end if
                else
                    print "*** Error *** : unknow URL event received!!!"
                end if
            else
                print "*** Error *** : unknow event received!!! Event Type : '" mt "'"
            end if
        end if
    end while
end sub

function printCurrentTime()
    date = CreateObject("roDateTime")
    if(date <> invalid) then
        date.ToLocalTime()
        dateString = date.ToISOString()
        print "###  " dateString
    end if
end function

function executeBranchApi(apiCall as Object)
    args = apiCall.args
    length = args.count()
    target = m.branchSdkInstance
    methodName = apiCall.methodName

    print "===> executeBranchApi : methodName " methodName

    if (length = 0) then
        target[methodName]()
    else if (length = 1) then
        target[methodName](args[0])
    else if (length = 2) then
        target[methodName](args[0], args[1])
    else if (length = 3) then
        target[methodName](args[0], args[1], args[2])
    else if (length = 4) then
        target[methodName](args[0], args[1], args[2], args[3])
    else if (length = 5) then
        target[methodName](args[0], args[1], args[2], args[3], args[4])
    else if (length = 6) then
        target[methodName](args[0], args[1], args[2], args[3], args[4], args[5])
    else if (length = 7) then
        target[methodName](args[0], args[1], args[2], args[3], args[4], args[5], args[6])
    end if
end function
