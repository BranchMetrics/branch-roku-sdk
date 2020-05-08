'*************************************************************
' Branch Roku SDK - Main APIs
' Copyright 2019 Branch, Inc.
'*************************************************************

'
' BranchSdkConstants()
'
function BranchSdkConstants() as object
    LOG_LEVEL = {
        OFF:     0,
        WARNING: 1,
        ERROR:   2,
        INFO:    3,
        DEBUG:   4,
        ALL:     5
    }

    ENVIRONMENT = {
        AUTO:         0,
        DEVELOPMENT:  1,
        PRODUCTION:   2
    }

    SDKCONSTANTS = {
        OS_NAME:                        "ROKU",
        BRAND_NAME:                     "Roku",
        SDK_NAME:                       "roku",
        SDK_VERSION:                    "1.0.0",
        UDSDK_NAME:                     "roku",
        UDSDK_VERSION:                  "1.0.0",
        SDKENVIRONMENT:                 "TV_APP"
    }

    'Application developer may pass in any of these options to the Branch SDK, via StartBranchSdk
    'or via the Global Branch options field
    DEFAULT_CONFIG = {
        environment:            ENVIRONMENT.AUTO,
        logLevel:               LOG_LEVEL.ERROR,
        branchKey:              ""
    }

    API_URLS = {
        sessionUrl:             "https://api2.branch.io/v1/open",
        handleInputUrl:         "https://api2.branch.io/v1/open",
        profileUrl:             "https://api2.branch.io/v1/profile",
        standardEventUrl:       "https://api2.branch.io/v2/event/standard",
        customEventUrl:         "https://api2.branch.io/v2/event/custom",
        logoutUrl:              "https://api2.branch.io/v1/logout"
    }

    TASK_EVENT_FIELDS = {
        CALL_BRANCH_API: "callBranchApi",
    }

    ' Branch SDK Standard Event List'
    EVENT_TYPE = {
        ADD_TO_CART:            "ADD_TO_CART",
        ADD_TO_WISHLIST:        "ADD_TO_WISHLIST",
        VIEW_CART:              "VIEW_CART",
        INITIATE_PURCHASE:      "INITIATE_PURCHASE",
        ADD_PAYMENT_INFO:       "ADD_PAYMENT_INFO",
        PURCHASE:               "PURCHASE",
        SPEND_CREDITS:          "SPEND_CREDITS",
        RESERVE:                "RESERVE",
        CLICK_AD:               "CLICK_AD",
        VIEW_AD:                "VIEW_AD",
        SEARCH:                 "SEARCH",
        VIEW_ITEM:              "VIEW_ITEM",
        VIEW_ITEMS:             "VIEW_ITEMS",
        RATE:                   "RATE",
        SHARE:                  "SHARE",
        COMPLETE_REGISTRATION:  "COMPLETE_REGISTRATION",
        COMPLETE_TUTORIAL:      "COMPLETE_TUTORIAL",
        ACHIEVE_LEVEL:          "ACHIEVE_LEVEL",
        UNLOCK_ACHIEVEMENT:     "UNLOCK_ACHIEVEMENT",
        INVITE:                 "INVITE",
        LOGIN:                  "LOGIN",
        SUBSCRIBE:              "SUBSCRIBE",
        START_TRIAL:            "START_TRIAL",
        OTHER:                  "OTHER"
    }

    ' Branch SDK Valid Currencies
    CURRENCIES = {
        AED:                    "AED",
        AFN:                    "AFN",
        ALL:                    "ALL",
        AMD:                    "AMD",
        ANG:                    "ANG",
        AOA:                    "AOA",
        ARS:                    "ARS",
        AUD:                    "AUD",
        AWG:                    "AWG",
        AZN:                    "AZN",
        BAM:                    "BAM",
        BBD:                    "BBD",
        BDT:                    "BDT",
        BGN:                    "BGN",
        BHD:                    "BHD",
        BIF:                    "BIF",
        BMD:                    "BMD",
        BND:                    "BND",
        BOB:                    "BOB",
        BOV:                    "BOV",
        BRL:                    "BRL",
        BSD:                    "BSD",
        BTN:                    "BTN",
        BWP:                    "BWP",
        BYN:                    "BYN",
        BYR:                    "BYR",
        BZD:                    "BZD",
        CAD:                    "CAD",
        CDF:                    "CDF",
        CHE:                    "CHE",
        CHF:                    "CHF",
        CHW:                    "CHW",
        CLF:                    "CLF",
        CLP:                    "CLP",
        CNY:                    "CNY",
        COP:                    "COP",
        COU:                    "COU",
        CRC:                    "CRC",
        CUC:                    "CUC",
        CUP:                    "CUP",
        CVE:                    "CVE",
        CZK:                    "CZK",
        DJF:                    "DJF",
        DKK:                    "DKK",
        DOP:                    "DOP",
        DZD:                    "DZD",
        EGP:                    "EGP",
        ERN:                    "ERN",
        ETB:                    "ETB",
        EUR:                    "EUR",
        FJD:                    "FJD",
        FKP:                    "FKP",
        GBP:                    "GBP",
        GEL:                    "GEL",
        GHS:                    "GHS",
        GIP:                    "GIP",
        GMD:                    "GMD",
        GNF:                    "GNF",
        GTQ:                    "GTQ",
        GYD:                    "GYD",
        HKD:                    "HKD",
        HNL:                    "HNL",
        HRK:                    "HRK",
        HTG:                    "HTG",
        HUF:                    "HUF",
        IDR:                    "IDR",
        ILS:                    "ILS",
        INR:                    "INR",
        IQD:                    "IQD",
        IRR:                    "IRR",
        ISK:                    "ISK",
        JMD:                    "JMD",
        JOD:                    "JOD",
        JPY:                    "JPY",
        KES:                    "KES",
        KGS:                    "KGS",
        KHR:                    "KHR",
        KMF:                    "KMF",
        KPW:                    "KPW",
        KRW:                    "KRW",
        KWD:                    "KWD",
        KYD:                    "KYD",
        KZT:                    "KZT",
        LAK:                    "LAK",
        LBP:                    "LBP",
        LKR:                    "LKR",
        LRD:                    "LRD",
        LSL:                    "LSL",
        LYD:                    "LYD",
        MAD:                    "MAD",
        MDL:                    "MDL",
        MGA:                    "MGA",
        MKD:                    "MKD",
        MMK:                    "MMK",
        MNT:                    "MNT",
        MOP:                    "MOP",
        MRO:                    "MRO",
        MUR:                    "MUR",
        MVR:                    "MVR",
        MWK:                    "MWK",
        MXN:                    "MXN",
        MXV:                    "MXV",
        MYR:                    "MYR",
        MZN:                    "MZN",
        NAD:                    "NAD",
        NGN:                    "NGN",
        NIO:                    "NIO",
        NOK:                    "NOK",
        NPR:                    "NPR",
        NZD:                    "NZD",
        OMR:                    "OMR",
        PAB:                    "PAB",
        PEN:                    "PEN",
        PGK:                    "PGK",
        PHP:                    "PHP",
        PKR:                    "PKR",
        PLN:                    "PLN",
        PYG:                    "PYG",
        QAR:                    "QAR",
        RON:                    "RON",
        RSD:                    "RSD",
        RUB:                    "RUB",
        RWF:                    "RWF",
        SAR:                    "SAR",
        SBD:                    "SBD",
        SCR:                    "SCR",
        SDG:                    "SDG",
        SEK:                    "SEK",
        SGD:                    "SGD",
        SHP:                    "SHP",
        SLL:                    "SLL",
        SOS:                    "SOS",
        SRD:                    "SRD",
        SSP:                    "SSP",
        STD:                    "STD",
        SVC:                    "SVC",
        SYP:                    "SYP",
        SZL:                    "SZL",
        THB:                    "THB",
        TJS:                    "TJS",
        TMT:                    "TMT",
        TND:                    "TND",
        TOP:                    "TOP",
        TRY:                    "TRY",
        TTD:                    "TTD",
        TWD:                    "TWD",
        TZS:                    "TZS",
        UAH:                    "UAH",
        UGX:                    "UGX",
        USD:                    "USD",
        USN:                    "USN",
        UYI:                    "UYI",
        UYU:                    "UYU",
        UZS:                    "UZS",
        VEF:                    "VEF",
        VND:                    "VND",
        VUV:                    "VUV",
        WST:                    "WST",
        XAF:                    "XAF",
        XAG:                    "XAG",
        XAU:                    "XAU",
        XBA:                    "XBA",
        XBB:                    "XBB",
        XBC:                    "XBC",
        XBD:                    "XBD",
        XCD:                    "XCD",
        XDR:                    "XDR",
        XOF:                    "XOF",
        XPD:                    "XPD",
        XPF:                    "XPF",
        XPT:                    "XPT",
        XSU:                    "XSU",
        XTS:                    "XTS",
        XUA:                    "XUA",
        XXX:                    "XXX",
        YER:                    "YER",
        ZAR:                    "ZAR",
        ZMW:                    "ZMW",
        ZWL:                    "ZWL"
    }

    return {
        LOG_LEVEL:           LOG_LEVEL,
        DEFAULT_CONFIG:      DEFAULT_CONFIG,
        TASK_EVENT_FIELDS:   TASK_EVENT_FIELDS,
        EVENT_TYPE:          EVENT_TYPE,
        CURRENCIES:          CURRENCIES,
        API_URLS:            API_URLS,
        ENVIRONMENT:         ENVIRONMENT,
        SDKCONSTANTS:        SDKCONSTANTS
    }

end function

'
' Retrieve a reference to the global Branch SDK object.
'
function GetBranchSdk() as object
    if (getGlobalAA().branchSdkInstance = invalid) then
        print "*** Error *** Branch SDK is not created yet! Call StartBranchSdk first."
    end if

    return getGlobalAA().branchSdkInstance
end function

'
' Initialize Branch SDK as per your required configuration parameters
' See BranchSdkConstants().DEFAULT_CONFIG for other available configuration parameters
'
sub StartBranchSdk(options as object, messagePort as object)
    if (getGlobalAA().branchSdkInstance <> invalid) then
        branchPrintLogger = GetBranchSdk().logger
        branchPrintLogger.info("StartBranchSdk called more then once.")
        return
    end if

    CreateBranchUtilities = function() as object
        instance = {
            GetTimeInMilliSeconds: function() as longinteger
                date = CreateObject("roDateTime")
                currentTime = CreateObject("roLongInteger")
                currentTime.SetLongInt(date.asSeconds())
                return (currentTime * 1000) + date.getMilliseconds()
            end function,

            GetTimeInSeconds: function() as longinteger
                date = CreateObject("roDateTime")
                currentTime = CreateObject("roLongInteger")
                currentTime.SetLongInt(date.asSeconds())
                return currentTime
            end function,
        }

        return instance
    end function

    CreateBranchPrintLogger = function() as object
        instance = {
            Header: "Branch SDK",

            warning: function(message as String) as void
                m.printlog(BranchSdkConstants().LOG_LEVEL.WARNING, message)
            end function,

            error: function(message as String) as void
                m.printlog(BranchSdkConstants().LOG_LEVEL.ERROR, message)
            end function,

            info: function(message as String) as void
                m.printlog(BranchSdkConstants().LOG_LEVEL.INFO, message)
            end function,

            debug: function(message as String) as void
                m.printlog(BranchSdkConstants().LOG_LEVEL.DEBUG, message)
            end function,

            all: function(message as String) as void
                m.printlog(BranchSdkConstants().LOG_LEVEL.ALL, message)
            end function,

            printlog: function(level as integer, message as String) as void
                 if (GetBranchSdk().configuration.logLevel >= level) then
                    print "================ " m.Header " ======================"
                    print message
                    print "=================================================="
                end if
            end function
        }

        return instance
    end function

    CreateBranchConfiguration = function(initParams as object) as object
        config = BranchSdkConstants().DEFAULT_CONFIG
        for each key in initParams
            config.AddReplace(key, initParams[key])
        end for

        if config.environment = BranchSdkConstants().ENVIRONMENT.DEVELOPMENT then
            config.development = true
        else if config.environment = BranchSdkConstants().ENVIRONMENT.PRODUCTION then
            config.development = false
        else
            appInfo = CreateObject("roAppInfo")
            config.development = appInfo.IsDev()
        end if

        return config
    end function

    CreateBranchNetworking = function(messagePort as object) as object
        instance = {
            messagePort: messagePort,
            pendingTransfers: {},
            messageQueue: [],
            apiLocalTimeout: 10, ' In Seconds
            apiMaxRetries: 2,

            queueMessage: function(message as object)
                m.messageQueue.push(message)
                branchPrintLogger = GetBranchSdk().logger
                branchPrintLogger.info("MessageQueue Count : " + m.messageQueue.Count().tostr())
                m.processUploads()
            end function,

            processUploads: function()
                if (m.messageQueue.Count() > 0) then
                    deviceLinkStatus = CreateObject("roDeviceInfo").GetLinkStatus()
                    if (not deviceLinkStatus) then
                        branchPrintLogger = GetBranchSdk().logger
                        branchPrintLogger.error("No active network connection - deferring upload.")
                        return -1
                    end if

                    while (m.messageQueue.count() > 0)
                        nextUpload = m.messageQueue.shift()
                        m.uploadRequest(nextUpload)
                    end while
                end if
            end function,

            uploadRequest: function (reqMsg as object)
                branchPrintLogger = GetBranchSdk().logger
                if (reqMsg = invalid or reqMsg.endPoint = invalid) then
                    branchPrintLogger.error("Invalid url received! Message ignored.")
                    return false
                end if

                urlTransfer = CreateObject("roUrlTransfer")
                url = reqMsg.endPoint

                urlTransfer.SetUrl(url)
                urlTransfer.EnableEncodings(true)
                urlTransfer.InitClientCertificates()

                ' Note : Right now we are using ROKU Default cert, in case API server requires specific cert then set that here'
                urlTransfer.SetCertificatesFile("common:/certs/ca-bundle.crt")

                requestId = urlTransfer.GetIdentity().ToStr()
                utilities = GetBranchSdk().utils
                currentTime = utilities.GetTimeInSeconds()
                m.pendingTransfers[requestId] = {"requester": urlTransfer, "request":reqMsg, "sentTime":currentTime}

                reqJson = FormatJson(reqMsg.message)

                urlTransfer.AddHeader("Content-Type","application/json")
                urlTransfer.RetainBodyOnError(true)

                urlTransfer.setPort(m.messagePort)
                branchPrintLogger.debug("Calling API (" + requestId.tostr() + ") : " + urlTransfer.GetUrl())
                branchPrintLogger.debug("Request data (" + requestId.tostr() + ") : " + reqJson)
                urlTransfer.AsyncPostFromString(reqJson)
            end function,

            handleUrlEvent: function(urlEvent as object)
                branchPrintLogger = GetBranchSdk().logger
                responseObject = invalid
                if (urlEvent <> invalid)
                    requestId = urlEvent.GetSourceIdentity().ToStr()
                    sourceMessage = m.pendingTransfers[requestId]

                    if (sourceMessage = invalid)
                        branchPrintLogger.debug("Unknown event received... Source message not found!")
                    else
                        m.pendingTransfers.delete(requestId)

                        responseCode = urlEvent.GetResponseCode()
                        responseBody = urlEvent.GetString()
                        failureReason = urlEvent.GetFailureReason()

                        branchPrintLogger.debug("Response (" + requestId.tostr() + ") : " + responseBody)
                        branchPrintLogger.debug("Response errorCode (" + requestId.tostr() + ") : " + responseCode.tostr())
                        branchPrintLogger.debug("Response failureReason (" + requestId.tostr() + ") : " + failureReason)

                        if (responseCode = 200) then
                            if (responseBody <> invalid and responseBody <> "") then
                                responseObject = parsejson(responseBody)
                                if (responseObject <> invalid) then
                                    registry = GetBranchSdk().registry
                                    if (responseObject.DoesExist("error")) then
                                        ' HBTODO: TEST
                                        ' if (responseObject.DoesExist("message")) then
                                        ' jsonResponse
                                        ' jsonResponse = responseObject
                                        ' jsonResponse.message =
                                    else
                                        branchPrintLogger.info("Processing response method : " + sourceMessage.request.method)
                                        if (sourceMessage.request.method = "initSession") then
                                            if (responseObject.DoesExist("device_fingerprint_id")) then
                                                registry.setDeviceFingerprintId(responseObject.device_fingerprint_id)
                                            end if
                                            if (responseObject.DoesExist("identity_id")) then
                                                registry.setIdentityId(responseObject.identity_id)
                                            end if
                                            if (responseObject.DoesExist("session_id")) then
                                                registry.setSessionId(responseObject.session_id)
                                            end if
                                        else if (sourceMessage.request.method = "setIdentity") then
                                            if (responseObject.DoesExist("identity_id")) then
                                                registry.setIdentityId(responseObject.identity_id)
                                            end if
                                        else if (sourceMessage.request.method = "logout") then
                                            if (responseObject.DoesExist("identity_id")) then
                                                registry.setIdentityId(responseObject.identity_id)
                                            end if
                                            if (responseObject.DoesExist("session_id")) then
                                                registry.setSessionId(responseObject.session_id)
                                            end if
                                        else if (sourceMessage.request.method = "logEvent") then
                                            ' Caching None
                                        end if
                                    end if
                                else ' Remove relevant wait field as successful API response received with Invalid json
                                    responseObject = {}
                                end if
                            else ' Remove relevant wait field as successful API response received
                                responseObject = {}
                            end if
                        else
                            if (responseCode = 503 or responseCode = 504 or responseCode = 408) then 'API Timeout 408 and 504
                                if (sourceMessage.request.message.retryNumber < m.apiMaxRetries) then
                                    branchPrintLogger.info("Server Timeout. Retry Number : " + sourceMessage.request.message.retryNumber.tostr())
                                    sourceMessage.request.message.retryNumber++
                                    m.messageQueue.unshift(sourceMessage.request)
                                else
                                    if (responseBody <> invalid and responseBody <> "") then
                                        responseObject = parsejson(responseBody)
                                    else ' Remove relevant wait field as timeout retries are finished
                                        responseObject = {}
                                    end if
                                end if
                            else if (responseCode = 400) then
                                if (responseBody <> invalid and responseBody <> "") then
                                    responseObject = parsejson(responseBody)
                                else ' Remove relevant wait field as timeout retries are finished
                                    responseObject = {}
                                end if
                            else
                                ' HBTODO: Discuss about this case for whether to keep or remove from the queue, to increase retryNumber or not
                                m.messageQueue.unshift(sourceMessage.request)
                                branchPrintLogger.error("Unknown error while performing upload.")
                            end if
                        end if
                    end if
                else
                    branchPrintLogger.warning("*** Warning *** Invalid urlEvent!")
                end if

                return responseObject
            end function,

            processTimeOutMessages: function()
                branchPrintLogger = GetBranchSdk().logger
                pendingTransferCount = m.pendingTransfers.count()
                utilities = GetBranchSdk().utils
                currentTime = utilities.GetTimeInSeconds()
                if (pendingTransferCount > 0) then
                    branchPrintLogger.info("Processing timed out messages count : " + pendingTransferCount.tostr())
                    for each pendingReqId in m.pendingTransfers
                        pendingReq = m.pendingTransfers[pendingReqId]
                        if ((currentTime - pendingReq.sentTime) > m.apiLocalTimeout) then
                            requestId = pendingReq.requester.GetIdentity().ToStr()
                            m.pendingTransfers.delete(requestId)
                            if (pendingReq.request.message.retryNumber < m.apiMaxRetries) then
                                pendingReq.request.message.retryNumber++
                                m.messageQueue.unshift(pendingReq.request)
                            else
                                branchPrintLogger.error("*** Error *** No more retries to do for this request!")
                            end if
                        end if
                    end for
                end if
            end function,
        }

        return instance
    end function

    CreateBranchRegistryManager = function(initParams as object)
        registry = {}
        'Registry Section = Prefix + BranchKey + ChannelId
        appInfo = CreateObject("roAppInfo")
        registryNamePrefix = "BranchSdk_registry"
        branchKey = initParams.branchKey

        sectionName = registryNamePrefix + "_" + branchKey + "_" + appInfo.getid()
        registry.keys = {
            MAIN_SECTION_PREFIX: registryNamePrefix
            SECTION_NAME: sectionName,
            DEVELOPER_IDENTITY: "developer_identity",
            DEVICE_FINGERPRINT_ID: "device_fingerprint_id",
            IDENTITY_ID: "identity_id",
            SESSION_ID: "session_id"
            IS_FIRST_TIME: "isFirstTime"
        }
        print "Branch SDK registy section name : " + registry.keys.SECTION_NAME
        registry.section = CreateObject("roRegistrySection", registry.keys.SECTION_NAME)

        registry.printAll = function() as void
            print "Registry printAll : "
            print "====================> Print registry values <===================="
            reg = CreateObject("roRegistry")
            for each section in reg.GetSectionList()
                regSection = CreateObject("roRegistrySection", section)
                index = Instr(0, section, m.keys.MAIN_SECTION_PREFIX)
                if (index <> 0) then
                    print "Registry section : " section
                    for each key in regSection.GetKeyList()
                        print "Registry Key : " key
                        print "Registry Value : " regSection.Read(key)
                    end for
                end if
            end for
            print "================================================================="
        end function

        registry.clearAll = function() as void
            print "Registry clearAll : "
            print "====================> Clear registry values <===================="
            reg = CreateObject("roRegistry")
            for each section in reg.GetSectionList()
                regSection = CreateObject("roRegistrySection", section)
                index = Instr(0, section, m.keys.MAIN_SECTION_PREFIX)
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
        end function

        registry.set = function(key as string, value as string) as boolean
           return m.section.Write(key, value)
        end function

        registry.get = function(key as string) as string
           return m.section.Read(key)
        end function

        registry.flush = function() as boolean
          return m.section.Flush()
        end function

        registry.clear = function()
           for each key in m.keys
              m.section.delete(key)
           end for
           m.flush()
        end function

        registry.setDeveloperIdentity = function(developerIdentity as string)
            m.set(m.keys.DEVELOPER_IDENTITY, developerIdentity)
            m.flush()
        end function

        registry.getDeveloperIdentity = function() as string
            return m.get(m.keys.DEVELOPER_IDENTITY)
        end function

        registry.setDeviceFingerprintId = function(version as string)
            m.set(m.keys.DEVICE_FINGERPRINT_ID, version)
            m.flush()
        end function

        registry.getDeviceFingerprintId = function() as string
            return m.get(m.keys.DEVICE_FINGERPRINT_ID)
        end function

        registry.setIdentityId = function(identityId as string)
            m.set(m.keys.IDENTITY_ID, identityId)
            m.flush()
        end function

        registry.getIdentityId = function() as string
            return m.get(m.keys.IDENTITY_ID)
        end function

        registry.setSessionId = function(sessionId as string)
            m.set(m.keys.SESSION_ID, sessionId)
            m.flush()
        end function

        registry.getSessionId = function() as string
            return m.get(m.keys.SESSION_ID)
        end function

        registry.setIsFirstTime = function(isFirstTime as boolean)
            if (isFirstTime = true) then
                value = "1"
            else
                value = "0"
            end if
            m.set(m.keys.IS_FIRST_TIME, value)
            m.flush()
        end function

        registry.getIsFirstTime = function() as boolean
            value = m.get(m.keys.IS_FIRST_TIME)
            if (value = "0") then
                isFirstTime = false
            else ' INVALID or True
                isFirstTime = true
            end if
            return isFirstTime
        end function

        return registry
    end function

    CreateBranchApplicationInfo = function() as object
        if (m.BranchSdkAppInfo = invalid) then
            appInfo = CreateObject("roAppInfo")
            devInfo = CreateObject("roDeviceInfo")

            osVersion = devInfo.GetOSVersion()
            strVersion = ""
            if (osVersion <> invalid) then
                osMajorVersion = osVersion.major
                osMinorVersion = osVersion.minor
                strOsVersion = osMajorVersion + "." + osMinorVersion
            end if

            m.BranchSdkAppInfo = {
                OsVersion:      strOsVersion,
                AppVersion:     appInfo.GetVersion()
            }
        end if

        return m.BranchSdkAppInfo
    end function

    CreateBranchDeviceInfo = function() as object
        if (m.collectedDeviceInfo = invalid) then
            info = CreateObject("roDeviceInfo")
            m.BranchSdkDeviceInfo = {
                Model:                info.GetModel(),
                Rida:                 info.GetRIDA(),
                DisplaySize:          info.GetDisplaySize(),
                IsAddTrackingEnabled: not info.IsRIDADisabled(),
            }
        end if

        return m.BranchSdkDeviceInfo
    end function

    ' Branch SDK API request models
    branchSdkApiRequestModels = {
        GetInitSessionModel: function(uri = "", inputArgs = {}, endPoint = "", callbackField = "", callbackFunc = "") as object
            branchSdkInstance = GetBranchSdk()
            appInfo = branchSdkInstance.appInfo
            deviceInfo = branchSdkInstance.deviceInfo
            registry = branchSdkInstance.registry
            params = branchSdkInstance.params
            configuration = branchSdkInstance.configuration
            sdkConstants = BranchSdkConstants().SDKCONSTANTS

            isFirstTime = registry.getIsFirstTime()
            message = {}
            if (isFirstTime) then
                if (params.preinstall_campaign <> invalid) then
                    message.preinstall_campaign = params.preinstall_campaign
                end if

                if (params.preinstall_partner <> invalid) then
                    message.preinstall_partner = params.preinstall_partner
                end if
            end if

            message.uri = uri
            message.branch_key = configuration.branchKey
            message.app_version = appInfo.AppVersion
            message.os = sdkConstants.OS_NAME
            message.os_version = appInfo.OsVersion
            message.retryNumber = 0
            message.brand = sdkConstants.BRAND_NAME
            message.model = deviceInfo.Model
            message.sdk = sdkConstants.SDK_NAME
            message.sdk_version = sdkConstants.SDK_VERSION
            message.screen_height = deviceInfo.DisplaySize.h
            message.screen_width = deviceInfo.DisplaySize.w
            message.ad_tracking_enabled = deviceInfo.IsAddTrackingEnabled

            devFingerprint = registry.getDeviceFingerprintId()
            if (devFingerprint <> invalid and devFingerprint <> "") then
                message.device_fingerprint_id = devFingerprint
            end if

            identityId = registry.getIdentityId()
            if (identityId <> invalid and identityId <> "") then
                message.identity_id = identityId
            end if

            advertising_ids = {}
            advertising_ids.roku_rida = deviceInfo.Rida
            message.advertising_ids = advertising_ids

            if (inputArgs <> invalid) then
                message.launch_options = inputArgs
            end if
            
            msg = {
                message: message,
                endPoint: endPoint,
                method: "initSession",
                callbackField: callbackField,
                callbackFunc: callbackFunc
            }

            registry.setIsFirstTime(false)
            return msg
        end function,

        GetHandleInputModel: function(inputArgs = {}, endPoint = "", callbackField = "", callbackFunc = "") as object
            branchSdkInstance = GetBranchSdk()
            appInfo = branchSdkInstance.appInfo
            deviceInfo = branchSdkInstance.deviceInfo
            registry = branchSdkInstance.registry
            params = branchSdkInstance.params
            configuration = branchSdkInstance.configuration
            sdkConstants = BranchSdkConstants().SDKCONSTANTS

            isFirstTime = registry.getIsFirstTime()
            message = {}
            message.branch_key = configuration.branchKey
            message.app_version = appInfo.AppVersion
            message.os = sdkConstants.OS_NAME
            message.os_version = appInfo.OsVersion
            message.retryNumber = 0
            message.brand = sdkConstants.BRAND_NAME
            message.model = deviceInfo.Model
            message.sdk = sdkConstants.SDK_NAME
            message.sdk_version = sdkConstants.SDK_VERSION
            message.screen_height = deviceInfo.DisplaySize.h
            message.screen_width = deviceInfo.DisplaySize.w
            message.ad_tracking_enabled = deviceInfo.IsAddTrackingEnabled

            devFingerprint = registry.getDeviceFingerprintId()
            if (devFingerprint <> invalid and devFingerprint <> "") then
                message.device_fingerprint_id = devFingerprint
            end if

            identityId = registry.getIdentityId()
            if (identityId <> invalid and identityId <> "") then
                message.identity_id = identityId
            end if

            advertising_ids = {}
            advertising_ids.roku_rida = deviceInfo.Rida
            message.advertising_ids = advertising_ids

            if (inputArgs <> invalid) then
                message.launch_options = inputArgs
            end if

            msg = {
                message: message,
                endPoint: endPoint,
                method: "handleInput",
                callbackField: callbackField,
                callbackFunc: callbackFunc
            }

            return msg
        end function,

        GetIdentityModel: function(developer_identity = "", endPoint = "", callbackField = "", callbackFunc = "") as object
            sdkConstants = BranchSdkConstants().SDKCONSTANTS
            branchSdkInstance = GetBranchSdk()
            appInfo = branchSdkInstance.appInfo
            deviceInfo = branchSdkInstance.deviceInfo
            registry = branchSdkInstance.registry
            configuration = branchSdkInstance.configuration

            message = {}
            message.identity = developer_identity
            message.branch_key = configuration.branchKey
            message.app_version = appInfo.AppVersion
            message.os = sdkConstants.OS_NAME
            message.os_version = appInfo.OsVersion
            message.retryNumber = 0
            message.brand = sdkConstants.BRAND_NAME
            message.model = deviceInfo.Model
            message.sdk = sdkConstants.SDK_NAME
            message.sdk_version = sdkConstants.SDK_VERSION
            message.screen_height = deviceInfo.DisplaySize.h
            message.screen_width = deviceInfo.DisplaySize.w
            message.ad_tracking_enabled = deviceInfo.IsAddTrackingEnabled

            devFingerprint = registry.getDeviceFingerprintId()
            if (devFingerprint <> invalid and devFingerprint <> "") then
                message.device_fingerprint_id = devFingerprint
            end if

            identityId = registry.getIdentityId()
            if (identityId <> invalid and identityId <> "") then
                message.identity_id = identityId
            end if

            advertising_ids = {}
            advertising_ids.roku_rida = deviceInfo.Rida
            message.advertising_ids = advertising_ids

            msg = {
                message: message,
                endPoint: endPoint,
                method: "setIdentity",
                callbackField: callbackField,
                callbackFunc: callbackFunc
            }

            return msg
        end function,

        GetUserEventModel: function(name = "", customer_event_alias = "", transaction_id = "", currency = "", revenue = 0.0 as double, endPoint = "", callbackField = "", callbackFunc = "") as object
            sdkConstants = BranchSdkConstants().SDKCONSTANTS
            branchSdkInstance = GetBranchSdk()
            appInfo = branchSdkInstance.appInfo
            deviceInfo = branchSdkInstance.deviceInfo
            registry = branchSdkInstance.registry
            configuration = branchSdkInstance.configuration

            message = {}
            message.name = name
            message.customer_event_alias = customer_event_alias
            message.branch_key = configuration.branchKey

            user_data = {}

            devFingerprint = registry.getDeviceFingerprintId()
            if (devFingerprint <> invalid and devFingerprint <> "") then
                user_data.device_fingerprint_id = devFingerprint
            end if

            developerId = registry.getDeveloperIdentity()
            if (developerId <> invalid and developerId <> "") then
                user_data.developer_identity = developerId
            end if

            user_data.app_version = appInfo.AppVersion
            user_data.os = sdkConstants.OS_NAME
            user_data.os_version =  appInfo.OsVersion
            user_data.brand = sdkConstants.BRAND_NAME
            user_data.model = deviceInfo.Model
            user_data.sdk = sdkConstants.UDSDK_NAME
            user_data.sdk_version = sdkConstants.UDSDK_VERSION
            user_data.screen_height = deviceInfo.DisplaySize.h
            user_data.screen_width = deviceInfo.DisplaySize.w
            user_data.environment = sdkConstants.SDKENVIRONMENT

            advertising_ids = {}
            advertising_ids.roku_rida = deviceInfo.Rida
            user_data.advertising_ids = advertising_ids
            user_data.limit_ad_tracking = deviceInfo.IsAddTrackingEnabled

            message.user_data = user_data

            event_data = {}
            event_data.transaction_id = transaction_id
            event_data.currency = currency
            event_data.revenue = revenue
            message.event_data = event_data

            message.retryNumber = 0

            msg = {
                message: message,
                endPoint: endPoint,
                method: "logEvent",
                callbackField: callbackField,
                callbackFunc: callbackFunc
            }

            return msg
        end function,

        GetLogoutModel: function(endPoint = "", callbackField = "", callbackFunc = "") as object
            sdkConstants = BranchSdkConstants().SDKCONSTANTS
            branchSdkInstance = GetBranchSdk()
            appInfo = branchSdkInstance.appInfo
            deviceInfo = branchSdkInstance.deviceInfo
            registry = branchSdkInstance.registry
            configuration = branchSdkInstance.configuration

            message = {}
            message.branch_key = configuration.branchKey
            message.app_version = appInfo.AppVersion
            message.os = sdkConstants.OS_NAME
            message.os_version = appInfo.OsVersion
            message.retryNumber = 0
            message.brand = sdkConstants.BRAND_NAME
            message.model = deviceInfo.Model
            message.sdk = sdkConstants.SDK_NAME
            message.sdk_version = sdkConstants.SDK_VERSION
            message.screen_height = deviceInfo.DisplaySize.h
            message.screen_width = deviceInfo.DisplaySize.w
            message.ad_tracking_enabled = deviceInfo.IsAddTrackingEnabled

            devFingerprint = registry.getDeviceFingerprintId()
            if (devFingerprint <> invalid and devFingerprint <> "") then
                message.device_fingerprint_id = devFingerprint
            end if

            identityId = registry.getIdentityId()
            if (identityId <> invalid and identityId <> "") then
                message.identity_id = identityId
            end if

            advertising_ids = {}
            advertising_ids.roku_rida = deviceInfo.Rida
            message.advertising_ids = advertising_ids

            message.session_id = registry.getSessionId()
            msg = {
                message: message,
                endPoint: endPoint,
                method: "logout",
                callbackField: callbackField,
                callbackFunc: callbackFunc
            }

            return msg
        end function,
    }

    ' Place to perform startup process after Branch Sdk initialized
    branchSdkStartupTasks = function()
        ' HBTODO: TEST
        registry = GetBranchSdk().registry
        ' registry.clearAll()
        registry.printAll()
    end function

    '
    ' Branch SDK API's
    '
    branchSdkApi = {
        setPreinstallData: function(campaign = "", partner = "") as void
                                registry = GetBranchSdk().registry
                                isFirstTime = registry.getIsFirstTime()

                                m.logger.debug("branchSdkApi : setPreinstallData isFirstTime " + isFirstTime.tostr())
                                if (isFirstTime) then
                                    params = GetBranchSdk().params
                                    params.AddReplace("preinstall_campaign", campaign)
                                    params.AddReplace("preinstall_partner", partner)
                                end if
                            end function,

        initSession:        function(uri = "", inputArgs = {}, callbackField = "", callbackFunc = "") as void
                                m.sendMessageInQueue(m.requestModels.GetInitSessionModel(uri, inputArgs, BranchSdkConstants().API_URLS.sessionUrl, callbackField, callbackFunc))
                            end function,

        setIdentity:        function(developer_identity = "", callbackField = "", callbackFunc = "") as void
                                registry = GetBranchSdk().registry
                                registry.setDeveloperIdentity(developer_identity)
                                m.sendMessageInQueue(m.requestModels.GetIdentityModel(developer_identity, BranchSdkConstants().API_URLS.profileUrl, callbackField, callbackFunc))
                            end function,

        logEvent:           function(name = "", customer_event_alias = "", transaction_id = "", currency = "", revenue = "", callbackField = "", callbackFunc = "") as void
                                if (BranchSdkConstants().EVENT_TYPE.[name] = invalid)
                                    endPoint = BranchSdkConstants().API_URLS.customEventUrl
                                else
                                    endPoint = BranchSdkConstants().API_URLS.standardEventUrl
                                end if
                                registry = GetBranchSdk().registry
                                m.sendMessageInQueue(m.requestModels.GetUserEventModel(name, customer_event_alias, transaction_id, currency, revenue, endPoint, callbackField, callbackFunc))
                            end function,
        logout:             function(callbackField = "", callbackFunc = "") as void
                                m.sendMessageInQueue(m.requestModels.GetLogoutModel(BranchSdkConstants().API_URLS.logoutUrl, callbackField, callbackFunc))
                            end function,
        handleInput:        function(inputArgs = {}, callbackField = "", callbackFunc = "") as void
                                m.sendMessageInQueue(m.requestModels.GetHandleInputModel(inputArgs, BranchSdkConstants().API_URLS.handleInputUrl, callbackField, callbackFunc))
                            end function,
        sendMessageInQueue: function(message as object) as void
                                m.networking.queueMessage(message)
                            end function,
        onUrlEvent:         function(urlEvent as object)
                                return m.networking.handleUrlEvent(urlEvent)
                            end function,
        isBranchSdkEvent:   function(sourceIdentity as integer) as boolean
                                return m.networking.pendingTransfers.DoesExist(sourceIdentity.tostr())
                            end function,
        upload:             function() as void
                                m.networking.processUploads()
                            end function,

        requestModels:      branchSdkApiRequestModels
    }

    branchSdkApi.append({
        utils:          CreateBranchUtilities(),
        logger:         CreateBranchPrintLogger(),
        configuration:  CreateBranchConfiguration(options),
        networking:     CreateBranchNetworking(messagePort),
        registry:       CreateBranchRegistryManager(options),
        appInfo:        CreateBranchApplicationInfo(),
        deviceInfo:     CreateBranchDeviceInfo(),
        params:         {}
    })
    getGlobalAA().branchSdkInstance = branchSdkApi
    branchSdkStartupTasks()
end sub

' Use an instance of this class to make calls to Branch SDK API's in ROKU Scene Graph Applications
function CreateBranchSdkForSceneGraphApp() as object
    if (m.global.branchSdkConfig = invalid) then
        print "*** BranchSDK Error *** : Branch configuration is not set."
        return invalid
    end if

    initParams = m.global.branchSdkConfig
    if (not initParams.DoesExist("branchKey") or type(initParams.branchKey) <> "roString" or initParams.branchKey = "") then
        print "*** BranchSDK Error *** : BranchKey is not configured."
        return invalid
    end if

    task = createObject("roSGNode", "branchSdkTask")
    return {
        callbackCounter:    1,
        branchSdkTask:      task,
        setPreinstallData:  function(campaign = "", partner = "") as void
                                m.invokeFunction("setPreinstallData", [campaign, partner])
                            end function,
        initSession:        function(uri = "", inputArgs = {}, callbackFunc = "") as void
                                callbackField = m.setCallbackField(callbackFunc)
                                m.invokeFunction("initSession", [uri, inputArgs, callbackField, callbackFunc])
                            end function,
        setIdentity:           function(developer_identity = "", callbackFunc = "") as void
                                callbackField = m.setCallbackField(callbackFunc)
                                m.invokeFunction("setIdentity", [developer_identity, callbackField, callbackFunc])
                            end function,
        logEvent:           function(name = "", customer_event_alias = "", transaction_id = "", currency = "", revenue = "", callbackFunc = "") as void
                                callbackField = m.setCallbackField(callbackFunc)
                                m.invokeFunction("logEvent", [name, customer_event_alias, transaction_id, currency, revenue, callbackField, callbackFunc])
                            end function,
        logout:             function(callbackFunc = "") as void
                                callbackField = m.setCallbackField(callbackFunc)
                                m.invokeFunction("logout", [callbackField, callbackFunc])
                            end function,
        handleInput:        function(inputArgs = {}, callbackFunc = "") as void
                                callbackField = m.setCallbackField(callbackFunc)
                                m.invokeFunction("handleInput", [inputArgs, callbackField, callbackFunc])
                            end function,
        upload:             function() as void
                                m.invokeFunction("upload", [])
                            end function,
        setCallbackField:   function(callbackFunc as string) as string
                                m.callbackCounter++
                                if (m.callbackCounter >= 100000) then
                                    m.callbackCounter = 1
                                end if
                                callbackField = m.callbackCounter.tostr()
                                m.branchSdkTask.addField(callbackField, "assocarray", false)
                                m.branchSdkTask.observeField(callbackField, callbackFunc)
                                return callbackField
                            end function,
        invokeFunction:     function(name as string, args)
                                invocation = {}
                                invocation.methodName = name
                                invocation.args = args
                                m.branchSdkTask[BranchSdkConstants().TASK_EVENT_FIELDS.CALL_BRANCH_API] = invocation
                            end function
     }
end function
