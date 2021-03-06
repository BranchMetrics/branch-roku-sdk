'*************************************************************
' Branch Roku SDK - Branch SDK Task Node for Scene Graph
' Copyright 2019 Branch, Inc.
'*************************************************************

sub init()
    m.port = createObject("roMessagePort")
    m.top.observeField("callBranchApi", m.port)
    m.top.observeField("branchLibResponse", m.port)
    m.top.functionName = "setupApiLoop"
    m.top.control = "RUN"
end sub

sub setupApiLoop()
    options = m.global.branchSdkConfig
    StartBranchSdk(options, m.top, m.port)
    m.branchSdkInstance = GetBranchSdk()
    m.branchPrintLogger = GetBranchSdk().logger
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
                else if msg.getField()=BranchSdkConstants().TASK_EVENT_FIELDS.BRANCH_LIB_RESPONSE
                    data = msg.getData()
                    m.top[data.callbackfield] = data.response
                    m.top.unobserveField(data.callbackField)
                    m.top.removeField(data.callbackField)
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
                            m.branchPrintLogger.error("*** Error *** : Could not find details of the sent message!")
                        end if
                    end if
                else
                    m.branchPrintLogger.error("*** Error *** : unknow URL event received!")
                end if
            else
                m.branchPrintLogger.error("*** Error *** : unknow event received! Event Type : '" + mt + "'")
            end if
        end if
    end while
end sub

function printCurrentTime()
    date = CreateObject("roDateTime")
    if(date <> invalid) then
        date.ToLocalTime()
        dateString = date.ToISOString()
        m.branchPrintLogger.info("### Time : " + dateString)
    end if
end function

function executeBranchApi(apiCall as Object)
    args = apiCall.args
    length = args.count()
    target = m.branchSdkInstance
    methodName = apiCall.methodName

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
