---
parasoftVersion: 2025.1.0
productVersion: 10.7.2
schemaVersion: 4
suite:
  $type: TestSuite
  name: Test Suite
  hasEnvironmentConfig: true
  environmentConfig:
    environments:
    - variables:
      - name: HOST
        value: http://localhost
      - name: PORT
        value: 9080
      - name: USERNAME
        value: admin
      - name: PASSWORD
        maskValue: true
        value: AwAAABh0SEJJU3JQcnhjODNQOEJwNXJlb3N3PT0=
      - name: test
        value: test
      name: SOAVirt Server
      active: true
  lastModifiedBy: lesambadu
  authentications:
  - $type: BasicAuthentication
    name: Basic
    username:
      fixedValue:
        $type: StringTestValue
        username: "${USERNAME}"
    password:
      fixedValue:
        $type: PasswordTestValue
        password: AwAAACxuRmkweUNsRm1KQ2k4UVFaaldlZXFIVmk0c1FldUNXRU8xQVdzZThlQ2pzPQ==
  testLogicVariables:
  - $type: TestLogicString
    name: variablesToAdd
    value:
      $type: TestLogicVariableString
      originalValue: ""
      value: ""
  - $type: TestLogicBoolean
    name: topLevelTestCases
    value:
      $type: TestLogicVariableBoolean
  - $type: TestLogicBoolean
    name: folders
    value:
      $type: TestLogicVariableBoolean
  - $type: TestLogicString
    name: fullMessage
    value:
      $type: TestLogicVariableString
      originalValue: ""
      value: ""
  dataSources:
  - id: ds_-1030898402_1540939294332_1700068985
    fileFilter: '*.json'
    refresh: true
    impl:
      $type: FileDataSource
      model:
        columnCount: 4
        columnIdentifiers:
        - File Contents
        - File Name
        - File Size
        - File Path
      directory:
        path: C:\Users\rmartinez\Downloads\postman-soatest-master\Collection
    name: Postman Collection
  - id: ds_1311519532_1541437103594_1605438595
    impl:
      $type: WritableDataSource
      model:
        columnCount: 1
        rowCount: 113
        rows:
        - - "Agency (1,157) - Using direct tests Copy"
      writingMode: 3
    name: TestSuites
    useAllRows: true
  runMode: 1
  tests:
  - $type: ToolTest
    name: Extension Tool
    testID: 160
    tool:
      $type: MethodTool
      dataSourceNames:
      - Postman Collection
      iconName: Method
      name: Convert Variable References
      method:
        hasCode: true
        code:
          $type: ScriptCode
          input:
            useText: true
            textInput:
              $type: ScriptingTextInput
              text: "import com.parasoft.api.*;\r\nimport java.util.regex.*;\r\n\r\
                \npublic void populate(Object input, ExtensionToolContext context)\r\
                \n{\r\n\tString start = input.toString();\r\n\tPattern pattern = Pattern.compile(\"\
                (\\\\\\$[\\\\{])(.*?)(\\\\})\");\r\n\tMatcher matcher = pattern.matcher(start);\r\
                \n\t\r\n\tList<String> listMatches = new ArrayList<String>();\r\n\t\
                \r\n\twhile(matcher.find())\r\n \t{\r\n    \tlistMatches.add(matcher.group(2));\r\
                \n    }\r\n\tfor(String s : listMatches)\r\n    {\r\n    \tstart =\
                \ start.replaceFirst(pattern,\"{{\"+s+\"}}\")\r\n    }\r\n\tcontext.setValue(\"\
                fullMessage\",start);\r\n\tApplication.showMessage(start);\r\n}"
        hasMethodId: true
        methodId:
          $type: ScriptMethodIdentifier
          functionName: populate
          arguments:
          - java.lang.Object
          - com.parasoft.api.ExtensionToolContext
    writeInput: true
    inputType: InputUsable
    input:
      use: 3
      text:
        text: ""
        type: text/plain
      dataSource:
        columnName: File Contents
  - $type: HTTPClientToolTest
    name: Messaging Client
    testID: 2
    tool:
      $type: HTTPClient
      dataSourceNames:
      - Postman Collection
      iconName: HTTPClient
      name: Full Message
      formJson:
        value:
          $type: ElementValue
          writeType: true
          type:
            $type: ElementType
            localName: root
            bodyType:
              $type: ComplexType
              attributes:
              - ns: ""
                name: type
                fixed: object
                contentType:
                  $type: StringType
                required: true
              name: rootType
              compositor: true
              compositorObj:
                $type: AllCompositor
          replacedColumn: ""
          values:
          - $type: ComplexValue
            replacedColumn: ""
            attributes:
            - replacedColumn: ""
              value:
                $type: StringValue
                replacedColumn: ""
                value: object
                xmlEncoding: 2
              useValue: true
            compositorValue: true
            compositorValueObj:
              replacedColumn: ""
              values:
                $type: CompositorValueSetCollectionSet
                set:
                - $type: CompositorValueSet
        elementTypeName: root
      hasServiceInfo: true
      serviceInfo:
        serviceDescriptor:
          $type: StandardServiceDescriptor
          location: ""
      jsonBuilder:
        hasValue: true
        value:
          $type: JSONObjectValue
          nameIsNull: true
      formInput:
        value:
          $type: ElementValue
          writeType: true
          type:
            $type: ElementType
            localName: ""
            bodyType:
              $type: ComplexType
              name: anonymous
              compositor: true
              compositorObj:
                $type: SequenceCompositor
          replacedColumn: ""
          values:
          - $type: ComplexValue
            replacedColumn: ""
            compositorValue: true
            compositorValueObj:
              replacedColumn: ""
              values:
                $type: CompositorValueSetCollectionSet
                set:
                - $type: CompositorValueSet
      jmsMessageOutputProvider:
        $type: JMSMessageOutputProvider
        jmsOutputProviderRequest:
          $type: JMSOutputProvider
          name: Request Object
          menuName: Object
        jmsOutputProviderResponse:
          $type: JMSOutputProvider
          name: Response Message Object
          menuName: Message Object
      transportProperties:
        manager:
          protocol: 10
          properties:
          - $type: HTTPClientHTTPProperties
            followRedirects:
              bool: true
            common:
              auth:
                useDefault: false
                customType: 1
              method:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: HTTPMethodTestValue
                  method: POST
            keepAlive1_1:
              bool: true
          - $type: HTTPClientHTTPProperties
            followRedirects:
              bool: true
            common:
              auth:
                useDefault: false
                customType: 1
              method:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: HTTPMethodTestValue
                  method: POST
            protocol: 1
            keepAlive1_1:
              bool: true
          - $type: JNDIProperties
            msgExpiration:
              $type: JMSMessageExpiration
            bytesMessageReadMethod:
              string: readUTF()
            responseCorrelation:
              correlationId:
                name: JMSCorrelationID
                value:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: StringTestValue
              messageSelector: ""
            queueProperties:
              jmsDestination:
                name: JMSDestination
                value:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: StringTestValue
                    value: JMS_RequestQueue
              jmsReplyTo:
                name: JMSReplyTo
                value:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: StringTestValue
                    value: JMS_ResponseQueue
            msgType:
              string: javax.jms.TextMessage
            useP2P:
              bool: true
            connProperties:
              jmsFactory:
                name: Connection Factory
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: MQ_JMS_MANAGER
              jndiFactory:
                name: Initial Context
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: com.sun.jndi.fscontext.RefFSContextFactory
              providerURL:
                name: Provider URL
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: file:/C:/JNDI-Directory
              auth:
                service:
                  name: Service
                  value:
                    fixedValue:
                      $type: StringTestValue
                username:
                  name: Username
                  value:
                    fixedValue:
                      $type: StringTestValue
                password:
                  name: Password
                  value:
                    fixedValue:
                      $type: PasswordTestValue
            useSync: true
          - $type: SonicMQJNDIProperties
            msgExpiration:
              $type: JMSMessageExpiration
            bytesMessageReadMethod:
              string: readUTF()
            responseCorrelation:
              correlationId:
                name: JMSCorrelationID
                value:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: StringTestValue
              messageSelector: ""
            queueProperties:
              jmsDestination:
                name: JMSDestination
                value:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: StringTestValue
                    value: JMS_RequestQueue
              jmsReplyTo:
                name: JMSReplyTo
                value:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: StringTestValue
                    value: JMS_ResponseQueue
            msgType:
              string: progress.message.jclient.MultipartMessage
            useP2P:
              bool: true
            connProperties:
              initialContextProps:
              - name: java.naming.security.credentials
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: Administrator
              - name: java.naming.security.principal
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: Administrator
              jmsFactory:
                name: Connection Factory
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: ConnectionFactory
              jndiFactory:
                name: Initial Context
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: com.sonicsw.jndi.mfcontext.MFContextFactory
              providerURL:
                name: Provider URL
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: "tcp://[hostname]:2506"
              auth:
                service:
                  name: Service
                  value:
                    fixedValue:
                      $type: StringTestValue
                username:
                  name: Username
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: Administrator
                password:
                  name: Password
                  value:
                    fixedValue:
                      $type: PasswordTestValue
            useSync: true
            partContentID:
              string: part1
          - $type: MQProperties
            mqrfh2fields:
              version:
                name: Version
                value:
                  fixedValue:
                    $type: StringTestValue
              encoding:
                name: Encoding
                value:
                  fixedValue:
                    $type: StringTestValue
              codedCharSetId:
                name: CodedCharSetId
                value:
                  fixedValue:
                    $type: StringTestValue
              format:
                name: Format
                value:
                  fixedValue:
                    $type: StringTestValue
              flags:
                name: Flags
                value:
                  fixedValue:
                    $type: StringTestValue
              nameValueCodedCharSetId:
                name: NameValueCodedCharSetId
                value:
                  fixedValue:
                    $type: StringTestValue
            mcd:
              msd:
                name: Message Service Domain
                value:
                  fixedValue:
                    $type: StringTestValue
              set:
                name: Message Set
                value:
                  fixedValue:
                    $type: StringTestValue
              type:
                name: Message Type
                value:
                  fixedValue:
                    $type: StringTestValue
              fmt:
                name: Output Format
                value:
                  fixedValue:
                    $type: StringTestValue
            psc:
              subIdentity:
                name: SubIdentity
                value:
                  fixedValue:
                    $type: StringTestValue
              qName:
                name: QName
                value:
                  fixedValue:
                    $type: StringTestValue
              qMgrName:
                name: QMgrName
                value:
                  fixedValue:
                    $type: StringTestValue
              subPoint:
                name: SubPoint
                value:
                  fixedValue:
                    $type: StringTestValue
              filter:
                name: Filter
                value:
                  fixedValue:
                    $type: StringTestValue
              subName:
                name: SubName
                value:
                  fixedValue:
                    $type: StringTestValue
              subUserData:
                name: SubUserData
                value:
                  fixedValue:
                    $type: StringTestValue
            jms:
              destination:
                name: Destination
                value:
                  fixedValue:
                    $type: StringTestValue
              replyTo:
                name: Reply To
                value:
                  fixedValue:
                    $type: StringTestValue
              timestamp:
                name: Timestamp
                value:
                  fixedValue:
                    $type: StringTestValue
              expiration:
                name: Expiration
                value:
                  fixedValue:
                    $type: StringTestValue
              correlationId:
                name: Correlation Id
                value:
                  fixedValue:
                    $type: StringTestValue
              priority:
                name: Priority
                value:
                  fixedValue:
                    $type: StringTestValue
              deliveryMode:
                name: Delivery Mode
                value:
                  fixedValue:
                    $type: StringTestValue
            mqQueueManager:
              ccsid:
                name: CCSID
                value:
                  fixedValue:
                    $type: StringTestValue
            mqSSL:
              peerName:
                name: Peer Name
                value:
                  fixedValue:
                    $type: StringTestValue
              cipherSuite:
                $type: EnumNameValuePair
                name: CipherSuite
                value:
                  fixedValue:
                    $type: StringTestValue
            conn:
              keepAliveConnection: false
              putManagerId:
                name: Put Manager Id
                value:
                  fixedValue:
                    $type: StringTestValue
              getManagerId:
                name: Get Manager Id
                value:
                  fixedValue:
                    $type: StringTestValue
              channel:
                name: Channel
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: CHANNEL1
              host:
                name: Host
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: host
              port:
                name: Port
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: 1414
              manager:
                name: Queue Manager
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: queue.manager.1
              putQueue:
                name: Put Queue
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: PutQueue
              getQueue:
                name: Get Queue
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: GetQueue
              auth:
                service:
                  name: Service
                  value:
                    fixedValue:
                      $type: StringTestValue
                username:
                  name: Username
                  value:
                    fixedValue:
                      $type: StringTestValue
                password:
                  name: Password
                  value:
                    fixedValue:
                      $type: PasswordTestValue
            mqpmMisc:
              applicationIdData:
                name: Application ID data
                value:
                  fixedValue:
                    $type: StringTestValue
              correlationID:
                name: Correlation ID
                value:
                  fixedValue:
                    $type: StringTestValue
              expiry:
                name: Expiry (in tenths of a second)
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: -1
              messageSequenceNumber:
                name: Message sequence number
                value:
                  fixedValue:
                    $type: StringTestValue
              replyToQueueManagerName:
                name: Reply queue manager name
                value:
                  fixedValue:
                    $type: StringTestValue
              replyToQueueName:
                name: Reply queue name
                value:
                  fixedValue:
                    $type: StringTestValue
              putApplicationName:
                name: Put application name
                value:
                  fixedValue:
                    $type: StringTestValue
              applicationOriginData:
                name: Originating application data
                value:
                  fixedValue:
                    $type: StringTestValue
              userId:
                name: User ID
                value:
                  fixedValue:
                    $type: StringTestValue
            mqgmMisc:
              correlationID:
                name: Correlation Id
                value:
                  fixedValue:
                    $type: StringTestValue
              waitInterval:
                name: Wait Interval(in milliseconds)
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: -1
          - $type: RMIProperties
            hostName:
              name: Host
              value:
                fixedValue:
                  $type: StringTestValue
                  value: Host
            portNumber:
              name: Port
              value:
                fixedValue:
                  $type: StringTestValue
                  value: Port
            bindingName:
              name: Binding
              value:
                fixedValue:
                  $type: StringTestValue
                  value: Binding
            remoteInterface:
              name: Remote Interface
              value:
                fixedValue:
                  $type: StringTestValue
                  value: Remote Interface
            methodName:
              name: Method Name
              value:
                fixedValue:
                  $type: StringTestValue
                  value: Method Name
          - $type: SMTPConnectionProperties
            port:
              name: Port
              value:
                fixedValue:
                  $type: StringTestValue
                  value: 25
            host:
              name: SMTP Host
              value:
                fixedValue:
                  $type: StringTestValue
            user:
              name: Username
              value:
                fixedValue:
                  $type: StringTestValue
            pass:
              name: Password
              value:
                fixedValue:
                  $type: PasswordTestValue
                  password: AwAAAAA=
            fromEmail:
              name: From Email
              value:
                fixedValue:
                  $type: StringTestValue
            toEmail:
              name: To Email
              value:
                fixedValue:
                  $type: StringTestValue
            subject:
              name: Subject
              value:
                fixedValue:
                  $type: StringTestValue
          - $type: TIBCOProperties
            timeLimit:
              name: Time Limit
              value:
                fixedValue:
                  $type: StringTestValue
                  value: 0
            service:
              name: ""
              value:
                fixedValue:
                  $type: StringTestValue
            network:
              name: ""
              value:
                fixedValue:
                  $type: StringTestValue
            daemon:
              name: DAEMON
              value:
                fixedValue:
                  $type: StringTestValue
                  value: DAEMON
            sendSubject:
              name: Send Subject
              value:
                fixedValue:
                  $type: StringTestValue
                  value: Send Subject
            replySubject:
              name: Reply Field Name
              value:
                fixedValue:
                  $type: StringTestValue
                  value: Reply Field Name
            sendFieldName:
              name: Send Field Name
              value:
                fixedValue:
                  $type: StringTestValue
                  value: Send Field Name
            replyFieldName:
              name: Reply Field Name
              value:
                fixedValue:
                  $type: StringTestValue
                  value: Reply Field Name
          - $type: NoneTransportProperties
          - $type: CustomTransportProperties
            selected: 0
            configs:
            - $type: CustomTransportConfigurationImpl
              ConfigClassName: com.parasoft.soavirt.transport.socket.SocketTransport
              values:
                customValueMap:
                - charset
                - $type: MultiValueCustomValue
                - eof
                - $type: MultiValueCustomValue
                - host
                - $type: MultiValueCustomValue
                - port
                - $type: MultiValueCustomValue
              className: com.parasoft.soavirt.transport.socket.SocketTransport
              name: TCP/IP Socket
        messageExchangePattern:
          inverted: true
      outputProviders:
        requestHeader:
          $type: HTTPNamedToolOutputProvider
          menuName: Transport Header
          name: Request Transport Header
        responseHeader:
          $type: HTTPNamedToolOutputProvider
          menuName: Transport Header
          name: Response Transport Header
        xmlRequestOutput:
          $type: NamedXMLToolOutputProvider
          outputTools:
          - $type: GenericDataBank
            dataSourceNames:
            - Postman Collection
            iconName: XMLDataBank
            name: JSON Data Bank
            wrappedTool:
              $type: XMLtoDataSource
              dataSourceNames:
              - Postman Collection
              iconName: XMLDataBank
              name: XML Data Bank
              selectedXPaths:
              - elementOption: 1
                contentOption: 1
                XMLDataBank_ExtractXPath: "/root/info[1]/name[1]/text()"
                mode: 1
              - elementOption: 1
                contentOption: 1
                XMLDataBank_ExtractXPath: "//item[not(request) and not(info) and ./item]/name/text()"
                mode: 1
              canonicalizeOutput: true
              xmlMessage: true
              virtualDSCreator:
                writableColumns:
                - dataSourceNames:
                  - "TestNames: A"
                  customName: TestName
                - dataSourceNames:
                  - "TestSuites: A"
                  mode: 2
                  customName: "Test 1: name"
            conversionStrategy:
              dataFormatName: JSON
              conversionStrategyId: JSON
              conversionStrategyClassName: com.parasoft.xml.convert.json.JsonConversionStrategy
          menuName: Traffic
          name: Request Traffic
        trafficOutput:
          m_name: Traffic Stream
        objectOutput:
          $type: ObjectOutputProvider
          outputTools:
          - $type: TrafficViewer
            iconName: TrafficViewer
            name: Traffic Viewer
            showRequestHeaders: true
            showResponseHeaders: true
          name: Traffic Object
      literal:
        use: 1
        text:
          MessagingClient_LiteralMessage: "${fullMessage}"
          type: text/json
        dataSource:
          columnName: File Contents
      mode: Literal
  - $type: RESTClientToolTest
    name: Create Tests 2
    testID: 23
    tool:
      $type: RESTClient
      dataSourceNames:
      - Postman Collection
      iconName: RESTClient
      name: Create .tst
      outputTools:
      - $type: GenericDataBank
        dataSourceNames:
        - Postman Collection
        iconName: XMLDataBank
        name: JSON Data Bank
        wrappedTool:
          $type: XMLtoDataSource
          dataSourceNames:
          - Postman Collection
          iconName: XMLDataBank
          name: XML Data Bank
          selectedXPaths:
          - elementOption: 1
            contentOption: 1
            XMLDataBank_ExtractXPath: "/root/relationships[1]/childrenRel[1]/item[1]/id[1]/text()"
            mode: 1
          canonicalizeOutput: true
          xmlMessage: true
          virtualDSCreator:
            writableColumns:
            - dataSourceNames:
              - "TestNames: A"
              customName: TopTestSuiteID
        conversionStrategy:
          dataFormatName: JSON
          conversionStrategyId: JSON
          conversionStrategyClassName: com.parasoft.xml.convert.json.JsonConversionStrategy
      formJson:
        builtFromSchema: true
        value:
          $type: ElementValue
          writeType: true
          type:
            $type: ElementType
            localName: root
            bodyType:
              $type: ComplexType
              attributes:
              - ns: ""
                name: type
                defaultValue: object
                fixed: object
                contentType:
                  $type: StringType
                required: true
              name: /components/schemas/tstsRequest
              compositor: true
              compositorObj:
                $type: AllCompositor
                types:
                - $type: ElementType
                  localName: name
                  bodyType:
                    $type: ComplexType
                    _id: 1
                    attributes:
                    - ns: ""
                      name: type
                      defaultValue: string
                      fixed: string
                      contentType:
                        $type: StringType
                        _id: 2
                      required: true
                    content: true
                    contentObj:
                      $type: StringType
                      _ref: 2
                    namespace: urn:parasoft:json
                    name: string
                    compositor: true
                    compositorObj:
                      $type: SequenceCompositor
                - $type: ElementType
                  localName: parent
                  bodyType:
                    $type: ComplexType
                    attributes:
                    - ns: ""
                      name: type
                      defaultValue: object
                      fixed: object
                      contentType:
                        $type: StringType
                        _ref: 2
                      required: true
                    name: /components/schemas/parent
                    compositor: true
                    compositorObj:
                      $type: AllCompositor
                      types:
                      - $type: ElementType
                        minOccurs: 0
                        localName: id
                        bodyType:
                          $type: ComplexType
                          _ref: 1
          replacedColumn: ""
          values:
          - $type: ComplexValue
            replacedColumn: ""
            attributes:
            - replacedColumn: ""
              value:
                $type: StringValue
                replacedColumn: ""
                value: object
                xmlEncoding: 2
              useValue: true
            compositorValue: true
            compositorValueObj:
              replacedColumn: ""
              values:
                $type: CompositorValueSetCollectionSet
                set:
                - $type: CompositorValueSet
                  values:
                  - $type: ElementValue
                    replacedColumn: ""
                    values:
                    - $type: ComplexValue
                      replacedColumn: ""
                      attributes:
                      - replacedColumn: ""
                        value:
                          $type: StringValue
                          replacedColumn: ""
                          value: string
                          xmlEncoding: 2
                        useValue: true
                      contentValue: true
                      contentValueObj:
                        $type: StringValue
                        replacedColumn: ""
                        mode: 3
                        columnName: TestName
                        value: AgencyOnly
                        xmlEncoding: 2
                      compositorValue: true
                      compositorValueObj:
                        replacedColumn: ""
                        values:
                          $type: CompositorValueSetCollectionSet
                          set:
                          - $type: CompositorValueSet
                  - $type: ElementValue
                    replacedColumn: ""
                    values:
                    - $type: ComplexValue
                      replacedColumn: ""
                      attributes:
                      - replacedColumn: ""
                        value:
                          $type: StringValue
                          replacedColumn: ""
                          value: object
                          xmlEncoding: 2
                        useValue: true
                      compositorValue: true
                      compositorValueObj:
                        replacedColumn: ""
                        values:
                          $type: CompositorValueSetCollectionSet
                          set:
                          - $type: CompositorValueSet
                            values:
                            - $type: ElementValue
                              replacedColumn: ""
                              values:
                              - $type: ComplexValue
                                replacedColumn: ""
                                allowArrayExclude: true
                                attributes:
                                - replacedColumn: ""
                                  value:
                                    $type: StringValue
                                    replacedColumn: ""
                                    value: string
                                    xmlEncoding: 2
                                  useValue: true
                                contentValue: true
                                contentValueObj:
                                  $type: StringValue
                                  replacedColumn: ""
                                  value: TestAssets
                                  xmlEncoding: 2
                                compositorValue: true
                                compositorValueObj:
                                  replacedColumn: ""
                                  values:
                                    $type: CompositorValueSetCollectionSet
                                    set:
                                    - $type: CompositorValueSet
        elementTypeName: root
      hasServiceInfo: true
      serviceInfo:
        serviceDescriptor:
          $type: StandardServiceDescriptor
          location: http://ulvbdparas01.rei.com:9080/soavirt/api/v6
      jsonBuilder:
        hasValue: true
        value:
          $type: JSONObjectValue
          nameIsNull: true
      schemaURL:
        MessagingClient_SchemaLocation: "${HOST}:${PORT}/soavirt/api/v6"
      formInput:
        value:
          $type: ElementValue
          writeType: true
          hasReference: true
          qnameAsString: ":"
          replacedColumn: ""
          values:
          - $type: ComplexValue
            replacedColumn: ""
            compositorValue: true
            compositorValueObj:
              replacedColumn: ""
              values:
                $type: CompositorValueSetCollectionSet
                set:
                - $type: CompositorValueSet
      jmsMessageOutputProvider:
        $type: JMSMessageOutputProvider
        jmsOutputProviderRequest:
          $type: JMSOutputProvider
          name: Request Object
          menuName: Object
        jmsOutputProviderResponse:
          $type: JMSOutputProvider
          name: Response Message Object
          menuName: Message Object
      router:
        values:
        - $type: ScriptedValue
        fixedValue:
          $type: StringTestValue
          HTTPClient_Endpoint: http://localhost:9080/soavirt/api/v6/files/tsts
      transportProperties:
        manager:
          protocol: 1
          properties:
          - $type: HTTPClientHTTPProperties
            followRedirects:
              bool: true
            common:
              auth:
                useDefault: false
                authName: Basic
              method:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: HTTPMethodTestValue
                  method: POST
            keepAlive1_1:
              bool: true
          - $type: HTTPClientHTTPProperties
            followRedirects:
              bool: true
            common:
              auth:
                useDefault: false
                authName: Basic
              method:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: HTTPMethodTestValue
                  method: POST
            protocol: 1
            keepAlive1_1:
              bool: true
          - $type: NoneTransportProperties
        messageExchangePattern:
          inverted: true
      outputProviders:
        requestHeader:
          $type: HTTPNamedToolOutputProvider
          menuName: Transport Header
          name: Request Transport Header
        responseHeader:
          $type: HTTPNamedToolOutputProvider
          menuName: Transport Header
          name: Response Transport Header
        xmlRequestOutput:
          $type: NamedXMLToolOutputProvider
          menuName: Traffic
          name: Request Traffic
        trafficOutput:
          m_name: Traffic Stream
        objectOutput:
          $type: ObjectOutputProvider
          outputTools:
          - $type: TrafficViewer
            iconName: TrafficViewer
            name: Traffic Viewer
            showRequestHeaders: true
            showResponseHeaders: true
          name: Traffic Object
      literal:
        use: 1
        text:
          MessagingClient_LiteralMessage: ""
          type: application/json
        dataSource:
          columnName: File Contents
      mode: Form JSON
      literalQuery:
        isPropertiesRef: true
      literalPath:
        pathElements:
        - values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
            value: soavirt
        - values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
            value: api
        - values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
            value: v6
        - values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
            value: files
        - values:
          - $type: ScriptedValue
          fixedValue:
            $type: StringTestValue
            value: tsts
      resourceMethod:
        resourceId: /v6/files/tsts
        httpMethod: POST
      resourceMode: 3
      baseUrl:
        values:
        - $type: ScriptedValue
        - $type: WadlTestValue
          value: http://localhost:9080/soavirt/api
        fixedValue:
          $type: StringTestValue
          value: http://localhost:9080/soavirt/api/
        selectedIndex: 1
  - $type: HTTPClientToolTest
    name: Full Message 2
    testID: 93
    tool:
      $type: HTTPClient
      dataSourceNames:
      - Postman Collection
      iconName: HTTPClient
      name: Check If Folders
      formJson:
        value:
          $type: ElementValue
          writeType: true
          type:
            $type: ElementType
            localName: root
            bodyType:
              $type: ComplexType
              attributes:
              - ns: ""
                name: type
                fixed: object
                contentType:
                  $type: StringType
                required: true
              name: rootType
              compositor: true
              compositorObj:
                $type: AllCompositor
          replacedColumn: ""
          values:
          - $type: ComplexValue
            replacedColumn: ""
            attributes:
            - replacedColumn: ""
              value:
                $type: StringValue
                replacedColumn: ""
                value: object
                xmlEncoding: 2
              useValue: true
            compositorValue: true
            compositorValueObj:
              replacedColumn: ""
              values:
                $type: CompositorValueSetCollectionSet
                set:
                - $type: CompositorValueSet
        elementTypeName: root
      hasServiceInfo: true
      serviceInfo:
        serviceDescriptor:
          $type: StandardServiceDescriptor
          location: ""
      jsonBuilder:
        hasValue: true
        value:
          $type: JSONObjectValue
          nameIsNull: true
      formInput:
        value:
          $type: ElementValue
          writeType: true
          hasReference: true
          qnameAsString: ":"
          replacedColumn: ""
          values:
          - $type: ComplexValue
            replacedColumn: ""
            compositorValue: true
            compositorValueObj:
              replacedColumn: ""
              values:
                $type: CompositorValueSetCollectionSet
                set:
                - $type: CompositorValueSet
      jmsMessageOutputProvider:
        $type: JMSMessageOutputProvider
        jmsOutputProviderRequest:
          $type: JMSOutputProvider
          name: Request Object
          menuName: Object
        jmsOutputProviderResponse:
          $type: JMSOutputProvider
          name: Response Message Object
          menuName: Message Object
      transportProperties:
        manager:
          protocol: 10
          properties:
          - $type: HTTPClientHTTPProperties
            followRedirects:
              bool: true
            common:
              auth:
                useDefault: false
                customType: 1
              method:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: HTTPMethodTestValue
                  method: POST
            keepAlive1_1:
              bool: true
          - $type: HTTPClientHTTPProperties
            followRedirects:
              bool: true
            common:
              auth:
                useDefault: false
                customType: 1
              method:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: HTTPMethodTestValue
                  method: POST
            protocol: 1
            keepAlive1_1:
              bool: true
          - $type: JNDIProperties
            msgExpiration:
              $type: JMSMessageExpiration
            bytesMessageReadMethod:
              string: readUTF()
            responseCorrelation:
              correlationId:
                name: JMSCorrelationID
                value:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: StringTestValue
              messageSelector: ""
            queueProperties:
              jmsDestination:
                name: JMSDestination
                value:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: StringTestValue
                    value: JMS_RequestQueue
              jmsReplyTo:
                name: JMSReplyTo
                value:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: StringTestValue
                    value: JMS_ResponseQueue
            msgType:
              string: javax.jms.TextMessage
            useP2P:
              bool: true
            connProperties:
              jmsFactory:
                name: Connection Factory
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: MQ_JMS_MANAGER
              jndiFactory:
                name: Initial Context
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: com.sun.jndi.fscontext.RefFSContextFactory
              providerURL:
                name: Provider URL
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: file:/C:/JNDI-Directory
              auth:
                service:
                  name: Service
                  value:
                    fixedValue:
                      $type: StringTestValue
                username:
                  name: Username
                  value:
                    fixedValue:
                      $type: StringTestValue
                password:
                  name: Password
                  value:
                    fixedValue:
                      $type: PasswordTestValue
            useSync: true
          - $type: SonicMQJNDIProperties
            msgExpiration:
              $type: JMSMessageExpiration
            bytesMessageReadMethod:
              string: readUTF()
            responseCorrelation:
              correlationId:
                name: JMSCorrelationID
                value:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: StringTestValue
              messageSelector: ""
            queueProperties:
              jmsDestination:
                name: JMSDestination
                value:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: StringTestValue
                    value: JMS_RequestQueue
              jmsReplyTo:
                name: JMSReplyTo
                value:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: StringTestValue
                    value: JMS_ResponseQueue
            msgType:
              string: progress.message.jclient.MultipartMessage
            useP2P:
              bool: true
            connProperties:
              initialContextProps:
              - name: java.naming.security.credentials
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: Administrator
              - name: java.naming.security.principal
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: Administrator
              jmsFactory:
                name: Connection Factory
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: ConnectionFactory
              jndiFactory:
                name: Initial Context
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: com.sonicsw.jndi.mfcontext.MFContextFactory
              providerURL:
                name: Provider URL
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: "tcp://[hostname]:2506"
              auth:
                service:
                  name: Service
                  value:
                    fixedValue:
                      $type: StringTestValue
                username:
                  name: Username
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: Administrator
                password:
                  name: Password
                  value:
                    fixedValue:
                      $type: PasswordTestValue
            useSync: true
            partContentID:
              string: part1
          - $type: MQProperties
            mqrfh2fields:
              version:
                name: Version
                value:
                  fixedValue:
                    $type: StringTestValue
              encoding:
                name: Encoding
                value:
                  fixedValue:
                    $type: StringTestValue
              codedCharSetId:
                name: CodedCharSetId
                value:
                  fixedValue:
                    $type: StringTestValue
              format:
                name: Format
                value:
                  fixedValue:
                    $type: StringTestValue
              flags:
                name: Flags
                value:
                  fixedValue:
                    $type: StringTestValue
              nameValueCodedCharSetId:
                name: NameValueCodedCharSetId
                value:
                  fixedValue:
                    $type: StringTestValue
            mcd:
              msd:
                name: Message Service Domain
                value:
                  fixedValue:
                    $type: StringTestValue
              set:
                name: Message Set
                value:
                  fixedValue:
                    $type: StringTestValue
              type:
                name: Message Type
                value:
                  fixedValue:
                    $type: StringTestValue
              fmt:
                name: Output Format
                value:
                  fixedValue:
                    $type: StringTestValue
            psc:
              subIdentity:
                name: SubIdentity
                value:
                  fixedValue:
                    $type: StringTestValue
              qName:
                name: QName
                value:
                  fixedValue:
                    $type: StringTestValue
              qMgrName:
                name: QMgrName
                value:
                  fixedValue:
                    $type: StringTestValue
              subPoint:
                name: SubPoint
                value:
                  fixedValue:
                    $type: StringTestValue
              filter:
                name: Filter
                value:
                  fixedValue:
                    $type: StringTestValue
              subName:
                name: SubName
                value:
                  fixedValue:
                    $type: StringTestValue
              subUserData:
                name: SubUserData
                value:
                  fixedValue:
                    $type: StringTestValue
            jms:
              destination:
                name: Destination
                value:
                  fixedValue:
                    $type: StringTestValue
              replyTo:
                name: Reply To
                value:
                  fixedValue:
                    $type: StringTestValue
              timestamp:
                name: Timestamp
                value:
                  fixedValue:
                    $type: StringTestValue
              expiration:
                name: Expiration
                value:
                  fixedValue:
                    $type: StringTestValue
              correlationId:
                name: Correlation Id
                value:
                  fixedValue:
                    $type: StringTestValue
              priority:
                name: Priority
                value:
                  fixedValue:
                    $type: StringTestValue
              deliveryMode:
                name: Delivery Mode
                value:
                  fixedValue:
                    $type: StringTestValue
            mqQueueManager:
              ccsid:
                name: CCSID
                value:
                  fixedValue:
                    $type: StringTestValue
            mqSSL:
              peerName:
                name: Peer Name
                value:
                  fixedValue:
                    $type: StringTestValue
              cipherSuite:
                $type: EnumNameValuePair
                name: CipherSuite
                value:
                  fixedValue:
                    $type: StringTestValue
            conn:
              keepAliveConnection: false
              putManagerId:
                name: Put Manager Id
                value:
                  fixedValue:
                    $type: StringTestValue
              getManagerId:
                name: Get Manager Id
                value:
                  fixedValue:
                    $type: StringTestValue
              channel:
                name: Channel
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: CHANNEL1
              host:
                name: Host
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: host
              port:
                name: Port
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: 1414
              manager:
                name: Queue Manager
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: queue.manager.1
              putQueue:
                name: Put Queue
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: PutQueue
              getQueue:
                name: Get Queue
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: GetQueue
              auth:
                service:
                  name: Service
                  value:
                    fixedValue:
                      $type: StringTestValue
                username:
                  name: Username
                  value:
                    fixedValue:
                      $type: StringTestValue
                password:
                  name: Password
                  value:
                    fixedValue:
                      $type: PasswordTestValue
            mqpmMisc:
              applicationIdData:
                name: Application ID data
                value:
                  fixedValue:
                    $type: StringTestValue
              correlationID:
                name: Correlation ID
                value:
                  fixedValue:
                    $type: StringTestValue
              expiry:
                name: Expiry (in tenths of a second)
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: -1
              messageSequenceNumber:
                name: Message sequence number
                value:
                  fixedValue:
                    $type: StringTestValue
              replyToQueueManagerName:
                name: Reply queue manager name
                value:
                  fixedValue:
                    $type: StringTestValue
              replyToQueueName:
                name: Reply queue name
                value:
                  fixedValue:
                    $type: StringTestValue
              putApplicationName:
                name: Put application name
                value:
                  fixedValue:
                    $type: StringTestValue
              applicationOriginData:
                name: Originating application data
                value:
                  fixedValue:
                    $type: StringTestValue
              userId:
                name: User ID
                value:
                  fixedValue:
                    $type: StringTestValue
            mqgmMisc:
              correlationID:
                name: Correlation Id
                value:
                  fixedValue:
                    $type: StringTestValue
              waitInterval:
                name: Wait Interval(in milliseconds)
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: -1
          - $type: RMIProperties
            hostName:
              name: Host
              value:
                fixedValue:
                  $type: StringTestValue
                  value: Host
            portNumber:
              name: Port
              value:
                fixedValue:
                  $type: StringTestValue
                  value: Port
            bindingName:
              name: Binding
              value:
                fixedValue:
                  $type: StringTestValue
                  value: Binding
            remoteInterface:
              name: Remote Interface
              value:
                fixedValue:
                  $type: StringTestValue
                  value: Remote Interface
            methodName:
              name: Method Name
              value:
                fixedValue:
                  $type: StringTestValue
                  value: Method Name
          - $type: SMTPConnectionProperties
            port:
              name: Port
              value:
                fixedValue:
                  $type: StringTestValue
                  value: 25
            host:
              name: SMTP Host
              value:
                fixedValue:
                  $type: StringTestValue
            user:
              name: Username
              value:
                fixedValue:
                  $type: StringTestValue
            pass:
              name: Password
              value:
                fixedValue:
                  $type: PasswordTestValue
                  password: AwAAAAA=
            fromEmail:
              name: From Email
              value:
                fixedValue:
                  $type: StringTestValue
            toEmail:
              name: To Email
              value:
                fixedValue:
                  $type: StringTestValue
            subject:
              name: Subject
              value:
                fixedValue:
                  $type: StringTestValue
          - $type: TIBCOProperties
            timeLimit:
              name: Time Limit
              value:
                fixedValue:
                  $type: StringTestValue
                  value: 0
            service:
              name: ""
              value:
                fixedValue:
                  $type: StringTestValue
            network:
              name: ""
              value:
                fixedValue:
                  $type: StringTestValue
            daemon:
              name: DAEMON
              value:
                fixedValue:
                  $type: StringTestValue
                  value: DAEMON
            sendSubject:
              name: Send Subject
              value:
                fixedValue:
                  $type: StringTestValue
                  value: Send Subject
            replySubject:
              name: Reply Field Name
              value:
                fixedValue:
                  $type: StringTestValue
                  value: Reply Field Name
            sendFieldName:
              name: Send Field Name
              value:
                fixedValue:
                  $type: StringTestValue
                  value: Send Field Name
            replyFieldName:
              name: Reply Field Name
              value:
                fixedValue:
                  $type: StringTestValue
                  value: Reply Field Name
          - $type: NoneTransportProperties
          - $type: CustomTransportProperties
            selected: 0
            configs:
            - $type: CustomTransportConfigurationImpl
              ConfigClassName: com.parasoft.soavirt.transport.socket.SocketTransport
              values:
                customValueMap:
                - charset
                - $type: MultiValueCustomValue
                - eof
                - $type: MultiValueCustomValue
                - host
                - $type: MultiValueCustomValue
                - port
                - $type: MultiValueCustomValue
              className: com.parasoft.soavirt.transport.socket.SocketTransport
              name: TCP/IP Socket
        messageExchangePattern:
          inverted: true
      outputProviders:
        requestHeader:
          $type: HTTPNamedToolOutputProvider
          menuName: Transport Header
          name: Request Transport Header
        responseHeader:
          $type: HTTPNamedToolOutputProvider
          menuName: Transport Header
          name: Response Transport Header
        xmlRequestOutput:
          $type: NamedXMLToolOutputProvider
          outputTools:
          - $type: GenericDataBank
            dataSourceNames:
            - Postman Collection
            iconName: XMLDataBank
            name: JSON Data Bank
            wrappedTool:
              $type: XMLtoDataSource
              dataSourceNames:
              - Postman Collection
              iconName: XMLDataBank
              name: XML Data Bank
              selectedXPaths:
              - elementOption: 1
                contentOption: 1
                XMLDataBank_ExtractXPath: "boolean(/root/item[1]//name[../../../info\
                  \ and not(../request)])"
                mode: 1
              canonicalizeOutput: true
              xmlMessage: true
              virtualDSCreator:
                writableColumns:
                - dataSourceNames:
                  - "SOASyntaxVars: A"
                  testVariableName: folders
                  mode: 3
                  customName: "Test 3: root"
            conversionStrategy:
              dataFormatName: JSON
              conversionStrategyId: JSON
              conversionStrategyClassName: com.parasoft.xml.convert.json.JsonConversionStrategy
          menuName: Traffic
          name: Request Traffic
        trafficOutput:
          m_name: Traffic Stream
        objectOutput:
          $type: ObjectOutputProvider
          outputTools:
          - $type: TrafficViewer
            iconName: TrafficViewer
            name: Traffic Viewer
            showRequestHeaders: true
            showResponseHeaders: true
          name: Traffic Object
      literal:
        use: 1
        text:
          MessagingClient_LiteralMessage: "${File Contents}"
          type: text/json
      mode: Literal
  - $type: TestSuite
    name: Create Test Suites
    testFlowLogic:
      variableCondition:
        variableCondition: true
        variableConditionObj:
          $type: BooleanCondition
          name: folders
          condition: true
      dependencyLogic:
        index: 4
    testID: 9
    testSuiteLogic: true
    testLogicVariables:
    - $type: TestLogicInteger
      value:
        $type: TestLogicVariableInteger
        useLocalValue: true
        originalValue: 1
        value: 1
    - $type: TestLogicInteger
      name: "y"
      value:
        $type: TestLogicVariableInteger
        originalValue: 1
        value: 1
    - $type: TestLogicString
      name: ParentFolderName
      value:
        $type: TestLogicVariableString
        originalValue: 0
        value: 0
    dataSources:
    - id: ds_-994842688_1541440446896_1308541627
      impl:
        $type: WritableDataSource
        model:
          columnCount: 11
          columnIdentifiers:
          - Name
          - Endpoint
          - Method
          - Body
          - Basic_User
          - Basic_Pass
          - Auth_Enabled
          - Auth_Type
          - Digest_User
          - Digest_Pass
          rowCount: 181
          rows:
          - - Agent - Create (3 tests)
            - "{{agency}}/agency/producer/WLI"
            - POST
            - "{\r\n    \"company\": {\r\n        \"code\": \"WLI\"\r\n    },\r\n\
              \    \"producerId\": \"{{agentId}}\",\r\n    \"niprNumber\": \"777123\"\
              ,\r\n    \"client\": {\r\n        \"clientId\": \"{{agentId}}\",\r\n\
              \        \"clientType\": {\r\n            \"code\": \"PERSON\",\r\n\
              \            \"description\": \"Person\"\r\n        },\r\n        \"\
              governmentId\": \"{{ssn}}\",\r\n        \"emailAddress\": {\r\n    \
              \        \"emailAddressLine\": \"{{createdAgentId}}@woodmen.org\"\r\n\
              \        },\r\n        \"phones\": [\r\n            {\r\n          \
              \      \"phoneType\": {\r\n                    \"code\": \"WORK\",\r\
              \n                    \"description\": \"Agent Business Phone\"\r\n\
              \                },\r\n                \"phoneNumber\": \"402-555-1122\"\
              \r\n            },\r\n            {\r\n                \"phoneType\"\
              : {\r\n                    \"code\": \"MOBILE\",\r\n               \
              \     \"description\": \"Mobile\"\r\n                },\r\n        \
              \        \"phoneNumber\": \"402-555-3333\"\r\n            },\r\n   \
              \         {\r\n                \"phoneType\": {\r\n                \
              \    \"code\": \"FAX\",\r\n                    \"description\": \"Fax\"\
              \r\n                },\r\n                \"phoneNumber\": \"402-555-4444\"\
              \r\n            }\r\n        ],\r\n        \"birthDate\": \"{{dob}}\"\
              ,\r\n        \"firstName\": \"Writing\",\r\n        \"gender\": {\r\n\
              \            \"code\": \"FEMALE\",\r\n            \"description\": \"\
              Female\"\r\n        },\r\n        \"lastName\": \"Agent\",\r\n     \
              \   \"middleName\": \"Middle\",\r\n        \"namePrefix\": \"Mr\",\r\
              \n        \"nameSuffix\": \"II\",\r\n        \"preferredName\": \"pref\"\
              \r\n    },\r\n    \"hierarchies\": [\r\n        {\r\n\t\t\t\"effectiveDate\"\
              : \"2013-01-01\",\r\n\t\t\t\"terminationDate\": \"\",\r\n\t\t\t\"producerId\"\
              : \"{{agentId}}\",\r\n\t\t\t\"areaManagerProducerId\": \"260173\",\r\
              \n\t\t\t\"regionManagerProducerId\":\"260141\",\r\n\t\t\t\"salesRegionId\"\
              :\"000260\"\r\n\t\t}\r\n    ],\r\n    \"contracts\": [\r\n        {\r\
              \n            \"producerContractType\": {\r\n                \"code\"\
              : \"ALPH\",\r\n                \"description\": \"Alpha Contract\"\r\
              \n            },\r\n            \"taxReportingIndicator\": \"Y\",\r\n\
              \            \"currentSituationStatus\": \"FT\",\r\n            \"maxAnnualizedPayment\"\
              : 4000,\r\n            \"annualizations\" : [{\r\n            \t\"annualizationPreferenceStartDate\"\
              :\"2014-01-01\",\r\n            \t\"annualizationPreferenceExpirationDate\"\
              :\"\",\r\n            \t\"annualizationPreferenceAdvanceType\":\"B\"\
              ,\r\n            \t\"annualizationCapPercent\": 1.0000000\t\t\t\r\n\
              \            }]\r\n        }\r\n    ],\r\n    \r\n    \"contractStartDate\"\
              : \"2013-01-01\",\r\n    \"terminationDate\": \"\",\r\n    \"addresses\"\
              : [\r\n        {\r\n            \"addressType\": {\r\n             \
              \   \"code\": \"ML\",\r\n                \"description\": \"Agent Business\
              \ Address\"\r\n            },\r\n            \"line1\": \"1700 Farnam\
              \ Street\",\r\n            \"line2\": \"\",\r\n            \"line3\"\
              : \"\",\r\n            \"line4\": \"\",\r\n            \"city\": \"\
              Omaha\",\r\n            \"country\": {\r\n                \"code\":\
              \ \"US\"\r\n            },\r\n            \"state\": {\r\n         \
              \       \"code\": \"NE\"\r\n            },\r\n            \"zip\": \"\
              68102\",\r\n            \"addressCountyName\": \"\",\r\n           \
              \ \"addressValidIndicator\": {\r\n            \t\"code\": \"0\", \r\n\
              \            \t\"description\": \"True\"\r\n            }\r\n      \
              \  }\r\n    ],\r\n        \"citizenship\": {\r\n        \"code\": \"\
              US\",\r\n        \"description\": \"United States of America\"\r\n \
              \   },\r\n    \"compensationSchedules\": [\r\n        {\r\n        \
              \    \"compensationScheduleEffectiveDate\": \"2013-01-01\",\r\n    \
              \        \"compensationScheduleTerminationDate\": \"\",\r\n        \
              \    \"producerContractType\": {\r\n                \"code\": \"ALPH\"\
              ,\r\n                \"description\": \"Alpha Contract\"\r\n       \
              \     }\r\n        }\r\n    ]\r\n}"
            - null
            - null
            - "false"
          - - Agent - Retrieve (55 tests)
            - "{{agency}}/agency/producer/WLI/{{createdAgentId}}"
            - GET
            - null
            - null
            - null
            - "false"
          - - Agent - Create (3 tests) Copy
            - "{{agency}}/agency/producer/WLI"
            - POST
            - "{\r\n    \"company\": {\r\n        \"code\": \"WLI\"\r\n    },\r\n\
              \    \"producerId\": \"{{agentId}}\",\r\n    \"niprNumber\": \"777123\"\
              ,\r\n    \"client\": {\r\n        \"clientId\": \"{{agentId}}\",\r\n\
              \        \"clientType\": {\r\n            \"code\": \"PERSON\",\r\n\
              \            \"description\": \"Person\"\r\n        },\r\n        \"\
              governmentId\": \"{{ssn}}\",\r\n        \"emailAddress\": {\r\n    \
              \        \"emailAddressLine\": \"{{createdAgentId}}@woodmen.org\"\r\n\
              \        },\r\n        \"phones\": [\r\n            {\r\n          \
              \      \"phoneType\": {\r\n                    \"code\": \"WORK\",\r\
              \n                    \"description\": \"Agent Business Phone\"\r\n\
              \                },\r\n                \"phoneNumber\": \"402-555-1122\"\
              \r\n            },\r\n            {\r\n                \"phoneType\"\
              : {\r\n                    \"code\": \"MOBILE\",\r\n               \
              \     \"description\": \"Mobile\"\r\n                },\r\n        \
              \        \"phoneNumber\": \"402-555-3333\"\r\n            },\r\n   \
              \         {\r\n                \"phoneType\": {\r\n                \
              \    \"code\": \"FAX\",\r\n                    \"description\": \"Fax\"\
              \r\n                },\r\n                \"phoneNumber\": \"402-555-4444\"\
              \r\n            }\r\n        ],\r\n        \"birthDate\": \"{{dob}}\"\
              ,\r\n        \"firstName\": \"Writing\",\r\n        \"gender\": {\r\n\
              \            \"code\": \"FEMALE\",\r\n            \"description\": \"\
              Female\"\r\n        },\r\n        \"lastName\": \"Agent\",\r\n     \
              \   \"middleName\": \"Middle\",\r\n        \"namePrefix\": \"Mr\",\r\
              \n        \"nameSuffix\": \"II\",\r\n        \"preferredName\": \"pref\"\
              \r\n    },\r\n    \"hierarchies\": [\r\n        {\r\n\t\t\t\"effectiveDate\"\
              : \"2013-01-01\",\r\n\t\t\t\"terminationDate\": \"\",\r\n\t\t\t\"producerId\"\
              : \"{{agentId}}\",\r\n\t\t\t\"areaManagerProducerId\": \"260173\",\r\
              \n\t\t\t\"regionManagerProducerId\":\"260141\",\r\n\t\t\t\"salesRegionId\"\
              :\"000260\"\r\n\t\t}\r\n    ],\r\n    \"contracts\": [\r\n        {\r\
              \n            \"producerContractType\": {\r\n                \"code\"\
              : \"ALPH\",\r\n                \"description\": \"Alpha Contract\"\r\
              \n            },\r\n            \"taxReportingIndicator\": \"Y\",\r\n\
              \            \"currentSituationStatus\": \"FT\",\r\n            \"maxAnnualizedPayment\"\
              : 4000,\r\n            \"annualizations\" : [{\r\n            \t\"annualizationPreferenceStartDate\"\
              :\"2014-01-01\",\r\n            \t\"annualizationPreferenceExpirationDate\"\
              :\"\",\r\n            \t\"annualizationPreferenceAdvanceType\":\"B\"\
              ,\r\n            \t\"annualizationCapPercent\": 1.0000000\t\t\t\r\n\
              \            }]\r\n        }\r\n    ],\r\n    \r\n    \"contractStartDate\"\
              : \"2013-01-01\",\r\n    \"terminationDate\": \"\",\r\n    \"addresses\"\
              : [\r\n        {\r\n            \"addressType\": {\r\n             \
              \   \"code\": \"ML\",\r\n                \"description\": \"Agent Business\
              \ Address\"\r\n            },\r\n            \"line1\": \"1700 Farnam\
              \ Street\",\r\n            \"line2\": \"\",\r\n            \"line3\"\
              : \"\",\r\n            \"line4\": \"\",\r\n            \"city\": \"\
              Omaha\",\r\n            \"country\": {\r\n                \"code\":\
              \ \"US\"\r\n            },\r\n            \"state\": {\r\n         \
              \       \"code\": \"NE\"\r\n            },\r\n            \"zip\": \"\
              68102\",\r\n            \"addressCountyName\": \"\",\r\n           \
              \ \"addressValidIndicator\": {\r\n            \t\"code\": \"0\", \r\n\
              \            \t\"description\": \"True\"\r\n            }\r\n      \
              \  }\r\n    ],\r\n        \"citizenship\": {\r\n        \"code\": \"\
              US\",\r\n        \"description\": \"United States of America\"\r\n \
              \   },\r\n    \"compensationSchedules\": [\r\n        {\r\n        \
              \    \"compensationScheduleEffectiveDate\": \"2013-01-01\",\r\n    \
              \        \"compensationScheduleTerminationDate\": \"\",\r\n        \
              \    \"producerContractType\": {\r\n                \"code\": \"ALPH\"\
              ,\r\n                \"description\": \"Alpha Contract\"\r\n       \
              \     }\r\n        }\r\n    ]\r\n}"
            - null
            - null
            - "false"
          - - Add Appointment only (2 tests)
            - "{{agency}}/agency/license/WLI/{{createdAgentId}}"
            - PATCH
            - "[{\r\n\t\t\"type\": \"appointment\",\r\n\t\t\"action\": \"A\",\r\n\t\
              \t\"appointment\": {\r\n\t\t\t\"state\": {\r\n\t\t\t\t\"code\": \"IA\"\
              \r\n\t\t\t},\r\n\t\t\t\"residentOfStateIndicator\": \"N\",\r\n\t\t\t\
              \"effectiveDate\": \"2016-02-01\",\r\n\t\t\t\"expirationDate\": \"\"\
              ,\r\n\t\t\t\"approvalIndicator\": \"A\",\r\n\t\t\t\"expirationReason\"\
              : \"\",\r\n\t\t\t\"lineOfAuthorityTypes\": [{\r\n\t\t\t\t\t\"code\"\
              : \"LHFAVAR\"\r\n\t\t\t\t}\r\n\t\t\t]\r\n\t\t}\r\n\t}\r\n]"
            - null
            - null
            - "false"
          - - Add Appointment and License (2 tests)
            - "{{agency}}/agency/license/WLI/{{createdAgentId}}"
            - PATCH
            - "[{\r\n\t\t\"type\": \"license\",\r\n\t\t\"action\": \"A\",\r\n\t\t\"\
              license\": {\r\n\t\t\t\"state\": {\r\n\t\t\t\t\"code\": \"NE\"\r\n\t\
              \t\t},\r\n\t\t\t\"residentOfStateIndicator\": \"R\",\r\n\t\t\t\"licenseStatus\"\
              : \"P\",\r\n\t\t\t\"approvalIndicator\": \"V\",\r\n\t\t\t\"lineOfAuthorityTypes\"\
              : [{\r\n\t\t\t\t\t\"code\": \"L\"\r\n\t\t\t\t}\r\n\t\t\t],\r\n\t\t\t\
              \"effectiveDate\": \"2015-01-01\",\r\n\t\t\t\"expirationDate\": \"\"\
              ,\r\n\t\t\t\"expirationReason\": \"\",\r\n\t\t\t\"licenseId\": \"7014\"\
              \r\n\t\t}\r\n\t}, {\r\n\t\t\"type\": \"appointment\",\r\n\t\t\"action\"\
              : \"A\",\r\n\t\t\"appointment\": {\r\n\t\t\t\"state\": {\r\n\t\t\t\t\
              \"code\": \"NE\"\r\n\t\t\t},\r\n\t\t\t\"residentOfStateIndicator\":\
              \ \"R\",\r\n\t\t\t\"effectiveDate\": \"2015-01-01\",\r\n\t\t\t\"expirationDate\"\
              : \"\",\r\n\t\t\t\"approvalIndicator\": \"V\",\r\n\t\t\t\"expirationReason\"\
              : \"\",\r\n\t\t\t\"lineOfAuthorityTypes\": [{\r\n\t\t\t\t\t\"code\"\
              : \"L\"\r\n\t\t\t\t}\r\n\t\t\t]\r\n\t\t}\r\n\t}\r\n]"
            - null
            - null
            - "false"
          - - Add License only (2 tests)
            - "{{agency}}/agency/license/WLI/{{createdAgentId}}"
            - PATCH
            - "[{\r\n\t\t\"type\": \"license\",\r\n\t\t\"action\": \"A\",\r\n\t\t\"\
              license\": {\r\n\t\t\t\"state\": {\r\n\t\t\t\t\"code\": \"IA\"\r\n\t\
              \t\t},\r\n\t\t\t\"residentOfStateIndicator\": \"N\",\r\n\t\t\t\"licenseStatus\"\
              : \"P\",\r\n\t\t\t\"approvalIndicator\": \"A\",\r\n\t\t\t\"lineOfAuthorityTypes\"\
              : [{\r\n\t\t\t\t\t\"code\": \"LAHVR\"\r\n\t\t\t\t}\r\n\t\t\t],\r\n\t\
              \t\t\"effectiveDate\": \"2016-02-01\",\r\n\t\t\t\"expirationDate\":\
              \ \"9999-99-99\",\r\n\t\t\t\"expirationReason\": \"\",\r\n\t\t\t\"licenseId\"\
              : \"12345\"\r\n\t\t}\r\n\t}\r\n]"
            - null
            - null
            - "false"
          - - Update Appointment - Set Expiry (2 tests)
            - "{{agency}}/agency/license/WLI/{{createdAgentId}}"
            - PATCH
            - "[{\r\n\t\t\"type\": \"appointment\",\r\n\t\t\"action\": \"U\",\r\n\t\
              \t\"appointment\": {\r\n\t\t\t\"state\": {\r\n\t\t\t\t\"code\": \"NE\"\
              \r\n\t\t\t},\r\n\t\t\t\"residentOfStateIndicator\": \"R\",\r\n\t\t\t\
              \"effectiveDate\": \"2015-01-01\",\r\n\t\t\t\"expirationDate\": \"2020-01-01\"\
              ,\r\n\t\t\t\"approvalIndicator\": \"V\",\r\n\t\t\t\"expirationReason\"\
              : \"\",\r\n\t\t\t\"lineOfAuthorityTypes\": [{\r\n\t\t\t\t\t\"code\"\
              : \"L\"\r\n\t\t\t\t}\r\n\t\t\t]\r\n\t\t}\r\n\t}\r\n]"
            - null
            - null
            - "false"
          - - Update License - Set Expiry (2 tests)
            - "{{agency}}/agency/license/WLI/{{createdAgentId}}"
            - PATCH
            - "[{\r\n\t\t\"type\": \"license\",\r\n\t\t\"action\": \"U\",\r\n\t\t\"\
              license\": {\r\n\t\t\t\"state\": {\r\n\t\t\t\t\"code\": \"NE\"\r\n\t\
              \t\t},\r\n\t\t\t\"residentOfStateIndicator\": \"R\",\r\n\t\t\t\"licenseStatus\"\
              : \"P\",\r\n\t\t\t\"approvalIndicator\": \"V\",\r\n\t\t\t\"lineOfAuthorityTypes\"\
              : [{\r\n\t\t\t\t\t\"code\": \"L\"\r\n\t\t\t\t}\r\n\t\t\t],\r\n\t\t\t\
              \"effectiveDate\": \"2015-01-01\",\r\n\t\t\t\"expirationDate\": \"2020-02-02\"\
              ,\r\n\t\t\t\"expirationReason\": \"\",\r\n\t\t\t\"licenseId\": \"7014\"\
              \r\n\t\t}\r\n\t}\r\n]"
            - null
            - null
            - "false"
          - - Agent - Name and SSN change (119 tests)
            - "{{agency}}/agency/producer/WLI/"
            - PUT
            - "{\r\n    \"company\": {\r\n        \"code\": \"WLI\"\r\n    },\r\n\
              \    \"producerId\": \"{{createdAgentId}}\",\r\n    \"niprNumber\":\
              \ \"777123\",\r\n    \"client\": {\r\n        \"clientId\": \"{{createdAgentId}}\"\
              ,\r\n        \"clientType\": {\r\n            \"code\": \"PERSON\",\r\
              \n            \"description\": \"Person\"\r\n        },\r\n        \"\
              governmentId\": \"{{ssn}}\",\r\n        \"emailAddress\": {\r\n    \
              \        \"emailAddressLine\": \"{{createdAgentId}}@woodmen.org\"\r\n\
              \        },\r\n        \"phones\": [\r\n            {\r\n          \
              \      \"phoneType\": {\r\n                    \"code\": \"WORK\",\r\
              \n                    \"description\": \"Agent Business Phone\"\r\n\
              \                },\r\n                \"phoneNumber\": \"402-555-1122\"\
              \r\n            },\r\n            {\r\n                \"phoneType\"\
              : {\r\n                    \"code\": \"MOBILE\",\r\n               \
              \     \"description\": \"Mobile\"\r\n                },\r\n        \
              \        \"phoneNumber\": \"402-555-3333\"\r\n            },\r\n   \
              \         {\r\n                \"phoneType\": {\r\n                \
              \    \"code\": \"FAX\",\r\n                    \"description\": \"Fax\"\
              \r\n                },\r\n                \"phoneNumber\": \"402-555-4444\"\
              \r\n            }\r\n        ],\r\n        \"birthDate\": \"{{dob}}\"\
              ,\r\n        \"firstName\": \"NewWriting\",\r\n        \"gender\": {\r\
              \n            \"code\": \"FEMALE\",\r\n            \"description\":\
              \ \"Female\"\r\n        },\r\n        \"lastName\": \"NewAgent\",\r\n\
              \        \"middleName\": \"Middle\",\r\n        \"namePrefix\": \"Mr\"\
              ,\r\n        \"nameSuffix\": \"II\",\r\n        \"preferredName\": \"\
              pref\"\r\n    },\r\n    \"hierarchies\": [\r\n        {\r\n        \
              \    \"effectiveDate\": \"2013-01-01\",\r\n            \"terminationDate\"\
              : \"9999-99-99\",\r\n            \"producerId\": \"{{createdAgentId}}\"\
              ,\r\n            \"areaManagerProducerId\": \"AGT260173\",\r\n     \
              \       \"regionManagerProducerId\": \"AGT260141\",\r\n            \"\
              salesRegionId\": \"REGION260\"\r\n        }\r\n    ],\r\n    \"contracts\"\
              : [\r\n        {\r\n            \"taxReportingIndicator\": \"Y\",\r\n\
              \            \"currentSituationStatus\": \"FT\",\r\n            \"maxAnnualizedPayment\"\
              : 4000,\r\n            \"annualizations\": []\r\n        }\r\n    ],\r\
              \n    \"licenses\": [],\r\n    \"appointments\": [],\r\n    \"contractStartDate\"\
              : \"2013-01-01\",\r\n    \"terminationDate\": \"0000-00-00\",\r\n  \
              \  \"addresses\": [\r\n        {\r\n            \"addressType\": {\r\
              \n                \"code\": \"ML\",\r\n                \"description\"\
              : \"Agent Business Address\"\r\n            },\r\n            \"line1\"\
              : \"1700 Farnam Street\",\r\n            \"line2\": \"\",\r\n      \
              \      \"line3\": \"\",\r\n            \"line4\": \"\",\r\n        \
              \    \"city\": \"Omaha\",\r\n            \"country\": {\r\n        \
              \        \"code\": \"USA\",\r\n                \"description\": \"United\
              \ States of America\"\r\n            },\r\n            \"state\": {\r\
              \n                \"code\": \"NE\"\r\n            },\r\n           \
              \ \"zip\": \"68102\",\r\n            \"addressCountyName\": \"\",\r\n\
              \            \"addressValidIndicator\": {\r\n                \"code\"\
              : \"0\",\r\n                \"description\": \"True\"\r\n          \
              \  }\r\n        }\r\n    ],\r\n    \"citizenship\": {\r\n        \"\
              code\": \"US\",\r\n        \"description\": \"United States of America\"\
              \r\n    },\r\n    \"compensationSchedules\": [\r\n        {\r\n    \
              \        \"compensationScheduleEffectiveDate\": \"2013-01-01\",\r\n\
              \            \"compensationScheduleTerminationDate\": \"9999-99-99\"\
              ,\r\n            \"producerContractType\": {\r\n                \"code\"\
              : \"ALPHA\",\r\n                \"description\": \"Alpha contract\"\r\
              \n            }\r\n        }\r\n    ]\r\n}"
            - null
            - null
            - "false"
          - - Agent - Name and SSN change 2nd time (119 tests)
            - "{{agency}}/agency/producer/WLI/"
            - PUT
            - "{\r\n    \"company\": {\r\n        \"code\": \"WLI\"\r\n    },\r\n\
              \    \"producerId\": \"{{createdAgentId}}\",\r\n    \"niprNumber\":\
              \ \"777123\",\r\n    \"client\": {\r\n        \"clientId\": \"{{createdAgentId}}\"\
              ,\r\n        \"clientType\": {\r\n            \"code\": \"PERSON\",\r\
              \n            \"description\": \"Person\"\r\n        },\r\n        \"\
              governmentId\": \"{{ssn}}\",\r\n        \"emailAddress\": {\r\n    \
              \        \"emailAddressLine\": \"{{createdAgentId}}@woodmen.org\"\r\n\
              \        },\r\n        \"phones\": [\r\n            {\r\n          \
              \      \"phoneType\": {\r\n                    \"code\": \"WORK\",\r\
              \n                    \"description\": \"Agent Business Phone\"\r\n\
              \                },\r\n                \"phoneNumber\": \"402-555-1122\"\
              \r\n            },\r\n            {\r\n                \"phoneType\"\
              : {\r\n                    \"code\": \"MOBILE\",\r\n               \
              \     \"description\": \"Mobile\"\r\n                },\r\n        \
              \        \"phoneNumber\": \"402-555-3333\"\r\n            },\r\n   \
              \         {\r\n                \"phoneType\": {\r\n                \
              \    \"code\": \"FAX\",\r\n                    \"description\": \"Fax\"\
              \r\n                },\r\n                \"phoneNumber\": \"402-555-4444\"\
              \r\n            }\r\n        ],\r\n        \"birthDate\": \"{{dob}}\"\
              ,\r\n        \"firstName\": \"NewWriting\",\r\n        \"gender\": {\r\
              \n            \"code\": \"FEMALE\",\r\n            \"description\":\
              \ \"Female\"\r\n        },\r\n        \"lastName\": \"NewAgent\",\r\n\
              \        \"middleName\": \"Middle\",\r\n        \"namePrefix\": \"Mr\"\
              ,\r\n        \"nameSuffix\": \"II\",\r\n        \"preferredName\": \"\
              pref\"\r\n    },\r\n    \"hierarchies\": [\r\n        {\r\n        \
              \    \"effectiveDate\": \"2013-01-01\",\r\n            \"terminationDate\"\
              : \"9999-99-99\",\r\n            \"producerId\": \"{{createdAgentId}}\"\
              ,\r\n            \"areaManagerProducerId\": \"AGT260173\",\r\n     \
              \       \"regionManagerProducerId\": \"AGT260141\",\r\n            \"\
              salesRegionId\": \"REGION260\"\r\n        }\r\n    ],\r\n    \"contracts\"\
              : [\r\n        {\r\n            \"taxReportingIndicator\": \"Y\",\r\n\
              \            \"currentSituationStatus\": \"FT\",\r\n            \"maxAnnualizedPayment\"\
              : 4000,\r\n            \"annualizations\": []\r\n        }\r\n    ],\r\
              \n    \"licenses\": [],\r\n    \"appointments\": [],\r\n    \"contractStartDate\"\
              : \"2013-01-01\",\r\n    \"terminationDate\": \"0000-00-00\",\r\n  \
              \  \"addresses\": [\r\n        {\r\n            \"addressType\": {\r\
              \n                \"code\": \"ML\",\r\n                \"description\"\
              : \"Agent Business Address\"\r\n            },\r\n            \"line1\"\
              : \"1700 Farnam Street\",\r\n            \"line2\": \"\",\r\n      \
              \      \"line3\": \"\",\r\n            \"line4\": \"\",\r\n        \
              \    \"city\": \"Omaha\",\r\n            \"country\": {\r\n        \
              \        \"code\": \"USA\",\r\n                \"description\": \"United\
              \ States of America\"\r\n            },\r\n            \"state\": {\r\
              \n                \"code\": \"NE\"\r\n            },\r\n           \
              \ \"zip\": \"68102\",\r\n            \"addressCountyName\": \"\",\r\n\
              \            \"addressValidIndicator\": {\r\n                \"code\"\
              : \"0\",\r\n                \"description\": \"True\"\r\n          \
              \  }\r\n        }\r\n    ],\r\n    \"citizenship\": {\r\n        \"\
              code\": \"US\",\r\n        \"description\": \"United States of America\"\
              \r\n    },\r\n    \"compensationSchedules\": [\r\n        {\r\n    \
              \        \"compensationScheduleEffectiveDate\": \"2013-01-01\",\r\n\
              \            \"compensationScheduleTerminationDate\": \"9999-99-99\"\
              ,\r\n            \"producerContractType\": {\r\n                \"code\"\
              : \"ALPHA\",\r\n                \"description\": \"Alpha contract\"\r\
              \n            }\r\n        }\r\n    ]\r\n}"
            - null
            - null
            - "false"
          - - Agent - DOB and Gender change (119 tests)
            - "{{agency}}/agency/producer/WLI/"
            - PUT
            - "{\r\n    \"company\": {\r\n        \"code\": \"WLI\"\r\n    },\r\n\
              \    \"producerId\": \"{{createdAgentId}}\",\r\n    \"niprNumber\":\
              \ \"777123\",\r\n    \"client\": {\r\n        \"clientId\": \"{{createdAgentId}}\"\
              ,\r\n        \"clientType\": {\r\n            \"code\": \"PERSON\",\r\
              \n            \"description\": \"Person\"\r\n        },\r\n        \"\
              governmentId\": \"{{ssn}}\",\r\n        \"emailAddress\": {\r\n    \
              \        \"emailAddressLine\": \"{{createdAgentId}}@woodmen.org\"\r\n\
              \        },\r\n        \"phones\": [\r\n            {\r\n          \
              \      \"phoneType\": {\r\n                    \"code\": \"WORK\",\r\
              \n                    \"description\": \"Agent Business Phone\"\r\n\
              \                },\r\n                \"phoneNumber\": \"402-555-1122\"\
              \r\n            },\r\n            {\r\n                \"phoneType\"\
              : {\r\n                    \"code\": \"MOBILE\",\r\n               \
              \     \"description\": \"Mobile\"\r\n                },\r\n        \
              \        \"phoneNumber\": \"402-555-3333\"\r\n            },\r\n   \
              \         {\r\n                \"phoneType\": {\r\n                \
              \    \"code\": \"FAX\",\r\n                    \"description\": \"Fax\"\
              \r\n                },\r\n                \"phoneNumber\": \"402-555-4444\"\
              \r\n            }\r\n        ],\r\n        \"birthDate\": \"{{dob}}\"\
              ,\r\n        \"firstName\": \"NewWriting\",\r\n        \"gender\": {\r\
              \n            \"code\": \"MALE\",\r\n            \"description\": \"\
              Male\"\r\n        },\r\n        \"lastName\": \"NewAgent\",\r\n    \
              \    \"middleName\": \"Middle\",\r\n        \"namePrefix\": \"Mr\",\r\
              \n        \"nameSuffix\": \"II\",\r\n        \"preferredName\": \"pref\"\
              \r\n    },\r\n    \"hierarchies\": [\r\n        {\r\n            \"\
              effectiveDate\": \"2013-01-01\",\r\n            \"terminationDate\"\
              : \"9999-99-99\",\r\n            \"producerId\": \"{{createdAgentId}}\"\
              ,\r\n            \"areaManagerProducerId\": \"AGT260173\",\r\n     \
              \       \"regionManagerProducerId\": \"AGT260141\",\r\n            \"\
              salesRegionId\": \"REGION260\"\r\n        }\r\n    ],\r\n    \"contracts\"\
              : [\r\n        {\r\n            \"taxReportingIndicator\": \"Y\",\r\n\
              \            \"currentSituationStatus\": \"FT\",\r\n            \"maxAnnualizedPayment\"\
              : 4000,\r\n            \"annualizations\": []\r\n        }\r\n    ],\r\
              \n    \"licenses\": [],\r\n    \"appointments\": [],\r\n    \"contractStartDate\"\
              : \"2013-01-01\",\r\n    \"terminationDate\": \"0000-00-00\",\r\n  \
              \  \"addresses\": [\r\n        {\r\n            \"addressType\": {\r\
              \n                \"code\": \"ML\",\r\n                \"description\"\
              : \"Agent Business Address\"\r\n            },\r\n            \"line1\"\
              : \"1700 Farnam Street\",\r\n            \"line2\": \"\",\r\n      \
              \      \"line3\": \"\",\r\n            \"line4\": \"\",\r\n        \
              \    \"city\": \"Omaha\",\r\n            \"country\": {\r\n        \
              \        \"code\": \"USA\",\r\n                \"description\": \"United\
              \ States of America\"\r\n            },\r\n            \"state\": {\r\
              \n                \"code\": \"NE\"\r\n            },\r\n           \
              \ \"zip\": \"68102\",\r\n            \"addressCountyName\": \"\",\r\n\
              \            \"addressValidIndicator\": {\r\n                \"code\"\
              : \"0\",\r\n                \"description\": \"True\"\r\n          \
              \  }\r\n        }\r\n    ],\r\n    \"citizenship\": {\r\n        \"\
              code\": \"US\",\r\n        \"description\": \"United States of America\"\
              \r\n    },\r\n    \"compensationSchedules\": [\r\n        {\r\n    \
              \        \"compensationScheduleEffectiveDate\": \"2013-01-01\",\r\n\
              \            \"compensationScheduleTerminationDate\": \"9999-99-99\"\
              ,\r\n            \"producerContractType\": {\r\n                \"code\"\
              : \"ALPHA\",\r\n                \"description\": \"Alpha contract\"\r\
              \n            }\r\n        }\r\n    ]\r\n}"
            - null
            - null
            - "false"
          - - Agent - DOB and Gender change 2nd time (119 tests)
            - "{{agency}}/agency/producer/WLI/"
            - PUT
            - "{\r\n    \"company\": {\r\n        \"code\": \"WLI\"\r\n    },\r\n\
              \    \"producerId\": \"{{createdAgentId}}\",\r\n    \"niprNumber\":\
              \ \"777123\",\r\n    \"client\": {\r\n        \"clientId\": \"{{createdAgentId}}\"\
              ,\r\n        \"clientType\": {\r\n            \"code\": \"PERSON\",\r\
              \n            \"description\": \"Person\"\r\n        },\r\n        \"\
              governmentId\": \"{{ssn}}\",\r\n        \"emailAddress\": {\r\n    \
              \        \"emailAddressLine\": \"{{createdAgentId}}@woodmen.org\"\r\n\
              \        },\r\n        \"phones\": [\r\n            {\r\n          \
              \      \"phoneType\": {\r\n                    \"code\": \"WORK\",\r\
              \n                    \"description\": \"Agent Business Phone\"\r\n\
              \                },\r\n                \"phoneNumber\": \"402-555-1122\"\
              \r\n            },\r\n            {\r\n                \"phoneType\"\
              : {\r\n                    \"code\": \"MOBILE\",\r\n               \
              \     \"description\": \"Mobile\"\r\n                },\r\n        \
              \        \"phoneNumber\": \"402-555-3333\"\r\n            },\r\n   \
              \         {\r\n                \"phoneType\": {\r\n                \
              \    \"code\": \"FAX\",\r\n                    \"description\": \"Fax\"\
              \r\n                },\r\n                \"phoneNumber\": \"402-555-4444\"\
              \r\n            }\r\n        ],\r\n        \"birthDate\": \"{{dob}}\"\
              ,\r\n        \"firstName\": \"NewWriting\",\r\n        \"gender\": {\r\
              \n            \"code\": \"MALE\",\r\n            \"description\": \"\
              Male\"\r\n        },\r\n        \"lastName\": \"NewAgent\",\r\n    \
              \    \"middleName\": \"Middle\",\r\n        \"namePrefix\": \"Mr\",\r\
              \n        \"nameSuffix\": \"II\",\r\n        \"preferredName\": \"pref\"\
              \r\n    },\r\n    \"hierarchies\": [\r\n        {\r\n            \"\
              effectiveDate\": \"2013-01-01\",\r\n            \"terminationDate\"\
              : \"9999-99-99\",\r\n            \"producerId\": \"{{createdAgentId}}\"\
              ,\r\n            \"areaManagerProducerId\": \"AGT260173\",\r\n     \
              \       \"regionManagerProducerId\": \"AGT260141\",\r\n            \"\
              salesRegionId\": \"REGION260\"\r\n        }\r\n    ],\r\n    \"contracts\"\
              : [\r\n        {\r\n            \"taxReportingIndicator\": \"Y\",\r\n\
              \            \"currentSituationStatus\": \"FT\",\r\n            \"maxAnnualizedPayment\"\
              : 4000,\r\n            \"annualizations\": []\r\n        }\r\n    ],\r\
              \n    \"licenses\": [],\r\n    \"appointments\": [],\r\n    \"contractStartDate\"\
              : \"2013-01-01\",\r\n    \"terminationDate\": \"0000-00-00\",\r\n  \
              \  \"addresses\": [\r\n        {\r\n            \"addressType\": {\r\
              \n                \"code\": \"ML\",\r\n                \"description\"\
              : \"Agent Business Address\"\r\n            },\r\n            \"line1\"\
              : \"1700 Farnam Street\",\r\n            \"line2\": \"\",\r\n      \
              \      \"line3\": \"\",\r\n            \"line4\": \"\",\r\n        \
              \    \"city\": \"Omaha\",\r\n            \"country\": {\r\n        \
              \        \"code\": \"USA\",\r\n                \"description\": \"United\
              \ States of America\"\r\n            },\r\n            \"state\": {\r\
              \n                \"code\": \"NE\"\r\n            },\r\n           \
              \ \"zip\": \"68102\",\r\n            \"addressCountyName\": \"\",\r\n\
              \            \"addressValidIndicator\": {\r\n                \"code\"\
              : \"0\",\r\n                \"description\": \"True\"\r\n          \
              \  }\r\n        }\r\n    ],\r\n    \"citizenship\": {\r\n        \"\
              code\": \"US\",\r\n        \"description\": \"United States of America\"\
              \r\n    },\r\n    \"compensationSchedules\": [\r\n        {\r\n    \
              \        \"compensationScheduleEffectiveDate\": \"2013-01-01\",\r\n\
              \            \"compensationScheduleTerminationDate\": \"9999-99-99\"\
              ,\r\n            \"producerContractType\": {\r\n                \"code\"\
              : \"ALPHA\",\r\n                \"description\": \"Alpha contract\"\r\
              \n            }\r\n        }\r\n    ]\r\n}"
            - null
            - null
            - "false"
          - - "Agent - Add FINRA date (123 tests, manual verify in TI)"
            - "{{agency}}/agency/producer/WLI/"
            - PUT
            - "{\r\n    \"company\": {\r\n        \"code\": \"WLI\"\r\n    },\r\n\
              \    \"producerId\": \"{{createdAgentId}}\",\r\n    \"niprNumber\":\
              \ \"777123\",\r\n    \"client\": {\r\n        \"clientId\": \"{{createdAgentId}}\"\
              ,\r\n        \"clientType\": {\r\n            \"code\": \"PERSON\",\r\
              \n            \"description\": \"Person\"\r\n        },\r\n        \"\
              governmentId\": \"{{ssn}}\",\r\n        \"emailAddress\": {\r\n    \
              \        \"emailAddressLine\": \"{{createdAgentId}}@woodmen.org\"\r\n\
              \        },\r\n        \"phones\": [\r\n            {\r\n          \
              \      \"phoneType\": {\r\n                    \"code\": \"WORK\",\r\
              \n                    \"description\": \"Agent Business Phone\"\r\n\
              \                },\r\n                \"phoneNumber\": \"402-555-1122\"\
              \r\n            },\r\n            {\r\n                \"phoneType\"\
              : {\r\n                    \"code\": \"MOBILE\",\r\n               \
              \     \"description\": \"Mobile\"\r\n                },\r\n        \
              \        \"phoneNumber\": \"402-555-3333\"\r\n            },\r\n   \
              \         {\r\n                \"phoneType\": {\r\n                \
              \    \"code\": \"FAX\",\r\n                    \"description\": \"Fax\"\
              \r\n                },\r\n                \"phoneNumber\": \"402-555-4444\"\
              \r\n            }\r\n        ],\r\n        \"birthDate\": \"{{dob}}\"\
              ,\r\n        \"firstName\": \"NewWriting\",\r\n        \"gender\": {\r\
              \n            \"code\": \"MALE\",\r\n            \"description\": \"\
              Male\"\r\n        },\r\n        \"lastName\": \"NewAgent\",\r\n    \
              \    \"middleName\": \"Middle\",\r\n        \"namePrefix\": \"Mr\",\r\
              \n        \"nameSuffix\": \"II\",\r\n        \"preferredName\": \"pref\"\
              \r\n    },\r\n    \"hierarchies\": [\r\n        {\r\n            \"\
              effectiveDate\": \"2013-01-01\",\r\n            \"terminationDate\"\
              : \"9999-99-99\",\r\n            \"producerId\": \"{{createdAgentId}}\"\
              ,\r\n            \"areaManagerProducerId\": \"AGT260173\",\r\n     \
              \       \"regionManagerProducerId\": \"AGT260141\",\r\n            \"\
              salesRegionId\": \"REGION260\"\r\n        }\r\n    ],\r\n    \"contracts\"\
              : [\r\n        {\r\n            \"taxReportingIndicator\": \"Y\",\r\n\
              \            \"currentSituationStatus\": \"FT\",\r\n            \"maxAnnualizedPayment\"\
              : 4000,\r\n            \"annualizations\": [],\r\n            \"finraDates\"\
              : [\r\n            \t{\r\n            \t\t\"finraEffectiveDate\": \"\
              2013-02-01\",\r\n            \t\t\"producerStatus\": \"A\"\r\n     \
              \       \t}\r\n            ]\r\n        }\r\n    ],\r\n    \"licenses\"\
              : [],\r\n    \"appointments\": [],\r\n    \"contractStartDate\": \"\
              2013-01-01\",\r\n    \"terminationDate\": \"0000-00-00\",\r\n    \"\
              addresses\": [\r\n        {\r\n            \"addressType\": {\r\n  \
              \              \"code\": \"ML\",\r\n                \"description\"\
              : \"Agent Business Address\"\r\n            },\r\n            \"line1\"\
              : \"1700 Farnam Street\",\r\n            \"line2\": \"\",\r\n      \
              \      \"line3\": \"\",\r\n            \"line4\": \"\",\r\n        \
              \    \"city\": \"Omaha\",\r\n            \"country\": {\r\n        \
              \        \"code\": \"USA\",\r\n                \"description\": \"United\
              \ States of America\"\r\n            },\r\n            \"state\": {\r\
              \n                \"code\": \"NE\"\r\n            },\r\n           \
              \ \"zip\": \"68102\",\r\n            \"addressCountyName\": \"\",\r\n\
              \            \"addressValidIndicator\": {\r\n                \"code\"\
              : \"0\",\r\n                \"description\": \"True\"\r\n          \
              \  }\r\n        }\r\n    ],\r\n    \"citizenship\": {\r\n        \"\
              code\": \"US\",\r\n        \"description\": \"United States of America\"\
              \r\n    },\r\n    \"compensationSchedules\": [\r\n        {\r\n    \
              \        \"compensationScheduleEffectiveDate\": \"2013-01-01\",\r\n\
              \            \"compensationScheduleTerminationDate\": \"9999-99-99\"\
              ,\r\n            \"producerContractType\": {\r\n                \"code\"\
              : \"ALPHA\",\r\n                \"description\": \"Alpha contract\"\r\
              \n            }\r\n        }\r\n    ]\r\n}"
            - null
            - null
            - "false"
          - - "Agent - Adding second annualization (123 tests, manual verify)"
            - "{{agency}}/agency/producer/WLI/"
            - PUT
            - "{\n    \"company\": {\n        \"code\": \"WLI\"\n    },\n    \"producerId\"\
              : \"{{createdAgentId}}\",\n    \"niprNumber\": \"777123\",\n    \"client\"\
              : {\n        \"clientId\": \"{{createdAgentId}}\",\n        \"clientType\"\
              : {\n            \"code\": \"PERSON\",\n            \"description\"\
              : \"Person\"\n        },\n        \"governmentId\": \"{{ssn}}\",\n \
              \       \"emailAddress\": {\n            \"emailAddressLine\": \"{{createdAgentId}}@woodmen.org\"\
              \n        },\n        \"phones\": [\n            {\n               \
              \ \"phoneType\": {\n                    \"code\": \"WORK\",\n      \
              \              \"description\": \"Agent Business Phone\"\n         \
              \       },\n                \"phoneNumber\": \"402-555-1122\"\n    \
              \        },\n            {\n                \"phoneType\": {\n     \
              \               \"code\": \"MOBILE\",\n                    \"description\"\
              : \"Mobile\"\n                },\n                \"phoneNumber\": \"\
              402-555-3333\"\n            },\n            {\n                \"phoneType\"\
              : {\n                    \"code\": \"FAX\",\n                    \"\
              description\": \"Fax\"\n                },\n                \"phoneNumber\"\
              : \"402-555-4444\"\n            }\n        ],\n        \"birthDate\"\
              : \"{{dob}}\",\n        \"firstName\": \"NewWriting\",\n        \"gender\"\
              : {\n            \"code\": \"MALE\",\n            \"description\": \"\
              Male\"\n        },\n        \"lastName\": \"NewAgent\",\n        \"\
              middleName\": \"Middle\",\n        \"namePrefix\": \"Mr\",\n       \
              \ \"nameSuffix\": \"II\",\n        \"preferredName\": \"pref\"\n   \
              \ },\n    \"hierarchies\": [\n        {\n            \"effectiveDate\"\
              : \"2013-01-01\",\n            \"terminationDate\": \"9999-99-99\",\n\
              \            \"producerId\": \"{{createdAgentId}}\",\n            \"\
              areaManagerProducerId\": \"AGT260173\",\n            \"regionManagerProducerId\"\
              : \"AGT260141\",\n            \"salesRegionId\": \"REGION260\"\n   \
              \     }\n    ],\n    \"contracts\": [\n        {\n            \"taxReportingIndicator\"\
              : \"Y\",\n            \"currentSituationStatus\": \"FT\",\n        \
              \    \"maxAnnualizedPayment\": 4000,\n            \"annualizations\"\
              \ : [{\n            \t\"annualizationPreferenceStartDate\":\"2014-02-01\"\
              ,\n            \t\"annualizationPreferenceExpirationDate\":\"\",\n \
              \           \t\"annualizationPreferenceAdvanceType\":\"B\",\n      \
              \      \t\"annualizationCapPercent\": 0.5000000\t\t\t\n            }],\n\
              \            \"finraDates\": [\n            \t{\n            \t\t\"\
              finraEffectiveDate\": \"2013-02-01\",\n            \t\t\"producerStatus\"\
              : \"A\"\n            \t}\n            ]\n        }\n    ],\n    \"licenses\"\
              : [],\n    \"appointments\": [],\n    \"contractStartDate\": \"2013-01-01\"\
              ,\n    \"terminationDate\": \"0000-00-00\",\n    \"addresses\": [\n\
              \        {\n            \"addressType\": {\n                \"code\"\
              : \"ML\",\n                \"description\": \"Agent Business Address\"\
              \n            },\n            \"line1\": \"1700 Farnam Street\",\n \
              \           \"line2\": \"\",\n            \"line3\": \"\",\n       \
              \     \"line4\": \"\",\n            \"city\": \"Omaha\",\n         \
              \   \"country\": {\n                \"code\": \"USA\",\n           \
              \     \"description\": \"United States of America\"\n            },\n\
              \            \"state\": {\n                \"code\": \"NE\"\n      \
              \      },\n            \"zip\": \"68102\",\n            \"addressCountyName\"\
              : \"\",\n            \"addressValidIndicator\": {\n                \"\
              code\": \"0\",\n                \"description\": \"True\"\n        \
              \    }\n        }\n    ],\n    \"citizenship\": {\n        \"code\"\
              : \"US\",\n        \"description\": \"United States of America\"\n \
              \   },\n    \"compensationSchedules\": [\n        {\n            \"\
              compensationScheduleEffectiveDate\": \"2013-01-01\",\n            \"\
              compensationScheduleTerminationDate\": \"9999-99-99\",\n           \
              \ \"producerContractType\": {\n                \"code\": \"ALPHA\",\n\
              \                \"description\": \"Alpha contract\"\n            }\n\
              \        }\n    ]\n}"
            - null
            - null
            - "false"
          - - "Agent - Delete FINRA date (119 tests, manual verify in TI)"
            - "{{agency}}/agency/producer/WLI/"
            - PUT
            - "{\n    \"company\": {\n        \"code\": \"WLI\"\n    },\n    \"producerId\"\
              : \"{{createdAgentId}}\",\n    \"niprNumber\": \"777123\",\n    \"client\"\
              : {\n        \"clientId\": \"{{createdAgentId}}\",\n        \"clientType\"\
              : {\n            \"code\": \"PERSON\",\n            \"description\"\
              : \"Person\"\n        },\n        \"governmentId\": \"{{ssn}}\",\n \
              \       \"emailAddress\": {\n            \"emailAddressLine\": \"{{createdAgentId}}@woodmen.org\"\
              \n        },\n        \"phones\": [\n            {\n               \
              \ \"phoneType\": {\n                    \"code\": \"WORK\",\n      \
              \              \"description\": \"Agent Business Phone\"\n         \
              \       },\n                \"phoneNumber\": \"402-555-1122\"\n    \
              \        },\n            {\n                \"phoneType\": {\n     \
              \               \"code\": \"MOBILE\",\n                    \"description\"\
              : \"Mobile\"\n                },\n                \"phoneNumber\": \"\
              402-555-3333\"\n            },\n            {\n                \"phoneType\"\
              : {\n                    \"code\": \"FAX\",\n                    \"\
              description\": \"Fax\"\n                },\n                \"phoneNumber\"\
              : \"402-555-4444\"\n            }\n        ],\n        \"birthDate\"\
              : \"{{dob}}\",\n        \"firstName\": \"NewWriting\",\n        \"gender\"\
              : {\n            \"code\": \"MALE\",\n            \"description\": \"\
              Male\"\n        },\n        \"lastName\": \"NewAgent\",\n        \"\
              middleName\": \"Middle\",\n        \"namePrefix\": \"Mr\",\n       \
              \ \"nameSuffix\": \"II\",\n        \"preferredName\": \"pref\"\n   \
              \ },\n    \"hierarchies\": [\n        {\n            \"effectiveDate\"\
              : \"2013-01-01\",\n            \"terminationDate\": \"9999-99-99\",\n\
              \            \"producerId\": \"{{createdAgentId}}\",\n            \"\
              areaManagerProducerId\": \"AGT260173\",\n            \"regionManagerProducerId\"\
              : \"AGT260141\",\n            \"salesRegionId\": \"REGION260\"\n   \
              \     }\n    ],\n    \"contracts\": [\n        {\n            \"taxReportingIndicator\"\
              : \"Y\",\n            \"currentSituationStatus\": \"FT\",\n        \
              \    \"maxAnnualizedPayment\": 4000,\n            \"annualizations\"\
              \ : [{\n            \t\"annualizationPreferenceStartDate\":\"2014-02-01\"\
              ,\n            \t\"annualizationPreferenceExpirationDate\":\"\",\n \
              \           \t\"annualizationPreferenceAdvanceType\":\"B\",\n      \
              \      \t\"annualizationCapPercent\": 0.5000000\t\t\t\n            }],\n\
              \            \"finraDates\": [\n            \t{\n            \t\t\"\
              finraEffectiveDate\": \"\",\n            \t\t\"producerStatus\": \"\"\
              \n            \t}\n            ]\n        }\n    ],\n    \"licenses\"\
              : [],\n    \"appointments\": [],\n    \"contractStartDate\": \"2013-01-01\"\
              ,\n    \"terminationDate\": \"0000-00-00\",\n    \"addresses\": [\n\
              \        {\n            \"addressType\": {\n                \"code\"\
              : \"ML\",\n                \"description\": \"Agent Business Address\"\
              \n            },\n            \"line1\": \"1700 Farnam Street\",\n \
              \           \"line2\": \"\",\n            \"line3\": \"\",\n       \
              \     \"line4\": \"\",\n            \"city\": \"Omaha\",\n         \
              \   \"country\": {\n                \"code\": \"USA\",\n           \
              \     \"description\": \"United States of America\"\n            },\n\
              \            \"state\": {\n                \"code\": \"NE\"\n      \
              \      },\n            \"zip\": \"68102\",\n            \"addressCountyName\"\
              : \"\",\n            \"addressValidIndicator\": {\n                \"\
              code\": \"0\",\n                \"description\": \"True\"\n        \
              \    }\n        }\n    ],\n    \"citizenship\": {\n        \"code\"\
              : \"US\",\n        \"description\": \"United States of America\"\n \
              \   },\n    \"compensationSchedules\": [\n        {\n            \"\
              compensationScheduleEffectiveDate\": \"2013-01-01\",\n            \"\
              compensationScheduleTerminationDate\": \"9999-99-99\",\n           \
              \ \"producerContractType\": {\n                \"code\": \"ALPHA\",\n\
              \                \"description\": \"Alpha contract\"\n            }\n\
              \        }\n    ]\n}"
            - null
            - null
            - "false"
          - - Agent - Changing Hierarchy and Comp Schedule (124 tests)
            - "{{agency}}/agency/producer/WLI/"
            - PUT
            - "{\n    \"company\": {\n        \"code\": \"WLI\"\n    },\n    \"producerId\"\
              : \"{{createdAgentId}}\",\n    \"niprNumber\": \"777123\",\n    \"client\"\
              : {\n        \"clientId\": \"{{createdAgentId}}\",\n        \"clientType\"\
              : {\n            \"code\": \"PERSON\",\n            \"description\"\
              : \"Person\"\n        },\n        \"governmentId\": \"{{ssn}}\",\n \
              \       \"emailAddress\": {\n            \"emailAddressLine\": \"{{createdAgentId}}@woodmen.org\"\
              \n        },\n        \"phones\": [\n            {\n               \
              \ \"phoneType\": {\n                    \"code\": \"WORK\",\n      \
              \              \"description\": \"Agent Business Phone\"\n         \
              \       },\n                \"phoneNumber\": \"402-555-1122\"\n    \
              \        },\n            {\n                \"phoneType\": {\n     \
              \               \"code\": \"MOBILE\",\n                    \"description\"\
              : \"Mobile\"\n                },\n                \"phoneNumber\": \"\
              402-555-3333\"\n            },\n            {\n                \"phoneType\"\
              : {\n                    \"code\": \"FAX\",\n                    \"\
              description\": \"Fax\"\n                },\n                \"phoneNumber\"\
              : \"402-555-4444\"\n            }\n        ],\n        \"birthDate\"\
              : \"{{dob}}\",\n        \"firstName\": \"NewWriting\",\n        \"gender\"\
              : {\n            \"code\": \"MALE\",\n            \"description\": \"\
              Male\"\n        },\n        \"lastName\": \"NewAgent\",\n        \"\
              middleName\": \"Middle\",\n        \"namePrefix\": \"Mr\",\n       \
              \ \"nameSuffix\": \"II\",\n        \"preferredName\": \"pref\"\n   \
              \ },\n    \"hierarchies\": [\n        {\n            \"effectiveDate\"\
              : \"2017-02-12\",\n            \"terminationDate\": \"\",\n        \
              \    \"producerId\": \"{{createdAgentId}}\",\n            \"areaManagerProducerId\"\
              : \"267778\",\n            \"regionManagerProducerId\": \"267779\",\n\
              \            \"salesRegionId\": \"000880\"\n        }\n    ],\n    \"\
              contracts\": [\n        {\n            \"taxReportingIndicator\": \"\
              Y\",\n            \"currentSituationStatus\": \"PT\",\n            \"\
              maxAnnualizedPayment\": 4000,\n            \"annualizations\" : [],\n\
              \            \"finraDates\": [\n            \t{\n            \t\t\"\
              finraEffectiveDate\": \"\",\n            \t\t\"producerStatus\": \"\"\
              \n            \t}\n            ]\n        }\n    ],\n    \"licenses\"\
              : [],\n    \"appointments\": [],\n    \"contractStartDate\": \"2013-01-01\"\
              ,\n    \"terminationDate\": \"0000-00-00\",\n    \"addresses\": [\n\
              \        {\n            \"addressType\": {\n                \"code\"\
              : \"ML\",\n                \"description\": \"Agent Business Address\"\
              \n            },\n            \"line1\": \"1700 Farnam Street\",\n \
              \           \"line2\": \"\",\n            \"line3\": \"\",\n       \
              \     \"line4\": \"\",\n            \"city\": \"Omaha\",\n         \
              \   \"country\": {\n                \"code\": \"USA\",\n           \
              \     \"description\": \"United States of America\"\n            },\n\
              \            \"state\": {\n                \"code\": \"NE\"\n      \
              \      },\n            \"zip\": \"68102\",\n            \"addressCountyName\"\
              : \"123\",\n            \"addressValidIndicator\": {\n             \
              \   \"code\": \"0\",\n                \"description\": \"True\"\n  \
              \          }\n        }\n    ],\n    \"citizenship\": {\n        \"\
              code\": \"US\",\n        \"description\": \"United States of America\"\
              \n    },\n    \"compensationSchedules\": [\n        {\n            \"\
              compensationScheduleEffectiveDate\": \"2013-01-01\",\n            \"\
              compensationScheduleTerminationDate\": \"2017-02-12\",\n           \
              \ \"producerContractType\": {\n                \"code\": \"ALPH\",\n\
              \                \"description\": \"Alpha contract\"\n            }\n\
              \        },\n                {\n            \"compensationScheduleEffectiveDate\"\
              : \"2017-02-12\",\n            \"compensationScheduleTerminationDate\"\
              : \"\",\n            \"producerContractType\": {\n                \"\
              code\": \"DELT\",\n                \"description\": \"Delta contract\"\
              \n            }\n        }\n    ]\n}"
            - null
            - null
            - "false"
          - - Agent - Ending Agents contract (124 tests)
            - "{{agency}}/agency/producer/WLI/"
            - PUT
            - "{\r\n    \"company\": {\r\n        \"code\": \"WLI\"\r\n    },\r\n\
              \    \"producerId\": \"{{createdAgentId}}\",\r\n    \"niprNumber\":\
              \ \"777123\",\r\n    \"client\": {\r\n        \"clientId\": \"{{createdAgentId}}\"\
              ,\r\n        \"clientType\": {\r\n            \"code\": \"PERSON\",\r\
              \n            \"description\": \"Person\"\r\n        },\r\n        \"\
              governmentId\": \"{{ssn}}\",\r\n        \"emailAddress\": {\r\n    \
              \        \"emailAddressLine\": \"{{createdAgentId}}@woodmen.org\"\r\n\
              \        },\r\n        \"phones\": [\r\n            {\r\n          \
              \      \"phoneType\": {\r\n                    \"code\": \"WORK\",\r\
              \n                    \"description\": \"Agent Business Phone\"\r\n\
              \                },\r\n                \"phoneNumber\": \"402-555-1122\"\
              \r\n            },\r\n            {\r\n                \"phoneType\"\
              : {\r\n                    \"code\": \"MOBILE\",\r\n               \
              \     \"description\": \"Mobile\"\r\n                },\r\n        \
              \        \"phoneNumber\": \"402-555-3333\"\r\n            },\r\n   \
              \         {\r\n                \"phoneType\": {\r\n                \
              \    \"code\": \"FAX\",\r\n                    \"description\": \"Fax\"\
              \r\n                },\r\n                \"phoneNumber\": \"402-555-4444\"\
              \r\n            }\r\n        ],\r\n        \"birthDate\": \"{{dob}}\"\
              ,\r\n        \"firstName\": \"NewWriting\",\r\n        \"gender\": {\r\
              \n            \"code\": \"MALE\",\r\n            \"description\": \"\
              Male\"\r\n        },\r\n        \"lastName\": \"NewAgent\",\r\n    \
              \    \"middleName\": \"Middle\",\r\n        \"namePrefix\": \"Mr\",\r\
              \n        \"nameSuffix\": \"II\",\r\n        \"preferredName\": \"pref\"\
              \r\n    },\r\n    \"hierarchies\": [\r\n        {\r\n            \"\
              effectiveDate\": \"2017-02-12\",\r\n            \"terminationDate\"\
              : \"2018-02-02\",\r\n            \"producerId\": \"{{createdAgentId}}\"\
              ,\r\n            \"areaManagerProducerId\": \"267778\",\r\n        \
              \    \"regionManagerProducerId\": \"267779\",\r\n            \"salesRegionId\"\
              : \"000880\"\r\n        }\r\n    ],\r\n    \"contracts\": [\r\n    \
              \    {\r\n        \t\"yearsOfService\": 6,\r\n        \t\"vestedType\"\
              : \"\",\r\n            \"taxReportingIndicator\": \"Y\",\r\n       \
              \     \"currentSituationStatus\": \"PT\",\r\n            \"maxAnnualizedPayment\"\
              : 4000,\r\n            \"annualizations\" : [],\r\n            \"finraDates\"\
              : [\r\n            \t{\r\n            \t\t\"finraEffectiveDate\": \"\
              \",\r\n            \t\t\"producerStatus\": \"\"\r\n            \t}\r\
              \n            ]\r\n        }\r\n    ],\r\n    \"licenses\": [],\r\n\
              \    \"appointments\": [],\r\n    \"contractStartDate\": \"2013-01-01\"\
              ,\r\n    \"terminationDate\": \"2018-02-02\",\r\n    \"addresses\":\
              \ [\r\n        {\r\n            \"addressType\": {\r\n             \
              \   \"code\": \"ML\",\r\n                \"description\": \"Agent Business\
              \ Address\"\r\n            },\r\n            \"line1\": \"1700 Farnam\
              \ Street\",\r\n            \"line2\": \"\",\r\n            \"line3\"\
              : \"\",\r\n            \"line4\": \"\",\r\n            \"city\": \"\
              Omaha\",\r\n            \"country\": {\r\n                \"code\":\
              \ \"USA\",\r\n                \"description\": \"United States of America\"\
              \r\n            },\r\n            \"state\": {\r\n                \"\
              code\": \"NE\"\r\n            },\r\n            \"zip\": \"68102\",\r\
              \n            \"addressCountyName\": \"123\",\r\n            \"addressValidIndicator\"\
              : {\r\n                \"code\": \"0\",\r\n                \"description\"\
              : \"True\"\r\n            }\r\n        }\r\n    ],\r\n    \"citizenship\"\
              : {\r\n        \"code\": \"US\",\r\n        \"description\": \"United\
              \ States of America\"\r\n    },\r\n    \"compensationSchedules\": [\r\
              \n        {\r\n            \"compensationScheduleEffectiveDate\": \"\
              2013-01-01\",\r\n            \"compensationScheduleTerminationDate\"\
              : \"2017-02-12\",\r\n            \"producerContractType\": {\r\n   \
              \             \"code\": \"ALPH\",\r\n                \"description\"\
              : \"Alpha contract\"\r\n            }\r\n        },\r\n            \
              \    {\r\n            \"compensationScheduleEffectiveDate\": \"2017-02-12\"\
              ,\r\n            \"compensationScheduleTerminationDate\": \"2018-02-02\"\
              ,\r\n            \"producerContractType\": {\r\n                \"code\"\
              : \"DELT\",\r\n                \"description\": \"Delta contract\"\r\
              \n            }\r\n        }\r\n    ]\r\n}"
            - null
            - null
            - "false"
        writingMode: 3
      name: TestCases
      useAllRows: true
    runMode: 1
    tests:
    - $type: HTTPClientToolTest
      name: Messaging Client 3
      testID: 52
      tool:
        $type: HTTPClient
        dataSourceNames:
        - Postman Collection
        iconName: HTTPClient
        name: Full Message
        formJson:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :root
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              attributes:
              - replacedColumn: ""
                value:
                  $type: StringValue
                  replacedColumn: ""
                  value: object
                  xmlEncoding: 2
                useValue: true
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
          elementTypeName: root
        hasServiceInfo: true
        serviceInfo:
          serviceDescriptor:
            $type: StandardServiceDescriptor
            location: ""
        jsonBuilder:
          hasValue: true
          value:
            $type: JSONObjectValue
            nameIsNull: true
        formInput:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: ":"
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
        jmsMessageOutputProvider:
          $type: JMSMessageOutputProvider
          jmsOutputProviderRequest:
            $type: JMSOutputProvider
            name: Request Object
            menuName: Object
          jmsOutputProviderResponse:
            $type: JMSOutputProvider
            name: Response Message Object
            menuName: Message Object
        transportProperties:
          manager:
            protocol: 10
            properties:
            - $type: HTTPClientHTTPProperties
              followRedirects:
                bool: true
              common:
                auth:
                  useDefault: false
                  customType: 1
                method:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: POST
              keepAlive1_1:
                bool: true
            - $type: HTTPClientHTTPProperties
              followRedirects:
                bool: true
              common:
                auth:
                  useDefault: false
                  customType: 1
                method:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: POST
              protocol: 1
              keepAlive1_1:
                bool: true
            - $type: JNDIProperties
              msgExpiration:
                $type: JMSMessageExpiration
              bytesMessageReadMethod:
                string: readUTF()
              responseCorrelation:
                correlationId:
                  name: JMSCorrelationID
                  value:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: StringTestValue
                messageSelector: ""
              queueProperties:
                jmsDestination:
                  name: JMSDestination
                  value:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: StringTestValue
                      value: JMS_RequestQueue
                jmsReplyTo:
                  name: JMSReplyTo
                  value:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: StringTestValue
                      value: JMS_ResponseQueue
              msgType:
                string: javax.jms.TextMessage
              useP2P:
                bool: true
              connProperties:
                jmsFactory:
                  name: Connection Factory
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: MQ_JMS_MANAGER
                jndiFactory:
                  name: Initial Context
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: com.sun.jndi.fscontext.RefFSContextFactory
                providerURL:
                  name: Provider URL
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: file:/C:/JNDI-Directory
                auth:
                  service:
                    name: Service
                    value:
                      fixedValue:
                        $type: StringTestValue
                  username:
                    name: Username
                    value:
                      fixedValue:
                        $type: StringTestValue
                  password:
                    name: Password
                    value:
                      fixedValue:
                        $type: PasswordTestValue
              useSync: true
            - $type: SonicMQJNDIProperties
              msgExpiration:
                $type: JMSMessageExpiration
              bytesMessageReadMethod:
                string: readUTF()
              responseCorrelation:
                correlationId:
                  name: JMSCorrelationID
                  value:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: StringTestValue
                messageSelector: ""
              queueProperties:
                jmsDestination:
                  name: JMSDestination
                  value:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: StringTestValue
                      value: JMS_RequestQueue
                jmsReplyTo:
                  name: JMSReplyTo
                  value:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: StringTestValue
                      value: JMS_ResponseQueue
              msgType:
                string: progress.message.jclient.MultipartMessage
              useP2P:
                bool: true
              connProperties:
                initialContextProps:
                - name: java.naming.security.credentials
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: Administrator
                - name: java.naming.security.principal
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: Administrator
                jmsFactory:
                  name: Connection Factory
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: ConnectionFactory
                jndiFactory:
                  name: Initial Context
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: com.sonicsw.jndi.mfcontext.MFContextFactory
                providerURL:
                  name: Provider URL
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: "tcp://[hostname]:2506"
                auth:
                  service:
                    name: Service
                    value:
                      fixedValue:
                        $type: StringTestValue
                  username:
                    name: Username
                    value:
                      fixedValue:
                        $type: StringTestValue
                        value: Administrator
                  password:
                    name: Password
                    value:
                      fixedValue:
                        $type: PasswordTestValue
              useSync: true
              partContentID:
                string: part1
            - $type: MQProperties
              mqrfh2fields:
                version:
                  name: Version
                  value:
                    fixedValue:
                      $type: StringTestValue
                encoding:
                  name: Encoding
                  value:
                    fixedValue:
                      $type: StringTestValue
                codedCharSetId:
                  name: CodedCharSetId
                  value:
                    fixedValue:
                      $type: StringTestValue
                format:
                  name: Format
                  value:
                    fixedValue:
                      $type: StringTestValue
                flags:
                  name: Flags
                  value:
                    fixedValue:
                      $type: StringTestValue
                nameValueCodedCharSetId:
                  name: NameValueCodedCharSetId
                  value:
                    fixedValue:
                      $type: StringTestValue
              mcd:
                msd:
                  name: Message Service Domain
                  value:
                    fixedValue:
                      $type: StringTestValue
                set:
                  name: Message Set
                  value:
                    fixedValue:
                      $type: StringTestValue
                type:
                  name: Message Type
                  value:
                    fixedValue:
                      $type: StringTestValue
                fmt:
                  name: Output Format
                  value:
                    fixedValue:
                      $type: StringTestValue
              psc:
                subIdentity:
                  name: SubIdentity
                  value:
                    fixedValue:
                      $type: StringTestValue
                qName:
                  name: QName
                  value:
                    fixedValue:
                      $type: StringTestValue
                qMgrName:
                  name: QMgrName
                  value:
                    fixedValue:
                      $type: StringTestValue
                subPoint:
                  name: SubPoint
                  value:
                    fixedValue:
                      $type: StringTestValue
                filter:
                  name: Filter
                  value:
                    fixedValue:
                      $type: StringTestValue
                subName:
                  name: SubName
                  value:
                    fixedValue:
                      $type: StringTestValue
                subUserData:
                  name: SubUserData
                  value:
                    fixedValue:
                      $type: StringTestValue
              jms:
                destination:
                  name: Destination
                  value:
                    fixedValue:
                      $type: StringTestValue
                replyTo:
                  name: Reply To
                  value:
                    fixedValue:
                      $type: StringTestValue
                timestamp:
                  name: Timestamp
                  value:
                    fixedValue:
                      $type: StringTestValue
                expiration:
                  name: Expiration
                  value:
                    fixedValue:
                      $type: StringTestValue
                correlationId:
                  name: Correlation Id
                  value:
                    fixedValue:
                      $type: StringTestValue
                priority:
                  name: Priority
                  value:
                    fixedValue:
                      $type: StringTestValue
                deliveryMode:
                  name: Delivery Mode
                  value:
                    fixedValue:
                      $type: StringTestValue
              mqQueueManager:
                ccsid:
                  name: CCSID
                  value:
                    fixedValue:
                      $type: StringTestValue
              mqSSL:
                peerName:
                  name: Peer Name
                  value:
                    fixedValue:
                      $type: StringTestValue
                cipherSuite:
                  $type: EnumNameValuePair
                  name: CipherSuite
                  value:
                    fixedValue:
                      $type: StringTestValue
              conn:
                keepAliveConnection: false
                putManagerId:
                  name: Put Manager Id
                  value:
                    fixedValue:
                      $type: StringTestValue
                getManagerId:
                  name: Get Manager Id
                  value:
                    fixedValue:
                      $type: StringTestValue
                channel:
                  name: Channel
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: CHANNEL1
                host:
                  name: Host
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: host
                port:
                  name: Port
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: 1414
                manager:
                  name: Queue Manager
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: queue.manager.1
                putQueue:
                  name: Put Queue
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: PutQueue
                getQueue:
                  name: Get Queue
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: GetQueue
                auth:
                  service:
                    name: Service
                    value:
                      fixedValue:
                        $type: StringTestValue
                  username:
                    name: Username
                    value:
                      fixedValue:
                        $type: StringTestValue
                  password:
                    name: Password
                    value:
                      fixedValue:
                        $type: PasswordTestValue
              mqpmMisc:
                applicationIdData:
                  name: Application ID data
                  value:
                    fixedValue:
                      $type: StringTestValue
                correlationID:
                  name: Correlation ID
                  value:
                    fixedValue:
                      $type: StringTestValue
                expiry:
                  name: Expiry (in tenths of a second)
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: -1
                messageSequenceNumber:
                  name: Message sequence number
                  value:
                    fixedValue:
                      $type: StringTestValue
                replyToQueueManagerName:
                  name: Reply queue manager name
                  value:
                    fixedValue:
                      $type: StringTestValue
                replyToQueueName:
                  name: Reply queue name
                  value:
                    fixedValue:
                      $type: StringTestValue
                putApplicationName:
                  name: Put application name
                  value:
                    fixedValue:
                      $type: StringTestValue
                applicationOriginData:
                  name: Originating application data
                  value:
                    fixedValue:
                      $type: StringTestValue
                userId:
                  name: User ID
                  value:
                    fixedValue:
                      $type: StringTestValue
              mqgmMisc:
                correlationID:
                  name: Correlation Id
                  value:
                    fixedValue:
                      $type: StringTestValue
                waitInterval:
                  name: Wait Interval(in milliseconds)
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: -1
            - $type: RMIProperties
              hostName:
                name: Host
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: Host
              portNumber:
                name: Port
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: Port
              bindingName:
                name: Binding
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: Binding
              remoteInterface:
                name: Remote Interface
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: Remote Interface
              methodName:
                name: Method Name
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: Method Name
            - $type: SMTPConnectionProperties
              port:
                name: Port
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: 25
              host:
                name: SMTP Host
                value:
                  fixedValue:
                    $type: StringTestValue
              user:
                name: Username
                value:
                  fixedValue:
                    $type: StringTestValue
              pass:
                name: Password
                value:
                  fixedValue:
                    $type: PasswordTestValue
                    password: AwAAAAA=
              fromEmail:
                name: From Email
                value:
                  fixedValue:
                    $type: StringTestValue
              toEmail:
                name: To Email
                value:
                  fixedValue:
                    $type: StringTestValue
              subject:
                name: Subject
                value:
                  fixedValue:
                    $type: StringTestValue
            - $type: TIBCOProperties
              timeLimit:
                name: Time Limit
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: 0
              service:
                name: ""
                value:
                  fixedValue:
                    $type: StringTestValue
              network:
                name: ""
                value:
                  fixedValue:
                    $type: StringTestValue
              daemon:
                name: DAEMON
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: DAEMON
              sendSubject:
                name: Send Subject
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: Send Subject
              replySubject:
                name: Reply Field Name
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: Reply Field Name
              sendFieldName:
                name: Send Field Name
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: Send Field Name
              replyFieldName:
                name: Reply Field Name
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: Reply Field Name
            - $type: NoneTransportProperties
            - $type: CustomTransportProperties
              selected: 0
              configs:
              - $type: CustomTransportConfigurationImpl
                ConfigClassName: com.parasoft.soavirt.transport.socket.SocketTransport
                values:
                  customValueMap:
                  - charset
                  - $type: MultiValueCustomValue
                  - eof
                  - $type: MultiValueCustomValue
                  - host
                  - $type: MultiValueCustomValue
                  - port
                  - $type: MultiValueCustomValue
                className: com.parasoft.soavirt.transport.socket.SocketTransport
                name: TCP/IP Socket
          messageExchangePattern:
            inverted: true
        outputProviders:
          requestHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Request Transport Header
          responseHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Response Transport Header
          xmlRequestOutput:
            $type: NamedXMLToolOutputProvider
            outputTools:
            - $type: GenericDataBank
              dataSourceNames:
              - TestCases
              iconName: XMLDataBank
              name: JSON Data Bank
              wrappedTool:
                $type: XMLtoDataSource
                dataSourceNames:
                - TestCases
                iconName: XMLDataBank
                name: XML Data Bank
                selectedXPaths:
                - elementOption: 1
                  contentOption: 1
                  XMLDataBank_ExtractXPath: "/root//item[name=\"${TestSuites: A}\"\
                    ]/item[1]/item[position() < count(//item[name=\"${TestSuites:\
                    \ A}\"]/item[1]/item)+1]/name[../request]/text()"
                  mode: 1
                - elementOption: 1
                  contentOption: 1
                  XMLDataBank_ExtractXPath: "for $i in (1 to count(//item[name=\"\
                    ${TestSuites: A}\"]/item[1]/item[request]))\r\nreturn\r\nif(exists(//item[name=\"\
                    ${TestSuites: A}\"]/item[1]/item[$i]/request[1]/url[1]/raw[1]/text()))\r\
                    \nthen //item[name=\"${TestSuites: A}\"]/item[1]/item[$i]/request[1]/url[1]/raw[1]/text()\r\
                    \nelse //item[name=\"${TestSuites: A}\"]/item[1]/item[$i]/request[1]/url[1]/text()"
                  mode: 1
                - elementOption: 1
                  contentOption: 1
                  XMLDataBank_ExtractXPath: "/root//item[name=\"${TestSuites: A}\"\
                    ]/item[1]/item[position() < count(//item[name=\"${TestSuites:\
                    \ A}\"]/item[1]/item)+1]/request[1]/method[1]/text()"
                  mode: 1
                - elementOption: 1
                  contentOption: 1
                  XMLDataBank_ExtractXPath: "for $index in (1 to count(//item[name=\"\
                    ${TestSuites: A}\"]/item[1]/item[request]))\r\nreturn\r\n(if(exists(//item[name=\"\
                    ${TestSuites: A}\"]/item[1]/item[$index]/request[1]/body[1]/raw[1]))\r\
                    \nthen\r\n\t//item[name=\"${TestSuites: A}\"]/item[1]/item[$index]/request[1]/body[1]/raw[1]/text()\r\
                    \nelse if(exists(//item[name=\"${TestSuites: A}\"]/item[1]/item[$index]/request[1]/body[1]/urlencoded[1]))\r\
                    \nthen\r\n\t\"urlencoded\"\r\nelse\r\n\t\"\")"
                  mode: 1
                - elementOption: 1
                  contentOption: 1
                  XMLDataBank_ExtractXPath: "for $index in (1 to count(//item[name=\"\
                    ${TestSuites: A}\"]/item[1]/item[request]))\r\nreturn\r\nif (exists(//item[name=\"\
                    ${TestSuites: A}\"]/item[1]/item[$index]/request[1]/auth[1]/basic[1]/username[1]/text()))\r\
                    \nthen //item[name=\"${TestSuites: A}\"]/item[1]/item[$index]/request[1]/auth[1]/basic[1]/username[1]/text()\r\
                    \nelse\r\n\"\""
                  mode: 1
                - elementOption: 1
                  contentOption: 1
                  XMLDataBank_ExtractXPath: "for $index in (1 to count(//item[name=\"\
                    ${TestSuites: A}\"]/item[1]/item[request]))\r\nreturn\r\nif (exists(//item[name=\"\
                    ${TestSuites: A}\"]/item[1]/item[$index]/request[1]/auth[1]/basic[1]/password[1]/text()))\r\
                    \nthen //item[name=\"${TestSuites: A}\"]/item[1]/item[$index]/request[1]/auth[1]/basic[1]/password[1]/text()\r\
                    \nelse\r\n\"\""
                  mode: 1
                - elementOption: 1
                  contentOption: 1
                  XMLDataBank_ExtractXPath: "for $index in (1 to count(//item[name=\"\
                    ${TestSuites: A}\"]/item[1]/item[request]))\r\nreturn\r\nif (exists(//item[name=\"\
                    ${TestSuites: A}\"]/item[1]/item[$index]/request[1]/auth[1]/type/text()))\r\
                    \nthen //item[name=\"${TestSuites: A}\"]/item[1]/item[$index]/request[1]/auth[1]/type/text()\r\
                    \nelse\r\n\"\""
                  mode: 1
                - elementOption: 1
                  contentOption: 1
                  XMLDataBank_ExtractXPath: "for $index in (1 to count(//item[name=\"\
                    ${TestSuites: A}\"]/item[1]/item[request]))\r\nreturn\r\nif (exists(//item[name=\"\
                    ${TestSuites: A}\"]/item[1]/item[$index]/request[1]/auth[1]/digest[1]/username[1]/text()))\r\
                    \nthen //item[name=\"${TestSuites: A}\"]/item[1]/item[$index]/request[1]/auth[1]/digest[1]/username[1]/text()\r\
                    \nelse\r\n\"\""
                  mode: 1
                - elementOption: 1
                  contentOption: 1
                  XMLDataBank_ExtractXPath: "for $index in (1 to count(//item[name=\"\
                    ${TestSuites: A}\"]/item[1]/item[request]))\r\nreturn\r\nif (exists(//item[name=\"\
                    ${TestSuites: A}\"]/item[1]/item[$index]/request[1]/auth[1]/digest[1]/username[1]/text()))\r\
                    \nthen //item[name=\"${TestSuites: A}\"]/item[1]/item[$index]/request[1]/auth[1]/digest[1]/username[1]/text()\r\
                    \nelse\r\n\"\""
                  mode: 1
                - elementOption: 1
                  contentOption: 1
                  XMLDataBank_ExtractXPath: "for $index in (1 to count(//item[name=\"\
                    ${TestSuites: A}\"]/item[1]/item[request]))\r\nreturn\r\nif(exists(//item[name=\"\
                    ${TestSuites: A}\"]/item[1]/item[$index]/request[1]/auth[1]/type[1]/text())\
                    \ and //item[name=\"${TestSuites: A}\"]/item[1]/item[$index]/request[1]/auth[1]/type[1]/text()=\"\
                    basic\")\r\nthen \"true\"\r\nelse \"false\""
                  mode: 1
                - elementOption: 1
                  contentOption: 1
                  XMLDataBank_ExtractXPath: "//item[name=\"${TestSuites: A}\" and\
                    \ ./item]/../../name/text()"
                  mode: 1
                extractMissingElements: true
                extractEmptyElements: true
                canonicalizeOutput: true
                xmlMessage: true
                virtualDSCreator:
                  writableColumns:
                  - dataSourceNames:
                    - "TestCases: Name"
                    testVariableName: x
                    mode: 2
                    customName: "Test 1: name"
                  - dataSourceNames:
                    - "TestCases: Endpoint"
                    testVariableName: x
                    mode: 2
                    customName: "Test 1: url"
                  - dataSourceNames:
                    - "TestCases: Method"
                    testVariableName: x
                    mode: 2
                    customName: Method
                  - dataSourceNames:
                    - "TestCases: Body"
                    testVariableName: x
                    mode: 2
                    customName: "Test 1: header"
                  - dataSourceNames:
                    - "TestCases: Basic_User"
                    testVariableName: x
                    mode: 2
                    customName: "Test 1: header"
                  - dataSourceNames:
                    - "TestCases: Basic_Pass"
                    testVariableName: x
                    mode: 2
                    customName: "Test 1: type"
                  - dataSourceNames:
                    - "TestCases: Auth_Type"
                    testVariableName: x
                    mode: 2
                    customName: "Test 1: type"
                  - dataSourceNames:
                    - "TestCases: Digest_User"
                    testVariableName: x
                    mode: 2
                    customName: "Test 1: username"
                  - dataSourceNames:
                    - "TestCases: Digest_Pass"
                    testVariableName: x
                    mode: 2
                    customName: "Test 1: password"
                  - dataSourceNames:
                    - "TestCases: Auth_Enabled"
                    testVariableName: x
                    mode: 2
                    customName: "Test 1: item[1]"
                  - dataSourceNames:
                    - "ChildFolders: A"
                    testVariableName: ParentFolderName
                    mode: 3
                    customName: ParentFolderName
              conversionStrategy:
                dataFormatName: JSON
                conversionStrategyId: JSON
                conversionStrategyClassName: com.parasoft.xml.convert.json.JsonConversionStrategy
            menuName: Traffic
            name: Request Traffic
          trafficOutput:
            m_name: Traffic Stream
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Traffic Viewer
              showRequestHeaders: true
              showResponseHeaders: true
            name: Traffic Object
        literal:
          use: 1
          text:
            MessagingClient_LiteralMessage: "${fullMessage}"
            type: text/json
          dataSource:
            columnName: File Contents
        mode: Literal
    - $type: RESTClientToolTest
      name: REST Client
      testID: 24
      tool:
        $type: RESTClient
        dataSourceNames:
        - TestSuites
        iconName: RESTClient
        name: Create Test Suites
        outputTools:
        - $type: GenericDataBank
          dataSourceNames:
          - Postman Collection
          iconName: XMLDataBank
          name: JSON Data Bank
          wrappedTool:
            $type: XMLtoDataSource
            dataSourceNames:
            - Postman Collection
            iconName: XMLDataBank
            name: XML Data Bank
            selectedXPaths:
            - elementOption: 1
              contentOption: 1
              XMLDataBank_ExtractXPath: /root/id/text()
              mode: 1
            canonicalizeOutput: true
            xmlMessage: true
            virtualDSCreator:
              writableColumns:
              - dataSourceNames:
                - "TestCases: C"
                testVariableName: x
                customName: TestSuiteName
          conversionStrategy:
            dataFormatName: JSON
            conversionStrategyId: JSON
            conversionStrategyClassName: com.parasoft.xml.convert.json.JsonConversionStrategy
        formJson:
          builtFromSchema: true
          value:
            $type: ElementValue
            writeType: true
            type:
              $type: ElementType
              localName: root
              bodyType:
                $type: ComplexType
                attributes:
                - ns: ""
                  name: type
                  defaultValue: object
                  fixed: object
                  contentType:
                    $type: StringType
                  required: true
                name: /components/schemas/testSuitesRequest
                compositor: true
                compositorObj:
                  $type: AllCompositor
                  types:
                  - $type: ElementType
                    localName: parent
                    bodyType:
                      $type: ComplexType
                      attributes:
                      - ns: ""
                        name: type
                        defaultValue: object
                        fixed: object
                        contentType:
                          $type: StringType
                          _id: 1
                        required: true
                      name: /components/schemas/parent
                      compositor: true
                      compositorObj:
                        $type: AllCompositor
                        types:
                        - $type: ElementType
                          minOccurs: 0
                          localName: id
                          bodyType:
                            $type: ComplexType
                            _id: 2
                            attributes:
                            - ns: ""
                              name: type
                              defaultValue: string
                              fixed: string
                              contentType:
                                $type: StringType
                                _ref: 1
                              required: true
                            content: true
                            contentObj:
                              $type: StringType
                              _ref: 1
                            namespace: urn:parasoft:json
                            name: string
                            compositor: true
                            compositorObj:
                              $type: SequenceCompositor
                  - $type: ElementType
                    minOccurs: 0
                    localName: name
                    bodyType:
                      $type: ComplexType
                      _ref: 2
                  - $type: ElementType
                    minOccurs: 0
                    localName: disabled
                    bodyType:
                      $type: ComplexType
                      _id: 3
                      attributes:
                      - ns: ""
                        name: type
                        defaultValue: boolean
                        fixed: boolean
                        contentType:
                          $type: StringType
                          _ref: 1
                        required: true
                      content: true
                      contentObj:
                        $type: BooleanType
                      namespace: urn:parasoft:json
                      name: boolean
                      compositor: true
                      compositorObj:
                        $type: SequenceCompositor
                  - $type: ElementType
                    minOccurs: 0
                    localName: requirementsAndNotes
                    bodyType:
                      $type: ComplexType
                      attributes:
                      - ns: ""
                        name: type
                        defaultValue: object
                        fixed: object
                        contentType:
                          $type: StringType
                          _ref: 1
                        required: true
                      name: /components/schemas/requirementsAndNotes
                      compositor: true
                      compositorObj:
                        $type: AllCompositor
                        types:
                        - $type: ElementType
                          minOccurs: 0
                          localName: notes
                          bodyType:
                            $type: ComplexType
                            _ref: 2
                  - $type: ElementType
                    minOccurs: 0
                    localName: variables
                    bodyType:
                      $type: ComplexType
                      attributes:
                      - ns: ""
                        name: type
                        defaultValue: array
                        fixed: array
                        contentType:
                          $type: StringType
                          _ref: 1
                        required: true
                      name: /components/schemas/testSuitesRequest/properties/variables
                      compositor: true
                      compositorObj:
                        $type: SequenceCompositor
                        types:
                        - $type: ElementType
                          minOccurs: 0
                          maxOccurs: -1
                          localName: item
                          bodyType:
                            $type: ComplexType
                            attributes:
                            - ns: ""
                              name: type
                              defaultValue: object
                              fixed: object
                              contentType:
                                $type: StringType
                                _ref: 1
                              required: true
                            name: /components/schemas/testSuiteVariable
                            compositor: true
                            compositorObj:
                              $type: AllCompositor
                              types:
                              - $type: ElementType
                                localName: name
                                bodyType:
                                  $type: ComplexType
                                  _ref: 2
                              - $type: ElementType
                                minOccurs: 0
                                localName: type
                                bodyType:
                                  $type: ComplexType
                                  attributes:
                                  - ns: ""
                                    name: type
                                    defaultValue: enum
                                    fixed: enum
                                    contentType:
                                      $type: StringType
                                      _ref: 1
                                    required: true
                                  content: true
                                  contentObj:
                                    $type: EnumType
                                    values:
                                    - '"BOOLEAN"'
                                    - '"INTEGER"'
                                    - '"STRING"'
                                    - '"DATA_SOURCE"'
                                    baseType: anonymous
                                  name: /components/schemas/variableType
                                  compositor: true
                                  compositorObj:
                                    $type: SequenceCompositor
                              - $type: ElementType
                                localName: useValueFromParentSuite
                                bodyType:
                                  $type: ComplexType
                                  _ref: 3
                              - $type: ElementType
                                minOccurs: 0
                                localName: booleanValue
                                bodyType:
                                  $type: ComplexType
                                  _ref: 3
                              - $type: ElementType
                                minOccurs: 0
                                localName: integerValue
                                bodyType:
                                  $type: ComplexType
                                  attributes:
                                  - ns: ""
                                    name: type
                                    defaultValue: number
                                    fixed: number
                                    contentType:
                                      $type: StringType
                                      _ref: 1
                                    required: true
                                  content: true
                                  contentObj:
                                    $type: BigIntegerType
                                  namespace: urn:parasoft:json
                                  name: number
                                  compositor: true
                                  compositorObj:
                                    $type: SequenceCompositor
                              - $type: ElementType
                                minOccurs: 0
                                localName: stringValue
                                bodyType:
                                  $type: ComplexType
                                  _ref: 2
                              - $type: ElementType
                                minOccurs: 0
                                localName: dataSourceValue
                                bodyType:
                                  $type: ComplexType
                                  attributes:
                                  - ns: ""
                                    name: type
                                    defaultValue: object
                                    fixed: object
                                    contentType:
                                      $type: StringType
                                      _ref: 1
                                    required: true
                                  name: /components/schemas/dataSourceType
                                  compositor: true
                                  compositorObj:
                                    $type: AllCompositor
                                    types:
                                    - $type: ElementType
                                      minOccurs: 0
                                      localName: dataSourceName
                                      bodyType:
                                        $type: ComplexType
                                        _ref: 2
                                    - $type: ElementType
                                      minOccurs: 0
                                      localName: columnName
                                      bodyType:
                                        $type: ComplexType
                                        _ref: 2
                                    - $type: ElementType
                                      minOccurs: 0
                                      localName: value
                                      bodyType:
                                        $type: ComplexType
                                        _ref: 2
                  - $type: ElementType
                    minOccurs: 0
                    localName: executionOptions
                    bodyType:
                      $type: ComplexType
                      attributes:
                      - ns: ""
                        name: type
                        defaultValue: object
                        fixed: object
                        contentType:
                          $type: StringType
                          _ref: 1
                        required: true
                      name: /components/schemas/executionOptionsRequest
                      compositor: true
                      compositorObj:
                        $type: AllCompositor
                        types:
                        - $type: ElementType
                          minOccurs: 0
                          localName: testExecution
                          bodyType:
                            $type: ComplexType
                            attributes:
                            - ns: ""
                              name: type
                              defaultValue: object
                              fixed: object
                              contentType:
                                $type: StringType
                                _ref: 1
                              required: true
                            name: /components/schemas/testExecution
                            compositor: true
                            compositorObj:
                              $type: AllCompositor
                              types:
                              - $type: ElementType
                                minOccurs: 0
                                localName: executionMode
                                bodyType:
                                  $type: ComplexType
                                  attributes:
                                  - ns: ""
                                    name: type
                                    defaultValue: enum
                                    fixed: enum
                                    contentType:
                                      $type: StringType
                                      _ref: 1
                                    required: true
                                  content: true
                                  contentObj:
                                    $type: EnumType
                                    values:
                                    - '"TESTS_RUN_SEQUENTIALLY"'
                                    - '"TESTS_RUN_CONCURRENTLY"'
                                    baseType: anonymous
                                  name: /components/schemas/executionMode
                                  compositor: true
                                  compositorObj:
                                    $type: SequenceCompositor
                  - $type: ElementType
                    minOccurs: 0
                    localName: referenced
                    bodyType:
                      $type: ComplexType
                      _ref: 3
                  - $type: ElementType
                    minOccurs: 0
                    localName: referenceLocation
                    bodyType:
                      $type: ComplexType
                      attributes:
                      - ns: ""
                        name: type
                        defaultValue: object
                        fixed: object
                        contentType:
                          $type: StringType
                          _ref: 1
                        required: true
                      name: /components/schemas/fileLocation
                      compositor: true
                      compositorObj:
                        $type: AllCompositor
                        types:
                        - $type: ElementType
                          minOccurs: 0
                          localName: external
                          bodyType:
                            $type: ComplexType
                            _ref: 2
                        - $type: ElementType
                          minOccurs: 0
                          localName: id
                          bodyType:
                            $type: ComplexType
                            _ref: 2
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              attributes:
              - replacedColumn: ""
                value:
                  $type: StringValue
                  replacedColumn: ""
                  value: object
                  xmlEncoding: 2
                useValue: true
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
                    values:
                    - $type: ElementValue
                      replacedColumn: ""
                      values:
                      - $type: ComplexValue
                        replacedColumn: ""
                        attributes:
                        - replacedColumn: ""
                          value:
                            $type: StringValue
                            replacedColumn: ""
                            value: object
                            xmlEncoding: 2
                          useValue: true
                        compositorValue: true
                        compositorValueObj:
                          replacedColumn: ""
                          values:
                            $type: CompositorValueSetCollectionSet
                            set:
                            - $type: CompositorValueSet
                              values:
                              - $type: ElementValue
                                replacedColumn: ""
                                values:
                                - $type: ComplexValue
                                  replacedColumn: ""
                                  allowArrayExclude: true
                                  attributes:
                                  - replacedColumn: ""
                                    value:
                                      $type: StringValue
                                      replacedColumn: ""
                                      value: string
                                      xmlEncoding: 2
                                    useValue: true
                                  contentValue: true
                                  contentValueObj:
                                    $type: StringValue
                                    replacedColumn: ""
                                    mode: 3
                                    columnName: TopTestSuiteID
                                    value: /TestAssets/AgencyOnly.tst/Test Suite
                                    xmlEncoding: 2
                                  compositorValue: true
                                  compositorValueObj:
                                    replacedColumn: ""
                                    values:
                                      $type: CompositorValueSetCollectionSet
                                      set:
                                      - $type: CompositorValueSet
                    - $type: ElementValue
                      replacedColumn: ""
                      values:
                      - $type: ComplexValue
                        replacedColumn: ""
                        allowArrayExclude: true
                        attributes:
                        - replacedColumn: ""
                          value:
                            $type: StringValue
                            replacedColumn: ""
                            value: string
                            xmlEncoding: 2
                          useValue: true
                        contentValue: true
                        contentValueObj:
                          $type: StringValue
                          replacedColumn: ""
                          mode: 3
                          columnName: "TestSuites: A"
                          value: "Agency (1,157) - Using direct tests Copy"
                          xmlEncoding: 2
                        compositorValue: true
                        compositorValueObj:
                          replacedColumn: ""
                          values:
                            $type: CompositorValueSetCollectionSet
                            set:
                            - $type: CompositorValueSet
                    - $type: ElementValue
                      replacedColumn: ""
                    - $type: ElementValue
                      replacedColumn: ""
                    - $type: ElementValue
                      replacedColumn: ""
                    - $type: ElementValue
                      replacedColumn: ""
                    - $type: ElementValue
                      replacedColumn: ""
                    - $type: ElementValue
                      replacedColumn: ""
          elementTypeName: root
        hasServiceInfo: true
        serviceInfo:
          serviceDescriptor:
            $type: StandardServiceDescriptor
            location: http://ulvbdparas01.rei.com:9080/soavirt/api/v6
        jsonBuilder:
          hasValue: true
          value:
            $type: JSONObjectValue
            nameIsNull: true
        schemaURL:
          MessagingClient_SchemaLocation: "${HOST}:${PORT}/soavirt/api/v6"
        formInput:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: ":"
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
        jmsMessageOutputProvider:
          $type: JMSMessageOutputProvider
          jmsOutputProviderRequest:
            $type: JMSOutputProvider
            name: Request Object
            menuName: Object
          jmsOutputProviderResponse:
            $type: JMSOutputProvider
            name: Response Message Object
            menuName: Message Object
        transportProperties:
          manager:
            properties:
            - $type: HTTPClientHTTPProperties
              followRedirects:
                bool: true
              common:
                auth:
                  useDefault: false
                  authName: Basic
                method:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: GET
              keepAlive1_1:
                bool: true
            - $type: HTTPClientHTTPProperties
              followRedirects:
                bool: true
              common:
                auth:
                  useDefault: false
                  authName: Basic
                method:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: GET
              protocol: 1
              keepAlive1_1:
                bool: true
            - $type: NoneTransportProperties
          messageExchangePattern:
            inverted: true
        outputProviders:
          requestHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Request Transport Header
          responseHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Response Transport Header
          xmlRequestOutput:
            $type: NamedXMLToolOutputProvider
            menuName: Traffic
            name: Request Traffic
          trafficOutput:
            m_name: Traffic Stream
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Traffic Viewer
              showRequestHeaders: true
              showResponseHeaders: true
            name: Traffic Object
        literal:
          use: 1
          text:
            MessagingClient_LiteralMessage: "{\"parent\":{\"id\":\"${TopTestSuiteID}\"\
              },\"name\":\"${TestSuites: A}\"}"
            type: application/json
          dataSource:
            columnName: File Contents
        mode: Form JSON
        literalQuery:
          isPropertiesRef: true
        resourceMethod:
          resourceId: /v6/suites/testSuites
          httpMethod: POST
        resourceMode: 3
        baseUrl:
          values:
          - $type: ScriptedValue
          - $type: WadlTestValue
            value: http://localhost:9080/soavirt/api
          fixedValue:
            $type: StringTestValue
          selectedIndex: 1
    - $type: TestSuite
      name: Create Test Cases
      testID: 27
      testLogicVariables:
      - $type: TestLogicString
        name: header
        value:
          $type: TestLogicVariableString
          originalValue: ""
          value: ""
      - $type: TestLogicString
        name: testCaseName
        value:
          $type: TestLogicVariableString
          originalValue: 0
          value: 0
      - $type: TestLogicString
        name: body
        value:
          $type: TestLogicVariableString
          originalValue: 0
          value: 0
      - $type: TestLogicString
        name: testSuiteName
        value:
          $type: TestLogicVariableString
          originalValue: 0
          value: 0
      runMode: 1
      tests:
      - $type: ToolTest
        name: Extension Tool
        testID: 142
        tool:
          $type: MethodTool
          dataSourceNames:
          - Postman Collection
          iconName: Method
          name: Extension Tool
          method:
            hasCode: true
            code:
              $type: ScriptCode
              input:
                useText: true
                textInput:
                  $type: ScriptingTextInput
                  text: "import com.parasoft.api.*;\r\n\r\npublic void checkTestName(Object\
                    \ input, ExtensionToolContext context)\r\n{\r\n\tString name =\
                    \ context.getValue(\"TestCases\",\"Name\");\r\n\tif(name != \"\
                    \")\r\n\t{\r\n\t\tcontext.setValue(\"testCaseName\",\"1\");\r\n\
                    \t}\r\n\tArrayList suites = context.getValues(\"TestSuites\",\"\
                    A\");\r\n\t\r\n\tcontext.setValue(\"testSuiteName\",suites.get(Integer.parseInt(context.getValue(\"\
                    y\"))-1));\r\n}"
            hasMethodId: true
            methodId:
              $type: ScriptMethodIdentifier
              functionName: checkTestName
              arguments:
              - java.lang.Object
              - com.parasoft.api.ExtensionToolContext
        writeInput: true
        inputType: InputUsable
        input:
          use: 1
          text:
            text: ""
            type: text/plain
      - $type: HTTPClientToolTest
        name: Messaging Client 3
        testFlowLogic:
          variableCondition:
            variableCondition: true
            variableConditionObj:
              $type: StringCondition
              name: testCaseName
              condition: 1
              value: 0
        testID: 66
        tool:
          $type: HTTPClient
          dataSourceNames:
          - Postman Collection
          iconName: HTTPClient
          name: Full Message
          formJson:
            value:
              $type: ElementValue
              writeType: true
              type:
                $type: ElementType
                localName: root
                bodyType:
                  $type: ComplexType
                  attributes:
                  - ns: ""
                    name: type
                    fixed: object
                    contentType:
                      $type: StringType
                    required: true
                  name: rootType
                  compositor: true
                  compositorObj:
                    $type: AllCompositor
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                attributes:
                - replacedColumn: ""
                  value:
                    $type: StringValue
                    replacedColumn: ""
                    value: object
                    xmlEncoding: 2
                  useValue: true
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
            elementTypeName: root
          hasServiceInfo: true
          serviceInfo:
            serviceDescriptor:
              $type: StandardServiceDescriptor
              location: ""
          jsonBuilder:
            hasValue: true
            value:
              $type: JSONObjectValue
              nameIsNull: true
          formInput:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: ":"
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
          jmsMessageOutputProvider:
            $type: JMSMessageOutputProvider
            jmsOutputProviderRequest:
              $type: JMSOutputProvider
              name: Request Object
              menuName: Object
            jmsOutputProviderResponse:
              $type: JMSOutputProvider
              name: Response Message Object
              menuName: Message Object
          transportProperties:
            manager:
              protocol: 10
              properties:
              - $type: HTTPClientHTTPProperties
                followRedirects:
                  bool: true
                common:
                  auth:
                    useDefault: false
                    customType: 1
                  method:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: HTTPMethodTestValue
                      method: POST
                keepAlive1_1:
                  bool: true
              - $type: HTTPClientHTTPProperties
                followRedirects:
                  bool: true
                common:
                  auth:
                    useDefault: false
                    customType: 1
                  method:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: HTTPMethodTestValue
                      method: POST
                protocol: 1
                keepAlive1_1:
                  bool: true
              - $type: JNDIProperties
                msgExpiration:
                  $type: JMSMessageExpiration
                bytesMessageReadMethod:
                  string: readUTF()
                responseCorrelation:
                  correlationId:
                    name: JMSCorrelationID
                    value:
                      values:
                      - $type: ScriptedValue
                      fixedValue:
                        $type: StringTestValue
                  messageSelector: ""
                queueProperties:
                  jmsDestination:
                    name: JMSDestination
                    value:
                      values:
                      - $type: ScriptedValue
                      fixedValue:
                        $type: StringTestValue
                        value: JMS_RequestQueue
                  jmsReplyTo:
                    name: JMSReplyTo
                    value:
                      values:
                      - $type: ScriptedValue
                      fixedValue:
                        $type: StringTestValue
                        value: JMS_ResponseQueue
                msgType:
                  string: javax.jms.TextMessage
                useP2P:
                  bool: true
                connProperties:
                  jmsFactory:
                    name: Connection Factory
                    value:
                      fixedValue:
                        $type: StringTestValue
                        value: MQ_JMS_MANAGER
                  jndiFactory:
                    name: Initial Context
                    value:
                      fixedValue:
                        $type: StringTestValue
                        value: com.sun.jndi.fscontext.RefFSContextFactory
                  providerURL:
                    name: Provider URL
                    value:
                      fixedValue:
                        $type: StringTestValue
                        value: file:/C:/JNDI-Directory
                  auth:
                    service:
                      name: Service
                      value:
                        fixedValue:
                          $type: StringTestValue
                    username:
                      name: Username
                      value:
                        fixedValue:
                          $type: StringTestValue
                    password:
                      name: Password
                      value:
                        fixedValue:
                          $type: PasswordTestValue
                useSync: true
              - $type: SonicMQJNDIProperties
                msgExpiration:
                  $type: JMSMessageExpiration
                bytesMessageReadMethod:
                  string: readUTF()
                responseCorrelation:
                  correlationId:
                    name: JMSCorrelationID
                    value:
                      values:
                      - $type: ScriptedValue
                      fixedValue:
                        $type: StringTestValue
                  messageSelector: ""
                queueProperties:
                  jmsDestination:
                    name: JMSDestination
                    value:
                      values:
                      - $type: ScriptedValue
                      fixedValue:
                        $type: StringTestValue
                        value: JMS_RequestQueue
                  jmsReplyTo:
                    name: JMSReplyTo
                    value:
                      values:
                      - $type: ScriptedValue
                      fixedValue:
                        $type: StringTestValue
                        value: JMS_ResponseQueue
                msgType:
                  string: progress.message.jclient.MultipartMessage
                useP2P:
                  bool: true
                connProperties:
                  initialContextProps:
                  - name: java.naming.security.credentials
                    value:
                      fixedValue:
                        $type: StringTestValue
                        value: Administrator
                  - name: java.naming.security.principal
                    value:
                      fixedValue:
                        $type: StringTestValue
                        value: Administrator
                  jmsFactory:
                    name: Connection Factory
                    value:
                      fixedValue:
                        $type: StringTestValue
                        value: ConnectionFactory
                  jndiFactory:
                    name: Initial Context
                    value:
                      fixedValue:
                        $type: StringTestValue
                        value: com.sonicsw.jndi.mfcontext.MFContextFactory
                  providerURL:
                    name: Provider URL
                    value:
                      fixedValue:
                        $type: StringTestValue
                        value: "tcp://[hostname]:2506"
                  auth:
                    service:
                      name: Service
                      value:
                        fixedValue:
                          $type: StringTestValue
                    username:
                      name: Username
                      value:
                        fixedValue:
                          $type: StringTestValue
                          value: Administrator
                    password:
                      name: Password
                      value:
                        fixedValue:
                          $type: PasswordTestValue
                useSync: true
                partContentID:
                  string: part1
              - $type: MQProperties
                mqrfh2fields:
                  version:
                    name: Version
                    value:
                      fixedValue:
                        $type: StringTestValue
                  encoding:
                    name: Encoding
                    value:
                      fixedValue:
                        $type: StringTestValue
                  codedCharSetId:
                    name: CodedCharSetId
                    value:
                      fixedValue:
                        $type: StringTestValue
                  format:
                    name: Format
                    value:
                      fixedValue:
                        $type: StringTestValue
                  flags:
                    name: Flags
                    value:
                      fixedValue:
                        $type: StringTestValue
                  nameValueCodedCharSetId:
                    name: NameValueCodedCharSetId
                    value:
                      fixedValue:
                        $type: StringTestValue
                mcd:
                  msd:
                    name: Message Service Domain
                    value:
                      fixedValue:
                        $type: StringTestValue
                  set:
                    name: Message Set
                    value:
                      fixedValue:
                        $type: StringTestValue
                  type:
                    name: Message Type
                    value:
                      fixedValue:
                        $type: StringTestValue
                  fmt:
                    name: Output Format
                    value:
                      fixedValue:
                        $type: StringTestValue
                psc:
                  subIdentity:
                    name: SubIdentity
                    value:
                      fixedValue:
                        $type: StringTestValue
                  qName:
                    name: QName
                    value:
                      fixedValue:
                        $type: StringTestValue
                  qMgrName:
                    name: QMgrName
                    value:
                      fixedValue:
                        $type: StringTestValue
                  subPoint:
                    name: SubPoint
                    value:
                      fixedValue:
                        $type: StringTestValue
                  filter:
                    name: Filter
                    value:
                      fixedValue:
                        $type: StringTestValue
                  subName:
                    name: SubName
                    value:
                      fixedValue:
                        $type: StringTestValue
                  subUserData:
                    name: SubUserData
                    value:
                      fixedValue:
                        $type: StringTestValue
                jms:
                  destination:
                    name: Destination
                    value:
                      fixedValue:
                        $type: StringTestValue
                  replyTo:
                    name: Reply To
                    value:
                      fixedValue:
                        $type: StringTestValue
                  timestamp:
                    name: Timestamp
                    value:
                      fixedValue:
                        $type: StringTestValue
                  expiration:
                    name: Expiration
                    value:
                      fixedValue:
                        $type: StringTestValue
                  correlationId:
                    name: Correlation Id
                    value:
                      fixedValue:
                        $type: StringTestValue
                  priority:
                    name: Priority
                    value:
                      fixedValue:
                        $type: StringTestValue
                  deliveryMode:
                    name: Delivery Mode
                    value:
                      fixedValue:
                        $type: StringTestValue
                mqQueueManager:
                  ccsid:
                    name: CCSID
                    value:
                      fixedValue:
                        $type: StringTestValue
                mqSSL:
                  peerName:
                    name: Peer Name
                    value:
                      fixedValue:
                        $type: StringTestValue
                  cipherSuite:
                    $type: EnumNameValuePair
                    name: CipherSuite
                    value:
                      fixedValue:
                        $type: StringTestValue
                conn:
                  keepAliveConnection: false
                  putManagerId:
                    name: Put Manager Id
                    value:
                      fixedValue:
                        $type: StringTestValue
                  getManagerId:
                    name: Get Manager Id
                    value:
                      fixedValue:
                        $type: StringTestValue
                  channel:
                    name: Channel
                    value:
                      fixedValue:
                        $type: StringTestValue
                        value: CHANNEL1
                  host:
                    name: Host
                    value:
                      fixedValue:
                        $type: StringTestValue
                        value: host
                  port:
                    name: Port
                    value:
                      fixedValue:
                        $type: StringTestValue
                        value: 1414
                  manager:
                    name: Queue Manager
                    value:
                      fixedValue:
                        $type: StringTestValue
                        value: queue.manager.1
                  putQueue:
                    name: Put Queue
                    value:
                      fixedValue:
                        $type: StringTestValue
                        value: PutQueue
                  getQueue:
                    name: Get Queue
                    value:
                      fixedValue:
                        $type: StringTestValue
                        value: GetQueue
                  auth:
                    service:
                      name: Service
                      value:
                        fixedValue:
                          $type: StringTestValue
                    username:
                      name: Username
                      value:
                        fixedValue:
                          $type: StringTestValue
                    password:
                      name: Password
                      value:
                        fixedValue:
                          $type: PasswordTestValue
                mqpmMisc:
                  applicationIdData:
                    name: Application ID data
                    value:
                      fixedValue:
                        $type: StringTestValue
                  correlationID:
                    name: Correlation ID
                    value:
                      fixedValue:
                        $type: StringTestValue
                  expiry:
                    name: Expiry (in tenths of a second)
                    value:
                      fixedValue:
                        $type: StringTestValue
                        value: -1
                  messageSequenceNumber:
                    name: Message sequence number
                    value:
                      fixedValue:
                        $type: StringTestValue
                  replyToQueueManagerName:
                    name: Reply queue manager name
                    value:
                      fixedValue:
                        $type: StringTestValue
                  replyToQueueName:
                    name: Reply queue name
                    value:
                      fixedValue:
                        $type: StringTestValue
                  putApplicationName:
                    name: Put application name
                    value:
                      fixedValue:
                        $type: StringTestValue
                  applicationOriginData:
                    name: Originating application data
                    value:
                      fixedValue:
                        $type: StringTestValue
                  userId:
                    name: User ID
                    value:
                      fixedValue:
                        $type: StringTestValue
                mqgmMisc:
                  correlationID:
                    name: Correlation Id
                    value:
                      fixedValue:
                        $type: StringTestValue
                  waitInterval:
                    name: Wait Interval(in milliseconds)
                    value:
                      fixedValue:
                        $type: StringTestValue
                        value: -1
              - $type: RMIProperties
                hostName:
                  name: Host
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: Host
                portNumber:
                  name: Port
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: Port
                bindingName:
                  name: Binding
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: Binding
                remoteInterface:
                  name: Remote Interface
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: Remote Interface
                methodName:
                  name: Method Name
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: Method Name
              - $type: SMTPConnectionProperties
                port:
                  name: Port
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: 25
                host:
                  name: SMTP Host
                  value:
                    fixedValue:
                      $type: StringTestValue
                user:
                  name: Username
                  value:
                    fixedValue:
                      $type: StringTestValue
                pass:
                  name: Password
                  value:
                    fixedValue:
                      $type: PasswordTestValue
                      password: AwAAAAA=
                fromEmail:
                  name: From Email
                  value:
                    fixedValue:
                      $type: StringTestValue
                toEmail:
                  name: To Email
                  value:
                    fixedValue:
                      $type: StringTestValue
                subject:
                  name: Subject
                  value:
                    fixedValue:
                      $type: StringTestValue
              - $type: TIBCOProperties
                timeLimit:
                  name: Time Limit
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: 0
                service:
                  name: ""
                  value:
                    fixedValue:
                      $type: StringTestValue
                network:
                  name: ""
                  value:
                    fixedValue:
                      $type: StringTestValue
                daemon:
                  name: DAEMON
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: DAEMON
                sendSubject:
                  name: Send Subject
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: Send Subject
                replySubject:
                  name: Reply Field Name
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: Reply Field Name
                sendFieldName:
                  name: Send Field Name
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: Send Field Name
                replyFieldName:
                  name: Reply Field Name
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: Reply Field Name
              - $type: NoneTransportProperties
              - $type: CustomTransportProperties
                selected: 0
                configs:
                - $type: CustomTransportConfigurationImpl
                  ConfigClassName: com.parasoft.soavirt.transport.socket.SocketTransport
                  values:
                    customValueMap:
                    - charset
                    - $type: MultiValueCustomValue
                    - eof
                    - $type: MultiValueCustomValue
                    - host
                    - $type: MultiValueCustomValue
                    - port
                    - $type: MultiValueCustomValue
                  className: com.parasoft.soavirt.transport.socket.SocketTransport
                  name: TCP/IP Socket
            messageExchangePattern:
              inverted: true
          outputProviders:
            requestHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Request Transport Header
            responseHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Response Transport Header
            xmlRequestOutput:
              $type: NamedXMLToolOutputProvider
              outputTools:
              - $type: GenericDataBank
                dataSourceNames:
                - TestCases
                iconName: XMLDataBank
                name: JSON Data Bank
                wrappedTool:
                  $type: XMLtoDataSource
                  dataSourceNames:
                  - TestCases
                  iconName: XMLDataBank
                  name: XML Data Bank
                  selectedXPaths:
                  - elementOption: 1
                    contentOption: 2
                    XMLDataBank_ExtractXPath: "//item[./name/text() = \"${testSuiteName}\"\
                      ]//item[./name/text() = \"${TestCases: Name}\"]/request[1]/header[1]/item[*]"
                    mode: 1
                  - elementOption: 1
                    contentOption: 1
                    XMLDataBank_ExtractXPath: "//item[./name/text() = \"${testSuiteName}\"\
                      ]//item[./name/text() = \"${TestCases: Name}\"]/request[1]/body[1]/urlencoded[1]"
                    mode: 1
                  - elementOption: 1
                    contentOption: 1
                    XMLDataBank_ExtractXPath: "//item[./name/text() = \"${testSuiteName}\"\
                      ]//item[./name/text() = \"${TestCases: Name}\"]/request[1]/auth[1]/bearer[1]/item[1]/value[1]/text()"
                    mode: 1
                  extractMissingElements: true
                  extractEmptyElements: true
                  canonicalizeOutput: true
                  xmlMessage: true
                  virtualDSCreator:
                    writableColumns:
                    - dataSourceNames:
                      - "TestCases: Basic_Enabled"
                      testVariableName: header
                      mode: 3
                      customName: headers
                    - dataSourceNames:
                      - "TestCases: Auth_Enabled"
                      testVariableName: ParentFolderName
                      customName: urlencoded
                    - dataSourceNames:
                      - "TestCases: Auth_Enabled"
                      testVariableName: ParentFolderName
                      customName: TokenName
                conversionStrategy:
                  dataFormatName: JSON
                  conversionStrategyId: JSON
                  conversionStrategyClassName: com.parasoft.xml.convert.json.JsonConversionStrategy
              menuName: Traffic
              name: Request Traffic
            trafficOutput:
              m_name: Traffic Stream
            objectOutput:
              $type: ObjectOutputProvider
              outputTools:
              - $type: TrafficViewer
                iconName: TrafficViewer
                name: Traffic Viewer
                showRequestHeaders: true
                showResponseHeaders: true
              name: Traffic Object
          literal:
            use: 1
            text:
              MessagingClient_LiteralMessage: "${fullMessage}"
              type: text/json
            dataSource:
              columnName: "TestCases: Auth_Enabled"
          mode: Literal
      - $type: ToolTest
        name: Extension Tool 3
        testFlowLogic:
          variableCondition:
            variableCondition: true
            variableConditionObj:
              $type: StringCondition
              name: testCaseName
              condition: 1
              value: 0
          dependencyLogic:
            success: 0
        testID: 68
        tool:
          $type: MethodTool
          dataSourceNames:
          - Postman Collection
          iconName: Method
          name: Extension Tool 3
          method:
            hasCode: true
            code:
              $type: ScriptCode
              input:
                useText: true
                textInput:
                  $type: ScriptingTextInput
                  text: "import com.parasoft.api.*;\r\n\r\npublic void fixHeaders(Object\
                    \ input, ExtensionToolContext context){\r\n\t// [{\"key\":\"my-sample-header\"\
                    ,\"value\":\"Lorem ipsum dolor sit amet\",\"description\":\"\"\
                    },{\"key\":\"my-sample-header2\",\"value\":\"some other Latin\
                    \ stuff\",\"description\":\"\"}]\r\n\t\r\n\tString header = context.getValue(\"\
                    header\");\r\n\tApplication.showMessage(\"These are the headers\
                    \ that we are pulling-\"+header);\r\n\tString body = context.getValue(\"\
                    TestCases\",\"Body\");\r\n\tif(!body.equals(\"urlencoded\"))\r\
                    \n\t{\r\n\t\tcontext.setValue(\"body\",body);\r\n\t}\r\n\telse\r\
                    \n\t{\r\n\t\tString newBody = context.getValue(\"Generated Data\
                    \ Source\",\"urlencoded\");\r\n\t\t//Application.showMessage(\"\
                    URL Encoded Body: \" + newBody);\r\n\t\t//StringTokenizer st =\
                    \ new StringTokenizer(newBody,\"},\");\r\n\t\tString[] list =\
                    \ newBody.split(\"\\\"}\")\r\n\t\tString create = \"\";\r\n\t\t\
                    for(int i=0; i < list.size(); i++)\r\n\t\t{\r\n\t\t\tString val\
                    \ = list[i];\r\n\t\t\t//Application.showMessage(val);\r\n\t\t\t\
                    if(val.equals(\"]\"))\r\n\t\t\t\tdoNothing();\r\n\t\t\telse\r\n\
                    \t\t\t{\r\n\t\t\t\tcreate += val.substring((val.indexOf(\"key\\\
                    \":\") + 6), val.indexOf(\"\\\",\\\"value\"));\r\n\t\t\t\tcreate\
                    \ += \"=\";\r\n\t\t\t\tcreate += val.substring((val.indexOf(\"\
                    value\\\":\") + 8), val.indexOf(\"\\\",\\\"type\"));\r\n\t\t\t\
                    \tif(i < list.size() - 2)\r\n\t\t\t\t\tcreate += \"&\";\r\n\t\t\
                    \t}\r\n\t\t}\r\n\r\n\t\tcontext.setValue(\"body\",create);\r\n\
                    \t}\r\n\t\r\n\tif(header.equals(\"0\")) return;\r\n\t\r\n\theader\
                    \ = header.replaceAll(\"\\\\[\",\"\");\r\n\theader = header.replaceAll(\"\
                    \\\\]\",\"\");\r\n\t\r\n\tApplication.showMessage(header);\r\n\
                    \tStringTokenizer st = new StringTokenizer(header,\"\\\\},\\\\\
                    {\");\r\n\theader = \"\";\r\n\twhile(st.hasMoreTokens())\r\n\t\
                    {\r\n\t\tString temp = st.nextToken();\r\n\t\t//Application.showMessage(\"\
                    This is the temp-\"+temp);\r\n\t\t//temp = temp.replaceAll(\"\\\
                    \"\",\"\");\r\n\t\t//Application.showMessage(\"This is the temp2-\"\
                    +temp);\r\n\t\tif (temp.contains(\"This is a duplicate header\
                    \ and will be overridden by the Authorization header generated\
                    \ by Postman.\"))\r\n\t\t\t//temp = st.nextToken();\r\n\t\t\t\
                    doNothing();\r\n\t\telse if(temp.contains(\"Authorization\"))\r\
                    \n\t\t{\r\n\t\t\ttemp = st.nextToken();\r\n\t\t\tif(temp.contains(\"\
                    OAuth\")){\r\n\t\t\t\ttemp = temp.replaceAll(\"\\\"\",\"\");\r\
                    \n\t\t\t\theader = header + \"Authorization: \" + temp.substring(temp.indexOf(\"\
                    :\") + 1) + \"\\n\";}\r\n\t\t}\r\n\t\telse if(temp.startsWith(\"\
                    \\\"key\")){\r\n\t\t\ttemp = temp.replaceAll(\"\\\"\",\"\");\r\
                    \n\t\t\theader = header + temp.substring(temp.indexOf(\":\") +\
                    \ 1) + \":\";}\r\n\t\telse if(temp.startsWith(\"\\\"value\")){\r\
                    \n\t\t\twhile (!temp.endsWith(\"\\\"\")){\r\n\t\t\t\t//Application.showMessage(\"\
                    Looping inside the endswith, before the string add-\"+ header);\r\
                    \n\t\t\t\ttemp = temp.replaceAll(\"\\\"\",\"\");\r\n\t\t\t\t//Application.showMessage(\"\
                    Adding Temp-\"+ temp);\r\n\t\t\t\theader = header + temp.substring(temp.indexOf(\"\
                    :\") + 1);\r\n\t\t\t\theader = header + \", \";\r\n\t\t\t\ttemp\
                    \ = st.nextToken();\r\n\t\t\t\t//Application.showMessage(\"Looping\
                    \ inside the endswith, after the string add-\"+ header);\r\n\t\
                    \t\t}\r\n\t\t\ttemp = temp.replaceAll(\"\\\"\",\"\");\r\n\t\t\t\
                    header = header + temp.substring(temp.indexOf(\":\") + 1) + \"\
                    \\n\";\r\n\t\t\t}\r\n\t\telse if(temp.startsWith(\"\\\"description\"\
                    ) ||temp.startsWith(\"\\\"warning\"))\r\n\t\t\tdoNothing();\r\n\
                    \t\t\t\r\n\t\t//Application.showMessage(header);\r\n\t}\r\n\t\
                    context.setValue(\"header\",header);\r\n}\r\n\r\npublic void doNothing()\r\
                    \n{\r\n\treturn;\r\n}"
            hasMethodId: true
            methodId:
              $type: ScriptMethodIdentifier
              functionName: fixHeaders
              arguments:
              - java.lang.Object
              - com.parasoft.api.ExtensionToolContext
        writeInput: true
        inputType: InputUsable
        input:
          use: 1
          text:
            text: ""
            type: text/plain
          dataSource:
            columnName: File Contents
      - $type: RESTClientToolTest
        name: Create Test Cases 3
        testFlowLogic:
          variableCondition:
            variableCondition: true
            variableConditionObj:
              $type: StringCondition
              name: testCaseName
              condition: 1
              value: 0
        testID: 75
        tool:
          $type: RESTClient
          dataSourceNames:
          - TestCases
          iconName: RESTClient
          name: Create Test Cases 3
          formJson:
            builtFromSchema: true
            value:
              $type: ElementValue
              writeType: true
              type:
                $type: ElementType
                localName: root
                bodyType:
                  $type: ComplexType
                  attributes:
                  - ns: ""
                    name: type
                    defaultValue: object
                    fixed: object
                    contentType:
                      $type: StringType
                    required: true
                  name: /components/schemas/restClientsRequest
                  compositor: true
                  compositorObj:
                    $type: AllCompositor
                    types:
                    - $type: ElementType
                      minOccurs: 0
                      localName: dataSource
                      bodyType:
                        $type: ComplexType
                        _id: 1
                        attributes:
                        - ns: ""
                          name: type
                          defaultValue: string
                          fixed: string
                          contentType:
                            $type: StringType
                            _id: 2
                          required: true
                        content: true
                        contentObj:
                          $type: StringType
                          _ref: 2
                        namespace: urn:parasoft:json
                        name: string
                        compositor: true
                        compositorObj:
                          $type: SequenceCompositor
                    - $type: ElementType
                      minOccurs: 0
                      localName: header
                      bodyType:
                        $type: ComplexType
                        attributes:
                        - ns: ""
                          name: type
                          defaultValue: object
                          fixed: object
                          contentType:
                            $type: StringType
                            _ref: 2
                          required: true
                        name: /components/schemas/header
                        compositor: true
                        compositorObj:
                          $type: AllCompositor
                          types:
                          - $type: ElementType
                            minOccurs: 0
                            localName: method
                            bodyType:
                              $type: ComplexType
                              attributes:
                              - ns: ""
                                name: type
                                defaultValue: object
                                fixed: object
                                contentType:
                                  $type: StringType
                                  _ref: 2
                                required: true
                              name: /components/schemas/restHttpMethod
                              compositor: true
                              compositorObj:
                                $type: AllCompositor
                                types:
                                - $type: ElementType
                                  minOccurs: 0
                                  localName: methodType
                                  bodyType:
                                    $type: ComplexType
                                    attributes:
                                    - ns: ""
                                      name: type
                                      defaultValue: enum
                                      fixed: enum
                                      contentType:
                                        $type: StringType
                                        _ref: 2
                                      required: true
                                    content: true
                                    contentObj:
                                      $type: EnumType
                                      values:
                                      - '"GET"'
                                      - '"POST"'
                                      - '"OPTIONS"'
                                      - '"HEAD"'
                                      - '"PUT"'
                                      - '"DELETE"'
                                      - '"TRACE"'
                                      - '"CUSTOM"'
                                      baseType: anonymous
                                    name: /components/schemas/methodType
                                    compositor: true
                                    compositorObj:
                                      $type: SequenceCompositor
                                - $type: ElementType
                                  minOccurs: 0
                                  localName: value
                                  bodyType:
                                    $type: ComplexType
                                    _ref: 1
                    - $type: ElementType
                      minOccurs: 0
                      localName: httpOptions
                      bodyType:
                        $type: ComplexType
                        attributes:
                        - ns: ""
                          name: type
                          defaultValue: object
                          fixed: object
                          contentType:
                            $type: StringType
                            _ref: 2
                          required: true
                        name: /components/schemas/httpOptions
                        compositor: true
                        compositorObj:
                          $type: AllCompositor
                          types:
                          - $type: ElementType
                            localName: transport
                            bodyType:
                              $type: ComplexType
                              attributes:
                              - ns: ""
                                name: type
                                defaultValue: object
                                fixed: object
                                contentType:
                                  $type: StringType
                                  _ref: 2
                                required: true
                              name: /components/schemas/restTransport
                              compositor: true
                              compositorObj:
                                $type: AllCompositor
                                types:
                                - $type: ElementType
                                  minOccurs: 0
                                  localName: type
                                  bodyType:
                                    $type: ComplexType
                                    attributes:
                                    - ns: ""
                                      name: type
                                      defaultValue: enum
                                      fixed: enum
                                      contentType:
                                        $type: StringType
                                        _ref: 2
                                      required: true
                                    content: true
                                    contentObj:
                                      $type: EnumType
                                      values:
                                      - '"http10"'
                                      - '"http11"'
                                      - '"none"'
                                      baseType: anonymous
                                    name: /components/schemas/restTransportType
                                    compositor: true
                                    compositorObj:
                                      $type: SequenceCompositor
                                - $type: ElementType
                                  minOccurs: 0
                                  localName: http10
                                  bodyType:
                                    $type: ComplexType
                                    attributes:
                                    - ns: ""
                                      name: type
                                      defaultValue: object
                                      fixed: object
                                      contentType:
                                        $type: StringType
                                        _ref: 2
                                      required: true
                                    name: /components/schemas/http10
                                    compositor: true
                                    compositorObj:
                                      $type: AllCompositor
                                      types:
                                      - $type: ElementType
                                        minOccurs: 0
                                        localName: cookieSettings
                                        bodyType:
                                          $type: ComplexType
                                          _id: 3
                                          attributes:
                                          - ns: ""
                                            name: type
                                            defaultValue: object
                                            fixed: object
                                            contentType:
                                              $type: StringType
                                              _ref: 2
                                            required: true
                                          name: /components/schemas/cookieSettings
                                          compositor: true
                                          compositorObj:
                                            $type: AllCompositor
                                            types:
                                            - $type: ElementType
                                              minOccurs: 0
                                              localName: mode
                                              bodyType:
                                                $type: ComplexType
                                                attributes:
                                                - ns: ""
                                                  name: type
                                                  defaultValue: enum
                                                  fixed: enum
                                                  contentType:
                                                    $type: StringType
                                                    _ref: 2
                                                  required: true
                                                content: true
                                                contentObj:
                                                  $type: EnumType
                                                  values:
                                                  - '"Default"'
                                                  - '"Custom"'
                                                  baseType: anonymous
                                                name: /components/schemas/soapMode
                                                compositor: true
                                                compositorObj:
                                                  $type: SequenceCompositor
                                            - $type: ElementType
                                              minOccurs: 0
                                              localName: reset
                                              bodyType:
                                                $type: ComplexType
                                                _id: 4
                                                attributes:
                                                - ns: ""
                                                  name: type
                                                  defaultValue: boolean
                                                  fixed: boolean
                                                  contentType:
                                                    $type: StringType
                                                    _ref: 2
                                                  required: true
                                                content: true
                                                contentObj:
                                                  $type: BooleanType
                                                namespace: urn:parasoft:json
                                                name: boolean
                                                compositor: true
                                                compositorObj:
                                                  $type: SequenceCompositor
                                      - $type: ElementType
                                        minOccurs: 0
                                        localName: generalSettings
                                        bodyType:
                                          $type: ComplexType
                                          _id: 5
                                          attributes:
                                          - ns: ""
                                            name: type
                                            defaultValue: object
                                            fixed: object
                                            contentType:
                                              $type: StringType
                                              _ref: 2
                                            required: true
                                          name: /components/schemas/generalSettings
                                          compositor: true
                                          compositorObj:
                                            $type: AllCompositor
                                            types:
                                            - $type: ElementType
                                              minOccurs: 0
                                              localName: connectionMode
                                              bodyType:
                                                $type: ComplexType
                                                attributes:
                                                - ns: ""
                                                  name: type
                                                  defaultValue: enum
                                                  fixed: enum
                                                  contentType:
                                                    $type: StringType
                                                    _ref: 2
                                                  required: true
                                                content: true
                                                contentObj:
                                                  $type: EnumType
                                                  values:
                                                  - '"CONNECTION_KEEP_ALIVE"'
                                                  - '"CONNECTION_CLOSE"'
                                                  baseType: anonymous
                                                name: /components/schemas/connectionMode
                                                compositor: true
                                                compositorObj:
                                                  $type: SequenceCompositor
                                            - $type: ElementType
                                              minOccurs: 0
                                              localName: gzipRequest
                                              bodyType:
                                                $type: ComplexType
                                                _ref: 4
                                            - $type: ElementType
                                              minOccurs: 0
                                              localName: decompressResponse
                                              bodyType:
                                                $type: ComplexType
                                                _ref: 4
                                            - $type: ElementType
                                              minOccurs: 0
                                              localName: followHttpRedirects
                                              bodyType:
                                                $type: ComplexType
                                                _ref: 4
                                      - $type: ElementType
                                        minOccurs: 0
                                        localName: httpHeaders
                                        bodyType:
                                          $type: ComplexType
                                          _id: 6
                                          attributes:
                                          - ns: ""
                                            name: type
                                            defaultValue: object
                                            fixed: object
                                            contentType:
                                              $type: StringType
                                              _ref: 2
                                            required: true
                                          name: /components/schemas/httpHeaders
                                          compositor: true
                                          compositorObj:
                                            $type: AllCompositor
                                            types:
                                            - $type: ElementType
                                              minOccurs: 0
                                              localName: type
                                              bodyType:
                                                $type: ComplexType
                                                attributes:
                                                - ns: ""
                                                  name: type
                                                  defaultValue: enum
                                                  fixed: enum
                                                  contentType:
                                                    $type: StringType
                                                    _ref: 2
                                                  required: true
                                                content: true
                                                contentObj:
                                                  $type: EnumType
                                                  values:
                                                  - '"literal"'
                                                  - '"table"'
                                                  baseType: anonymous
                                                name: /components/schemas/httpHeadersType
                                                compositor: true
                                                compositorObj:
                                                  $type: SequenceCompositor
                                            - $type: ElementType
                                              minOccurs: 0
                                              localName: httpHeadersTable
                                              bodyType:
                                                $type: ComplexType
                                                attributes:
                                                - ns: ""
                                                  name: type
                                                  defaultValue: object
                                                  fixed: object
                                                  contentType:
                                                    $type: StringType
                                                    _ref: 2
                                                  required: true
                                                name: /components/schemas/httpHeadersTable
                                                compositor: true
                                                compositorObj:
                                                  $type: AllCompositor
                                                  types:
                                                  - $type: ElementType
                                                    localName: rows
                                                    bodyType:
                                                      $type: ComplexType
                                                      attributes:
                                                      - ns: ""
                                                        name: type
                                                        defaultValue: array
                                                        fixed: array
                                                        contentType:
                                                          $type: StringType
                                                          _ref: 2
                                                        required: true
                                                      name: /components/schemas/httpHeadersTable/properties/rows
                                                      compositor: true
                                                      compositorObj:
                                                        $type: SequenceCompositor
                                                        types:
                                                        - $type: ElementType
                                                          minOccurs: 0
                                                          maxOccurs: -1
                                                          localName: item
                                                          bodyType:
                                                            $type: ComplexType
                                                            attributes:
                                                            - ns: ""
                                                              name: type
                                                              defaultValue: object
                                                              fixed: object
                                                              contentType:
                                                                $type: StringType
                                                                _ref: 2
                                                              required: true
                                                            name: /components/schemas/nameComplexValue
                                                            compositor: true
                                                            compositorObj:
                                                              $type: AllCompositor
                                                              types:
                                                              - $type: ElementType
                                                                localName: name
                                                                bodyType:
                                                                  $type: ComplexType
                                                                  _ref: 1
                                                              - $type: ElementType
                                                                localName: value
                                                                bodyType:
                                                                  $type: ComplexType
                                                                  _id: 7
                                                                  attributes:
                                                                  - ns: ""
                                                                    name: type
                                                                    defaultValue: object
                                                                    fixed: object
                                                                    contentType:
                                                                      $type: StringType
                                                                      _ref: 2
                                                                    required: true
                                                                  name: /components/schemas/complexValueFPS
                                                                  compositor: true
                                                                  compositorObj:
                                                                    $type: AllCompositor
                                                                    types:
                                                                    - $type: ElementType
                                                                      minOccurs: 0
                                                                      localName: type
                                                                      bodyType:
                                                                        $type: ComplexType
                                                                        attributes:
                                                                        - ns: ""
                                                                          name: type
                                                                          defaultValue: enum
                                                                          fixed: enum
                                                                          contentType:
                                                                            $type: StringType
                                                                            _ref: 2
                                                                          required: true
                                                                        content: true
                                                                        contentObj:
                                                                          $type: EnumType
                                                                          values:
                                                                          - '"fixed"'
                                                                          - '"parameterized"'
                                                                          - '"scripted"'
                                                                          baseType: anonymous
                                                                        name: /components/schemas/complexValueFPSType
                                                                        compositor: true
                                                                        compositorObj:
                                                                          $type: SequenceCompositor
                                                                    - $type: ElementType
                                                                      minOccurs: 0
                                                                      localName: fixed
                                                                      bodyType:
                                                                        $type: ComplexType
                                                                        _ref: 1
                                                                    - $type: ElementType
                                                                      minOccurs: 0
                                                                      localName: parameterized
                                                                      bodyType:
                                                                        $type: ComplexType
                                                                        _id: 8
                                                                        attributes:
                                                                        - ns: ""
                                                                          name: type
                                                                          defaultValue: object
                                                                          fixed: object
                                                                          contentType:
                                                                            $type: StringType
                                                                            _ref: 2
                                                                          required: true
                                                                        name: /components/schemas/parameterized
                                                                        compositor: true
                                                                        compositorObj:
                                                                          $type: AllCompositor
                                                                          types:
                                                                          - $type: ElementType
                                                                            minOccurs: 0
                                                                            localName: columnName
                                                                            bodyType:
                                                                              $type: ComplexType
                                                                              _ref: 1
                                                                    - $type: ElementType
                                                                      minOccurs: 0
                                                                      localName: scripted
                                                                      bodyType:
                                                                        $type: ComplexType
                                                                        attributes:
                                                                        - ns: ""
                                                                          name: type
                                                                          defaultValue: object
                                                                          fixed: object
                                                                          contentType:
                                                                            $type: StringType
                                                                            _ref: 2
                                                                          required: true
                                                                        name: /components/schemas/scripted
                                                                        compositor: true
                                                                        compositorObj:
                                                                          $type: AllCompositor
                                                                          types:
                                                                          - $type: ElementType
                                                                            minOccurs: 0
                                                                            localName: language
                                                                            bodyType:
                                                                              $type: ComplexType
                                                                              _ref: 1
                                                                          - $type: ElementType
                                                                            minOccurs: 0
                                                                            localName: method
                                                                            bodyType:
                                                                              $type: ComplexType
                                                                              attributes:
                                                                              - ns: ""
                                                                                name: type
                                                                                defaultValue: object
                                                                                fixed: object
                                                                                contentType:
                                                                                  $type: StringType
                                                                                  _ref: 2
                                                                                required: true
                                                                              name: /components/schemas/method
                                                                              compositor: true
                                                                              compositorObj:
                                                                                $type: AllCompositor
                                                                                types:
                                                                                - $type: ElementType
                                                                                  minOccurs: 0
                                                                                  localName: arguments
                                                                                  bodyType:
                                                                                    $type: ComplexType
                                                                                    attributes:
                                                                                    - ns: ""
                                                                                      name: type
                                                                                      defaultValue: array
                                                                                      fixed: array
                                                                                      contentType:
                                                                                        $type: StringType
                                                                                        _ref: 2
                                                                                      required: true
                                                                                    name: /components/schemas/method/properties/arguments
                                                                                    compositor: true
                                                                                    compositorObj:
                                                                                      $type: SequenceCompositor
                                                                                      types:
                                                                                      - $type: ElementType
                                                                                        minOccurs: 0
                                                                                        maxOccurs: -1
                                                                                        localName: item
                                                                                        bodyType:
                                                                                          $type: ComplexType
                                                                                          _ref: 1
                                                                                - $type: ElementType
                                                                                  localName: name
                                                                                  bodyType:
                                                                                    $type: ComplexType
                                                                                    _ref: 1
                                                                          - $type: ElementType
                                                                            minOccurs: 0
                                                                            localName: useDataSource
                                                                            bodyType:
                                                                              $type: ComplexType
                                                                              _ref: 4
                                                                          - $type: ElementType
                                                                            minOccurs: 0
                                                                            localName: value
                                                                            bodyType:
                                                                              $type: ComplexType
                                                                              attributes:
                                                                              - ns: ""
                                                                                name: type
                                                                                defaultValue: object
                                                                                fixed: object
                                                                                contentType:
                                                                                  $type: StringType
                                                                                  _ref: 2
                                                                                required: true
                                                                              name: /components/schemas/value
                                                                              compositor: true
                                                                              compositorObj:
                                                                                $type: AllCompositor
                                                                                types:
                                                                                - $type: ElementType
                                                                                  minOccurs: 0
                                                                                  localName: class
                                                                                  bodyType:
                                                                                    $type: ComplexType
                                                                                    _ref: 1
                                                                                - $type: ElementType
                                                                                  minOccurs: 0
                                                                                  localName: file
                                                                                  bodyType:
                                                                                    $type: ComplexType
                                                                                    attributes:
                                                                                    - ns: ""
                                                                                      name: type
                                                                                      defaultValue: object
                                                                                      fixed: object
                                                                                      contentType:
                                                                                        $type: StringType
                                                                                        _ref: 2
                                                                                      required: true
                                                                                    name: /components/schemas/file
                                                                                    compositor: true
                                                                                    compositorObj:
                                                                                      $type: AllCompositor
                                                                                      types:
                                                                                      - $type: ElementType
                                                                                        localName: location
                                                                                        bodyType:
                                                                                          $type: ComplexType
                                                                                          attributes:
                                                                                          - ns: ""
                                                                                            name: type
                                                                                            defaultValue: object
                                                                                            fixed: object
                                                                                            contentType:
                                                                                              $type: StringType
                                                                                              _ref: 2
                                                                                            required: true
                                                                                          name: /components/schemas/fileLocation
                                                                                          compositor: true
                                                                                          compositorObj:
                                                                                            $type: AllCompositor
                                                                                            types:
                                                                                            - $type: ElementType
                                                                                              minOccurs: 0
                                                                                              localName: external
                                                                                              bodyType:
                                                                                                $type: ComplexType
                                                                                                _ref: 1
                                                                                            - $type: ElementType
                                                                                              minOccurs: 0
                                                                                              localName: id
                                                                                              bodyType:
                                                                                                $type: ComplexType
                                                                                                _ref: 1
                                                                                - $type: ElementType
                                                                                  minOccurs: 0
                                                                                  localName: text
                                                                                  bodyType:
                                                                                    $type: ComplexType
                                                                                    _ref: 1
                                            - $type: ElementType
                                              minOccurs: 0
                                              localName: literal
                                              bodyType:
                                                $type: ComplexType
                                                _ref: 1
                                      - $type: ElementType
                                        minOccurs: 0
                                        localName: security
                                        bodyType:
                                          $type: ComplexType
                                          _id: 9
                                          attributes:
                                          - ns: ""
                                            name: type
                                            defaultValue: object
                                            fixed: object
                                            contentType:
                                              $type: StringType
                                              _ref: 2
                                            required: true
                                          name: /components/schemas/restSecurity
                                          compositor: true
                                          compositorObj:
                                            $type: AllCompositor
                                            types:
                                            - $type: ElementType
                                              minOccurs: 0
                                              localName: httpAuthentication
                                              bodyType:
                                                $type: ComplexType
                                                attributes:
                                                - ns: ""
                                                  name: type
                                                  defaultValue: object
                                                  fixed: object
                                                  contentType:
                                                    $type: StringType
                                                    _ref: 2
                                                  required: true
                                                name: /components/schemas/httpAuthentication
                                                compositor: true
                                                compositorObj:
                                                  $type: AllCompositor
                                                  types:
                                                  - $type: ElementType
                                                    minOccurs: 0
                                                    localName: performAuthentication
                                                    bodyType:
                                                      $type: ComplexType
                                                      attributes:
                                                      - ns: ""
                                                        name: type
                                                        defaultValue: object
                                                        fixed: object
                                                        contentType:
                                                          $type: StringType
                                                          _ref: 2
                                                        required: true
                                                      name: /components/schemas/performAuthentication
                                                      compositor: true
                                                      compositorObj:
                                                        $type: AllCompositor
                                                        types:
                                                        - $type: ElementType
                                                          minOccurs: 0
                                                          localName: enabled
                                                          bodyType:
                                                            $type: ComplexType
                                                            _ref: 4
                                                        - $type: ElementType
                                                          minOccurs: 0
                                                          localName: value
                                                          bodyType:
                                                            $type: ComplexType
                                                            attributes:
                                                            - ns: ""
                                                              name: type
                                                              defaultValue: object
                                                              fixed: object
                                                              contentType:
                                                                $type: StringType
                                                                _ref: 2
                                                              required: true
                                                            name: /components/schemas/authenticationSettings
                                                            compositor: true
                                                            compositorObj:
                                                              $type: AllCompositor
                                                              types:
                                                              - $type: ElementType
                                                                minOccurs: 0
                                                                localName: authenticationType
                                                                bodyType:
                                                                  $type: ComplexType
                                                                  attributes:
                                                                  - ns: ""
                                                                    name: type
                                                                    defaultValue: object
                                                                    fixed: object
                                                                    contentType:
                                                                      $type: StringType
                                                                      _ref: 2
                                                                    required: true
                                                                  name: /components/schemas/authenticationType
                                                                  compositor: true
                                                                  compositorObj:
                                                                    $type: AllCompositor
                                                                    types:
                                                                    - $type: ElementType
                                                                      minOccurs: 0
                                                                      localName: type
                                                                      bodyType:
                                                                        $type: ComplexType
                                                                        attributes:
                                                                        - ns: ""
                                                                          name: type
                                                                          defaultValue: enum
                                                                          fixed: enum
                                                                          contentType:
                                                                            $type: StringType
                                                                            _ref: 2
                                                                          required: true
                                                                        content: true
                                                                        contentObj:
                                                                          $type: EnumType
                                                                          values:
                                                                          - '"basic"'
                                                                          - '"ntlm"'
                                                                          - '"kerberos"'
                                                                          - '"digest"'
                                                                          baseType: anonymous
                                                                        name: /components/schemas/authenticationTypeType
                                                                        compositor: true
                                                                        compositorObj:
                                                                          $type: SequenceCompositor
                                                                    - $type: ElementType
                                                                      minOccurs: 0
                                                                      localName: basic
                                                                      bodyType:
                                                                        $type: ComplexType
                                                                        attributes:
                                                                        - ns: ""
                                                                          name: type
                                                                          defaultValue: object
                                                                          fixed: object
                                                                          contentType:
                                                                            $type: StringType
                                                                            _ref: 2
                                                                          required: true
                                                                        name: /components/schemas/basic
                                                                        compositor: true
                                                                        compositorObj:
                                                                          $type: AllCompositor
                                                                          types:
                                                                          - $type: ElementType
                                                                            minOccurs: 0
                                                                            localName: password
                                                                            bodyType:
                                                                              $type: ComplexType
                                                                              attributes:
                                                                              - ns: ""
                                                                                name: type
                                                                                defaultValue: object
                                                                                fixed: object
                                                                                contentType:
                                                                                  $type: StringType
                                                                                  _ref: 2
                                                                                required: true
                                                                              name: /components/schemas/complexValueMP
                                                                              compositor: true
                                                                              compositorObj:
                                                                                $type: AllCompositor
                                                                                types:
                                                                                - $type: ElementType
                                                                                  minOccurs: 0
                                                                                  localName: type
                                                                                  bodyType:
                                                                                    $type: ComplexType
                                                                                    attributes:
                                                                                    - ns: ""
                                                                                      name: type
                                                                                      defaultValue: enum
                                                                                      fixed: enum
                                                                                      contentType:
                                                                                        $type: StringType
                                                                                        _ref: 2
                                                                                      required: true
                                                                                    content: true
                                                                                    contentObj:
                                                                                      $type: EnumType
                                                                                      values:
                                                                                      - '"masked"'
                                                                                      - '"parameterized"'
                                                                                      baseType: anonymous
                                                                                    name: /components/schemas/complexValueMPType
                                                                                    compositor: true
                                                                                    compositorObj:
                                                                                      $type: SequenceCompositor
                                                                                - $type: ElementType
                                                                                  minOccurs: 0
                                                                                  localName: masked
                                                                                  bodyType:
                                                                                    $type: ComplexType
                                                                                    _ref: 1
                                                                                - $type: ElementType
                                                                                  minOccurs: 0
                                                                                  localName: parameterized
                                                                                  bodyType:
                                                                                    $type: ComplexType
                                                                                    _ref: 8
                                                                          - $type: ElementType
                                                                            minOccurs: 0
                                                                            localName: username
                                                                            bodyType:
                                                                              $type: ComplexType
                                                                              attributes:
                                                                              - ns: ""
                                                                                name: type
                                                                                defaultValue: object
                                                                                fixed: object
                                                                                contentType:
                                                                                  $type: StringType
                                                                                  _ref: 2
                                                                                required: true
                                                                              name: /components/schemas/complexValueFP
                                                                              compositor: true
                                                                              compositorObj:
                                                                                $type: AllCompositor
                                                                                types:
                                                                                - $type: ElementType
                                                                                  minOccurs: 0
                                                                                  localName: type
                                                                                  bodyType:
                                                                                    $type: ComplexType
                                                                                    attributes:
                                                                                    - ns: ""
                                                                                      name: type
                                                                                      defaultValue: enum
                                                                                      fixed: enum
                                                                                      contentType:
                                                                                        $type: StringType
                                                                                        _ref: 2
                                                                                      required: true
                                                                                    content: true
                                                                                    contentObj:
                                                                                      $type: EnumType
                                                                                      values:
                                                                                      - '"fixed"'
                                                                                      - '"parameterized"'
                                                                                      baseType: anonymous
                                                                                    name: /components/schemas/complexValueFPType
                                                                                    compositor: true
                                                                                    compositorObj:
                                                                                      $type: SequenceCompositor
                                                                                - $type: ElementType
                                                                                  minOccurs: 0
                                                                                  localName: fixed
                                                                                  bodyType:
                                                                                    $type: ComplexType
                                                                                    _ref: 1
                                                                                - $type: ElementType
                                                                                  minOccurs: 0
                                                                                  localName: parameterized
                                                                                  bodyType:
                                                                                    $type: ComplexType
                                                                                    _ref: 8
                                                              - $type: ElementType
                                                                minOccurs: 0
                                                                localName: useGlobal
                                                                bodyType:
                                                                  $type: ComplexType
                                                                  _ref: 4
                                - $type: ElementType
                                  minOccurs: 0
                                  localName: http11
                                  bodyType:
                                    $type: ComplexType
                                    attributes:
                                    - ns: ""
                                      name: type
                                      defaultValue: object
                                      fixed: object
                                      contentType:
                                        $type: StringType
                                        _ref: 2
                                      required: true
                                    name: /components/schemas/http11
                                    compositor: true
                                    compositorObj:
                                      $type: AllCompositor
                                      types:
                                      - $type: ElementType
                                        minOccurs: 0
                                        localName: cookieSettings
                                        bodyType:
                                          $type: ComplexType
                                          _ref: 3
                                      - $type: ElementType
                                        minOccurs: 0
                                        localName: generalSettings
                                        bodyType:
                                          $type: ComplexType
                                          _ref: 5
                                      - $type: ElementType
                                        minOccurs: 0
                                        localName: httpHeaders
                                        bodyType:
                                          $type: ComplexType
                                          _ref: 6
                                      - $type: ElementType
                                        minOccurs: 0
                                        localName: security
                                        bodyType:
                                          $type: ComplexType
                                          _ref: 9
                    - $type: ElementType
                      minOccurs: 0
                      localName: misc
                      bodyType:
                        $type: ComplexType
                        attributes:
                        - ns: ""
                          name: type
                          defaultValue: object
                          fixed: object
                          contentType:
                            $type: StringType
                            _ref: 2
                          required: true
                        name: /components/schemas/restMisc
                        compositor: true
                        compositorObj:
                          $type: AllCompositor
                          types:
                          - $type: ElementType
                            minOccurs: 0
                            localName: timeout
                            bodyType:
                              $type: ComplexType
                              attributes:
                              - ns: ""
                                name: type
                                defaultValue: object
                                fixed: object
                                contentType:
                                  $type: StringType
                                  _ref: 2
                                required: true
                              name: /components/schemas/timeout
                              compositor: true
                              compositorObj:
                                $type: AllCompositor
                                types:
                                - $type: ElementType
                                  minOccurs: 0
                                  localName: action
                                  bodyType:
                                    $type: ComplexType
                                    attributes:
                                    - ns: ""
                                      name: type
                                      defaultValue: enum
                                      fixed: enum
                                      contentType:
                                        $type: StringType
                                        _ref: 2
                                      required: true
                                    content: true
                                    contentObj:
                                      $type: EnumType
                                      values:
                                      - '"failOnTimeout"'
                                      - '"passOnTimeout"'
                                      baseType: anonymous
                                    name: /components/schemas/restTimeoutAction
                                    compositor: true
                                    compositorObj:
                                      $type: SequenceCompositor
                                - $type: ElementType
                                  minOccurs: 0
                                  localName: milliseconds
                                  bodyType:
                                    $type: ComplexType
                                    attributes:
                                    - ns: ""
                                      name: type
                                      defaultValue: object
                                      fixed: object
                                      contentType:
                                        $type: StringType
                                        _ref: 2
                                      required: true
                                    name: /components/schemas/milliseconds
                                    compositor: true
                                    compositorObj:
                                      $type: AllCompositor
                                      types:
                                      - $type: ElementType
                                        minOccurs: 0
                                        localName: mode
                                        bodyType:
                                          $type: ComplexType
                                          attributes:
                                          - ns: ""
                                            name: type
                                            defaultValue: enum
                                            fixed: enum
                                            contentType:
                                              $type: StringType
                                              _ref: 2
                                            required: true
                                          content: true
                                          contentObj:
                                            $type: EnumType
                                            values:
                                            - '"Default"'
                                            - '"Custom"'
                                            baseType: anonymous
                                          name: /components/schemas/restMode
                                          compositor: true
                                          compositorObj:
                                            $type: SequenceCompositor
                                      - $type: ElementType
                                        minOccurs: 0
                                        localName: value
                                        bodyType:
                                          $type: ComplexType
                                          attributes:
                                          - ns: ""
                                            name: type
                                            defaultValue: number
                                            fixed: number
                                            contentType:
                                              $type: StringType
                                              _ref: 2
                                            required: true
                                          content: true
                                          contentObj:
                                            $type: LongType
                                          namespace: urn:parasoft:json
                                          name: number
                                          compositor: true
                                          compositorObj:
                                            $type: SequenceCompositor
                          - $type: ElementType
                            minOccurs: 0
                            localName: validHttpResponseCodes
                            bodyType:
                              $type: ComplexType
                              _ref: 7
                    - $type: ElementType
                      minOccurs: 0
                      localName: name
                      bodyType:
                        $type: ComplexType
                        _ref: 1
                    - $type: ElementType
                      localName: parent
                      bodyType:
                        $type: ComplexType
                        attributes:
                        - ns: ""
                          name: type
                          defaultValue: object
                          fixed: object
                          contentType:
                            $type: StringType
                            _ref: 2
                          required: true
                        name: /components/schemas/parent
                        compositor: true
                        compositorObj:
                          $type: AllCompositor
                          types:
                          - $type: ElementType
                            minOccurs: 0
                            localName: id
                            bodyType:
                              $type: ComplexType
                              _ref: 1
                    - $type: ElementType
                      minOccurs: 0
                      localName: payload
                      bodyType:
                        $type: ComplexType
                        attributes:
                        - ns: ""
                          name: type
                          defaultValue: object
                          fixed: object
                          contentType:
                            $type: StringType
                            _ref: 2
                          required: true
                        name: /components/schemas/payload
                        compositor: true
                        compositorObj:
                          $type: AllCompositor
                          types:
                          - $type: ElementType
                            minOccurs: 0
                            localName: contentType
                            bodyType:
                              $type: ComplexType
                              _ref: 1
                          - $type: ElementType
                            minOccurs: 0
                            localName: input
                            bodyType:
                              $type: ComplexType
                              attributes:
                              - ns: ""
                                name: type
                                defaultValue: object
                                fixed: object
                                contentType:
                                  $type: StringType
                                  _ref: 2
                                required: true
                              name: /components/schemas/input
                              compositor: true
                              compositorObj:
                                $type: AllCompositor
                                types:
                                - $type: ElementType
                                  minOccurs: 0
                                  localName: literal
                                  bodyType:
                                    $type: ComplexType
                                    attributes:
                                    - ns: ""
                                      name: type
                                      defaultValue: object
                                      fixed: object
                                      contentType:
                                        $type: StringType
                                        _ref: 2
                                      required: true
                                    name: /components/schemas/literal
                                    compositor: true
                                    compositorObj:
                                      $type: AllCompositor
                                      types:
                                      - $type: ElementType
                                        minOccurs: 0
                                        localName: text
                                        bodyType:
                                          $type: ComplexType
                                          _ref: 1
                          - $type: ElementType
                            minOccurs: 0
                            localName: inputMode
                            bodyType:
                              $type: ComplexType
                              attributes:
                              - ns: ""
                                name: type
                                defaultValue: enum
                                fixed: enum
                                contentType:
                                  $type: StringType
                                  _ref: 2
                                required: true
                              content: true
                              contentObj:
                                $type: EnumType
                                values:
                                - '"formInput"'
                                - '"formXML"'
                                - '"formJSON"'
                                - '"table"'
                                - '"literal"'
                                - '"scripted"'
                                baseType: anonymous
                              name: /components/schemas/inputModeRESTClient
                              compositor: true
                              compositorObj:
                                $type: SequenceCompositor
                    - $type: ElementType
                      minOccurs: 0
                      localName: resource
                      bodyType:
                        $type: ComplexType
                        attributes:
                        - ns: ""
                          name: type
                          defaultValue: object
                          fixed: object
                          contentType:
                            $type: StringType
                            _ref: 2
                          required: true
                        name: /components/schemas/resource
                        compositor: true
                        compositorObj:
                          $type: AllCompositor
                          types:
                          - $type: ElementType
                            minOccurs: 0
                            localName: type
                            bodyType:
                              $type: ComplexType
                              attributes:
                              - ns: ""
                                name: type
                                defaultValue: enum
                                fixed: enum
                                contentType:
                                  $type: StringType
                                  _ref: 2
                                required: true
                              content: true
                              contentObj:
                                $type: EnumType
                                values:
                                - '"literalText"'
                                - '"raml"'
                                - '"swagger"'
                                - '"wadl"'
                                baseType: anonymous
                              name: /components/schemas/resourceType
                              compositor: true
                              compositorObj:
                                $type: SequenceCompositor
                          - $type: ElementType
                            minOccurs: 0
                            localName: literalText
                            bodyType:
                              $type: ComplexType
                              attributes:
                              - ns: ""
                                name: type
                                defaultValue: object
                                fixed: object
                                contentType:
                                  $type: StringType
                                  _ref: 2
                                required: true
                              name: /components/schemas/fixedElement
                              compositor: true
                              compositorObj:
                                $type: AllCompositor
                                types:
                                - $type: ElementType
                                  minOccurs: 0
                                  localName: fixed
                                  bodyType:
                                    $type: ComplexType
                                    _ref: 1
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                attributes:
                - replacedColumn: ""
                  value:
                    $type: StringValue
                    replacedColumn: ""
                    value: object
                    xmlEncoding: 2
                  useValue: true
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
                      values:
                      - $type: ElementValue
                        replacedColumn: ""
                      - $type: ElementValue
                        replacedColumn: ""
                        values:
                        - $type: ComplexValue
                          replacedColumn: ""
                          allowArrayExclude: true
                          attributes:
                          - replacedColumn: ""
                            value:
                              $type: StringValue
                              replacedColumn: ""
                              value: object
                              xmlEncoding: 2
                            useValue: true
                          compositorValue: true
                          compositorValueObj:
                            replacedColumn: ""
                            values:
                              $type: CompositorValueSetCollectionSet
                              set:
                              - $type: CompositorValueSet
                                values:
                                - $type: ElementValue
                                  replacedColumn: ""
                                  values:
                                  - $type: ComplexValue
                                    replacedColumn: ""
                                    allowArrayExclude: true
                                    attributes:
                                    - replacedColumn: ""
                                      value:
                                        $type: StringValue
                                        replacedColumn: ""
                                        value: object
                                        xmlEncoding: 2
                                      useValue: true
                                    compositorValue: true
                                    compositorValueObj:
                                      replacedColumn: ""
                                      values:
                                        $type: CompositorValueSetCollectionSet
                                        set:
                                        - $type: CompositorValueSet
                                          values:
                                          - $type: ElementValue
                                            replacedColumn: ""
                                            values:
                                            - $type: ComplexValue
                                              replacedColumn: ""
                                              allowArrayExclude: true
                                              attributes:
                                              - replacedColumn: ""
                                                value:
                                                  $type: StringValue
                                                  replacedColumn: ""
                                                  value: enum
                                                  xmlEncoding: 2
                                                useValue: true
                                              contentValue: true
                                              contentValueObj:
                                                $type: EnumValue
                                                replacedColumn: ""
                                                selectedIdx: 7
                                              compositorValue: true
                                              compositorValueObj:
                                                replacedColumn: ""
                                                values:
                                                  $type: CompositorValueSetCollectionSet
                                                  set:
                                                  - $type: CompositorValueSet
                                          - $type: ElementValue
                                            replacedColumn: ""
                                            values:
                                            - $type: ComplexValue
                                              replacedColumn: ""
                                              allowArrayExclude: true
                                              attributes:
                                              - replacedColumn: ""
                                                value:
                                                  $type: StringValue
                                                  replacedColumn: ""
                                                  value: string
                                                  xmlEncoding: 2
                                                useValue: true
                                              contentValue: true
                                              contentValueObj:
                                                $type: StringValue
                                                replacedColumn: ""
                                                mode: 3
                                                columnName: "TestCases: Method"
                                                value: PUT
                                                xmlEncoding: 2
                                              compositorValue: true
                                              compositorValueObj:
                                                replacedColumn: ""
                                                values:
                                                  $type: CompositorValueSetCollectionSet
                                                  set:
                                                  - $type: CompositorValueSet
                      - $type: ElementValue
                        replacedColumn: ""
                        values:
                        - $type: ComplexValue
                          replacedColumn: ""
                          allowArrayExclude: true
                          attributes:
                          - replacedColumn: ""
                            value:
                              $type: StringValue
                              replacedColumn: ""
                              value: object
                              xmlEncoding: 2
                            useValue: true
                          compositorValue: true
                          compositorValueObj:
                            replacedColumn: ""
                            values:
                              $type: CompositorValueSetCollectionSet
                              set:
                              - $type: CompositorValueSet
                                values:
                                - $type: ElementValue
                                  replacedColumn: ""
                                  values:
                                  - $type: ComplexValue
                                    replacedColumn: ""
                                    attributes:
                                    - replacedColumn: ""
                                      value:
                                        $type: StringValue
                                        replacedColumn: ""
                                        value: object
                                        xmlEncoding: 2
                                      useValue: true
                                    compositorValue: true
                                    compositorValueObj:
                                      replacedColumn: ""
                                      values:
                                        $type: CompositorValueSetCollectionSet
                                        set:
                                        - $type: CompositorValueSet
                                          values:
                                          - $type: ElementValue
                                            replacedColumn: ""
                                            values:
                                            - $type: ComplexValue
                                              replacedColumn: ""
                                              allowArrayExclude: true
                                              attributes:
                                              - replacedColumn: ""
                                                value:
                                                  $type: StringValue
                                                  replacedColumn: ""
                                                  value: enum
                                                  xmlEncoding: 2
                                                useValue: true
                                              contentValue: true
                                              contentValueObj:
                                                $type: EnumValue
                                                replacedColumn: ""
                                              compositorValue: true
                                              compositorValueObj:
                                                replacedColumn: ""
                                                values:
                                                  $type: CompositorValueSetCollectionSet
                                                  set:
                                                  - $type: CompositorValueSet
                                          - $type: ElementValue
                                            replacedColumn: ""
                                            values:
                                            - $type: ComplexValue
                                              replacedColumn: ""
                                              allowArrayExclude: true
                                              attributes:
                                              - replacedColumn: ""
                                                value:
                                                  $type: StringValue
                                                  replacedColumn: ""
                                                  value: object
                                                  xmlEncoding: 2
                                                useValue: true
                                              compositorValue: true
                                              compositorValueObj:
                                                replacedColumn: ""
                                                values:
                                                  $type: CompositorValueSetCollectionSet
                                                  set:
                                                  - $type: CompositorValueSet
                                                    values:
                                                    - $type: ElementValue
                                                      replacedColumn: ""
                                                    - $type: ElementValue
                                                      replacedColumn: ""
                                                    - $type: ElementValue
                                                      replacedColumn: ""
                                                      values:
                                                      - $type: ComplexValue
                                                        replacedColumn: ""
                                                        allowArrayExclude: true
                                                        attributes:
                                                        - replacedColumn: ""
                                                          value:
                                                            $type: StringValue
                                                            replacedColumn: ""
                                                            value: object
                                                            xmlEncoding: 2
                                                          useValue: true
                                                        compositorValue: true
                                                        compositorValueObj:
                                                          replacedColumn: ""
                                                          values:
                                                            $type: CompositorValueSetCollectionSet
                                                            set:
                                                            - $type: CompositorValueSet
                                                              values:
                                                              - $type: ElementValue
                                                                replacedColumn: ""
                                                                values:
                                                                - $type: ComplexValue
                                                                  replacedColumn: ""
                                                                  allowArrayExclude: true
                                                                  attributes:
                                                                  - replacedColumn: ""
                                                                    value:
                                                                      $type: StringValue
                                                                      replacedColumn: ""
                                                                      value: enum
                                                                      xmlEncoding: 2
                                                                    useValue: true
                                                                  contentValue: true
                                                                  contentValueObj:
                                                                    $type: EnumValue
                                                                    replacedColumn: ""
                                                                  compositorValue: true
                                                                  compositorValueObj:
                                                                    replacedColumn: ""
                                                                    values:
                                                                      $type: CompositorValueSetCollectionSet
                                                                      set:
                                                                      - $type: CompositorValueSet
                                                              - $type: ElementValue
                                                                replacedColumn: ""
                                                              - $type: ElementValue
                                                                replacedColumn: ""
                                                                values:
                                                                - $type: ComplexValue
                                                                  replacedColumn: ""
                                                                  allowArrayExclude: true
                                                                  attributes:
                                                                  - replacedColumn: ""
                                                                    value:
                                                                      $type: StringValue
                                                                      replacedColumn: ""
                                                                      value: string
                                                                      xmlEncoding: 2
                                                                    useValue: true
                                                                  contentValue: true
                                                                  contentValueObj:
                                                                    $type: StringValue
                                                                    hasMethod: true
                                                                    method:
                                                                      hasCode: true
                                                                      code:
                                                                        $type: ScriptCode
                                                                        input:
                                                                          useText: true
                                                                          textInput:
                                                                            $type: ScriptingTextInput
                                                                            text: "import\
                                                                              \ com.parasoft.api.*;\r\
                                                                              \n\r\
                                                                              \npublic\
                                                                              \ String\
                                                                              \ headers(ScriptingContext\
                                                                              \ context)\r\
                                                                              \n{\r\
                                                                              \n\t\
                                                                              String\
                                                                              \ headers\
                                                                              \ =\
                                                                              \ context.getValue(\"\
                                                                              header\"\
                                                                              )\r\n\
                                                                              \tif(context.getValue(\"\
                                                                              TestCases\"\
                                                                              ,\"\
                                                                              Auth_Type\"\
                                                                              ).equals(\"\
                                                                              bearer\"\
                                                                              ))\r\
                                                                              \n\t\
                                                                              {\r\n\
                                                                              \t\t\
                                                                              headers\
                                                                              \ +=\
                                                                              \ \"\
                                                                              \\nAuthorization:\
                                                                              \ Bearer\
                                                                              \ \"\
                                                                              \ +\
                                                                              \ context.getValue(\"\
                                                                              Generated\
                                                                              \ Data\
                                                                              \ Source\"\
                                                                              ,\"\
                                                                              TokenName\"\
                                                                              );\r\
                                                                              \n\t\
                                                                              }\r\n\
                                                                              \tApplication.showMessage(headers);\r\
                                                                              \n\t\
                                                                              return\
                                                                              \ headers;\r\
                                                                              \n}"
                                                                      hasMethodId: true
                                                                      methodId:
                                                                        $type: ScriptMethodIdentifier
                                                                        functionName: headers
                                                                        arguments:
                                                                        - com.parasoft.api.ScriptingContext
                                                                    replacedColumn: ""
                                                                    mode: 2
                                                                    columnName: header
                                                                    value: |
                                                                      Content-Type:application/json
                                                                    xmlEncoding: 2
                                                                  compositorValue: true
                                                                  compositorValueObj:
                                                                    replacedColumn: ""
                                                                    values:
                                                                      $type: CompositorValueSetCollectionSet
                                                                      set:
                                                                      - $type: CompositorValueSet
                                                    - $type: ElementValue
                                                      replacedColumn: ""
                                                      values:
                                                      - $type: ComplexValue
                                                        replacedColumn: ""
                                                        allowArrayExclude: true
                                                        attributes:
                                                        - replacedColumn: ""
                                                          value:
                                                            $type: StringValue
                                                            replacedColumn: ""
                                                            value: object
                                                            xmlEncoding: 2
                                                          useValue: true
                                                        compositorValue: true
                                                        compositorValueObj:
                                                          replacedColumn: ""
                                                          values:
                                                            $type: CompositorValueSetCollectionSet
                                                            set:
                                                            - $type: CompositorValueSet
                                                              values:
                                                              - $type: ElementValue
                                                                replacedColumn: ""
                                                                values:
                                                                - $type: ComplexValue
                                                                  replacedColumn: ""
                                                                  allowArrayExclude: true
                                                                  attributes:
                                                                  - replacedColumn: ""
                                                                    value:
                                                                      $type: StringValue
                                                                      replacedColumn: ""
                                                                      value: object
                                                                      xmlEncoding: 2
                                                                    useValue: true
                                                                  compositorValue: true
                                                                  compositorValueObj:
                                                                    replacedColumn: ""
                                                                    values:
                                                                      $type: CompositorValueSetCollectionSet
                                                                      set:
                                                                      - $type: CompositorValueSet
                                                                        values:
                                                                        - $type: ElementValue
                                                                          replacedColumn: ""
                                                                          values:
                                                                          - $type: ComplexValue
                                                                            replacedColumn: ""
                                                                            allowArrayExclude: true
                                                                            attributes:
                                                                            - replacedColumn: ""
                                                                              value:
                                                                                $type: StringValue
                                                                                replacedColumn: ""
                                                                                value: object
                                                                                xmlEncoding: 2
                                                                              useValue: true
                                                                            compositorValue: true
                                                                            compositorValueObj:
                                                                              replacedColumn: ""
                                                                              values:
                                                                                $type: CompositorValueSetCollectionSet
                                                                                set:
                                                                                - $type: CompositorValueSet
                                                                                  values:
                                                                                  - $type: ElementValue
                                                                                    replacedColumn: ""
                                                                                    values:
                                                                                    - $type: ComplexValue
                                                                                      replacedColumn: ""
                                                                                      allowArrayExclude: true
                                                                                      attributes:
                                                                                      - replacedColumn: ""
                                                                                        value:
                                                                                          $type: StringValue
                                                                                          replacedColumn: ""
                                                                                          value: boolean
                                                                                          xmlEncoding: 2
                                                                                        useValue: true
                                                                                      contentValue: true
                                                                                      contentValueObj:
                                                                                        $type: BooleanValue
                                                                                        replacedColumn: ""
                                                                                        mode: 3
                                                                                        columnName: Auth_Enabled
                                                                                        value: "false"
                                                                                      compositorValue: true
                                                                                      compositorValueObj:
                                                                                        replacedColumn: ""
                                                                                        values:
                                                                                          $type: CompositorValueSetCollectionSet
                                                                                          set:
                                                                                          - $type: CompositorValueSet
                                                                                  - $type: ElementValue
                                                                                    replacedColumn: ""
                                                                                    values:
                                                                                    - $type: ComplexValue
                                                                                      replacedColumn: ""
                                                                                      allowArrayExclude: true
                                                                                      attributes:
                                                                                      - replacedColumn: ""
                                                                                        value:
                                                                                          $type: StringValue
                                                                                          replacedColumn: ""
                                                                                          value: object
                                                                                          xmlEncoding: 2
                                                                                        useValue: true
                                                                                      compositorValue: true
                                                                                      compositorValueObj:
                                                                                        replacedColumn: ""
                                                                                        values:
                                                                                          $type: CompositorValueSetCollectionSet
                                                                                          set:
                                                                                          - $type: CompositorValueSet
                                                                                            values:
                                                                                            - $type: ElementValue
                                                                                              replacedColumn: ""
                                                                                              values:
                                                                                              - $type: ComplexValue
                                                                                                replacedColumn: ""
                                                                                                allowArrayExclude: true
                                                                                                attributes:
                                                                                                - replacedColumn: ""
                                                                                                  value:
                                                                                                    $type: StringValue
                                                                                                    replacedColumn: ""
                                                                                                    value: object
                                                                                                    xmlEncoding: 2
                                                                                                  useValue: true
                                                                                                compositorValue: true
                                                                                                compositorValueObj:
                                                                                                  replacedColumn: ""
                                                                                                  values:
                                                                                                    $type: CompositorValueSetCollectionSet
                                                                                                    set:
                                                                                                    - $type: CompositorValueSet
                                                                                                      values:
                                                                                                      - $type: ElementValue
                                                                                                        replacedColumn: ""
                                                                                                        values:
                                                                                                        - $type: ComplexValue
                                                                                                          replacedColumn: ""
                                                                                                          allowArrayExclude: true
                                                                                                          attributes:
                                                                                                          - replacedColumn: ""
                                                                                                            value:
                                                                                                              $type: StringValue
                                                                                                              replacedColumn: ""
                                                                                                              value: enum
                                                                                                              xmlEncoding: 2
                                                                                                            useValue: true
                                                                                                          contentValue: true
                                                                                                          contentValueObj:
                                                                                                            $type: EnumValue
                                                                                                            hasMethod: true
                                                                                                            method:
                                                                                                              hasCode: true
                                                                                                              code:
                                                                                                                $type: ScriptCode
                                                                                                                input:
                                                                                                                  useText: true
                                                                                                                  textInput:
                                                                                                                    $type: ScriptingTextInput
                                                                                                                    text: "import\
                                                                                                                      \ com.parasoft.api.*;\r\
                                                                                                                      \n\
                                                                                                                      \r\
                                                                                                                      \n\
                                                                                                                      \
                                                                                                                      public\
                                                                                                                      \ String\
                                                                                                                      \ authType(ScriptingContext\
                                                                                                                      \ context)\r\
                                                                                                                      \n\
                                                                                                                      \
                                                                                                                      {\r\
                                                                                                                      \n\
                                                                                                                      \t\
                                                                                                                      \
                                                                                                                      if(context.getValue(\"\
                                                                                                                      \
                                                                                                                      TestCases\"\
                                                                                                                      \
                                                                                                                      ,\"\
                                                                                                                      \
                                                                                                                      Auth_Type\"\
                                                                                                                      \
                                                                                                                      ).equals(\"\
                                                                                                                      \
                                                                                                                      digest\"\
                                                                                                                      \
                                                                                                                      ))\r\
                                                                                                                      \n\
                                                                                                                      \t\
                                                                                                                      \t\
                                                                                                                      \
                                                                                                                      return\
                                                                                                                      \ \"\
                                                                                                                      \
                                                                                                                      digest\"\
                                                                                                                      \
                                                                                                                      ;\r\
                                                                                                                      \n\
                                                                                                                      \t\
                                                                                                                      \
                                                                                                                      else\r\
                                                                                                                      \n\
                                                                                                                      \t\
                                                                                                                      \t\
                                                                                                                      \
                                                                                                                      return\
                                                                                                                      \ \"\
                                                                                                                      \
                                                                                                                      basic\"\
                                                                                                                      \
                                                                                                                      ;\r\
                                                                                                                      \n\
                                                                                                                      }"
                                                                                                              hasMethodId: true
                                                                                                              methodId:
                                                                                                                $type: ScriptMethodIdentifier
                                                                                                                functionName: authType
                                                                                                                arguments:
                                                                                                                - com.parasoft.api.ScriptingContext
                                                                                                            replacedColumn: ""
                                                                                                            mode: 2
                                                                                                            columnName: Auth_Type
                                                                                                            selectedIdx: -1
                                                                                                          compositorValue: true
                                                                                                          compositorValueObj:
                                                                                                            replacedColumn: ""
                                                                                                            values:
                                                                                                              $type: CompositorValueSetCollectionSet
                                                                                                              set:
                                                                                                              - $type: CompositorValueSet
                                                                                                      - $type: ElementValue
                                                                                                        replacedColumn: ""
                                                                                                        values:
                                                                                                        - $type: ComplexValue
                                                                                                          replacedColumn: ""
                                                                                                          allowArrayExclude: true
                                                                                                          attributes:
                                                                                                          - replacedColumn: ""
                                                                                                            value:
                                                                                                              $type: StringValue
                                                                                                              replacedColumn: ""
                                                                                                              value: object
                                                                                                              xmlEncoding: 2
                                                                                                            useValue: true
                                                                                                          compositorValue: true
                                                                                                          compositorValueObj:
                                                                                                            replacedColumn: ""
                                                                                                            values:
                                                                                                              $type: CompositorValueSetCollectionSet
                                                                                                              set:
                                                                                                              - $type: CompositorValueSet
                                                                                                                values:
                                                                                                                - $type: ElementValue
                                                                                                                  replacedColumn: ""
                                                                                                                  values:
                                                                                                                  - $type: ComplexValue
                                                                                                                    replacedColumn: ""
                                                                                                                    allowArrayExclude: true
                                                                                                                    attributes:
                                                                                                                    - replacedColumn: ""
                                                                                                                      value:
                                                                                                                        $type: StringValue
                                                                                                                        replacedColumn: ""
                                                                                                                        value: object
                                                                                                                        xmlEncoding: 2
                                                                                                                      useValue: true
                                                                                                                    compositorValue: true
                                                                                                                    compositorValueObj:
                                                                                                                      replacedColumn: ""
                                                                                                                      values:
                                                                                                                        $type: CompositorValueSetCollectionSet
                                                                                                                        set:
                                                                                                                        - $type: CompositorValueSet
                                                                                                                          values:
                                                                                                                          - $type: ElementValue
                                                                                                                            replacedColumn: ""
                                                                                                                            values:
                                                                                                                            - $type: ComplexValue
                                                                                                                              replacedColumn: ""
                                                                                                                              allowArrayExclude: true
                                                                                                                              attributes:
                                                                                                                              - replacedColumn: ""
                                                                                                                                value:
                                                                                                                                  $type: StringValue
                                                                                                                                  replacedColumn: ""
                                                                                                                                  value: enum
                                                                                                                                  xmlEncoding: 2
                                                                                                                                useValue: true
                                                                                                                              contentValue: true
                                                                                                                              contentValueObj:
                                                                                                                                $type: EnumValue
                                                                                                                                replacedColumn: ""
                                                                                                                              compositorValue: true
                                                                                                                              compositorValueObj:
                                                                                                                                replacedColumn: ""
                                                                                                                                values:
                                                                                                                                  $type: CompositorValueSetCollectionSet
                                                                                                                                  set:
                                                                                                                                  - $type: CompositorValueSet
                                                                                                                          - $type: ElementValue
                                                                                                                            replacedColumn: ""
                                                                                                                            values:
                                                                                                                            - $type: ComplexValue
                                                                                                                              replacedColumn: ""
                                                                                                                              allowArrayExclude: true
                                                                                                                              attributes:
                                                                                                                              - replacedColumn: ""
                                                                                                                                value:
                                                                                                                                  $type: StringValue
                                                                                                                                  replacedColumn: ""
                                                                                                                                  value: string
                                                                                                                                  xmlEncoding: 2
                                                                                                                                useValue: true
                                                                                                                              contentValue: true
                                                                                                                              contentValueObj:
                                                                                                                                $type: StringValue
                                                                                                                                replacedColumn: ""
                                                                                                                                mode: 3
                                                                                                                                columnName: Basic_Pass
                                                                                                                                value: ""
                                                                                                                                xmlEncoding: 2
                                                                                                                              compositorValue: true
                                                                                                                              compositorValueObj:
                                                                                                                                replacedColumn: ""
                                                                                                                                values:
                                                                                                                                  $type: CompositorValueSetCollectionSet
                                                                                                                                  set:
                                                                                                                                  - $type: CompositorValueSet
                                                                                                                          - $type: ElementValue
                                                                                                                            replacedColumn: ""
                                                                                                                - $type: ElementValue
                                                                                                                  replacedColumn: ""
                                                                                                                  values:
                                                                                                                  - $type: ComplexValue
                                                                                                                    replacedColumn: ""
                                                                                                                    allowArrayExclude: true
                                                                                                                    attributes:
                                                                                                                    - replacedColumn: ""
                                                                                                                      value:
                                                                                                                        $type: StringValue
                                                                                                                        replacedColumn: ""
                                                                                                                        value: object
                                                                                                                        xmlEncoding: 2
                                                                                                                      useValue: true
                                                                                                                    compositorValue: true
                                                                                                                    compositorValueObj:
                                                                                                                      replacedColumn: ""
                                                                                                                      values:
                                                                                                                        $type: CompositorValueSetCollectionSet
                                                                                                                        set:
                                                                                                                        - $type: CompositorValueSet
                                                                                                                          values:
                                                                                                                          - $type: ElementValue
                                                                                                                            replacedColumn: ""
                                                                                                                            values:
                                                                                                                            - $type: ComplexValue
                                                                                                                              replacedColumn: ""
                                                                                                                              allowArrayExclude: true
                                                                                                                              attributes:
                                                                                                                              - replacedColumn: ""
                                                                                                                                value:
                                                                                                                                  $type: StringValue
                                                                                                                                  replacedColumn: ""
                                                                                                                                  value: enum
                                                                                                                                  xmlEncoding: 2
                                                                                                                                useValue: true
                                                                                                                              contentValue: true
                                                                                                                              contentValueObj:
                                                                                                                                $type: EnumValue
                                                                                                                                replacedColumn: ""
                                                                                                                              compositorValue: true
                                                                                                                              compositorValueObj:
                                                                                                                                replacedColumn: ""
                                                                                                                                values:
                                                                                                                                  $type: CompositorValueSetCollectionSet
                                                                                                                                  set:
                                                                                                                                  - $type: CompositorValueSet
                                                                                                                          - $type: ElementValue
                                                                                                                            replacedColumn: ""
                                                                                                                            values:
                                                                                                                            - $type: ComplexValue
                                                                                                                              replacedColumn: ""
                                                                                                                              allowArrayExclude: true
                                                                                                                              attributes:
                                                                                                                              - replacedColumn: ""
                                                                                                                                value:
                                                                                                                                  $type: StringValue
                                                                                                                                  replacedColumn: ""
                                                                                                                                  value: string
                                                                                                                                  xmlEncoding: 2
                                                                                                                                useValue: true
                                                                                                                              contentValue: true
                                                                                                                              contentValueObj:
                                                                                                                                $type: StringValue
                                                                                                                                replacedColumn: ""
                                                                                                                                mode: 3
                                                                                                                                columnName: Basic_User
                                                                                                                                value: ""
                                                                                                                                xmlEncoding: 2
                                                                                                                              compositorValue: true
                                                                                                                              compositorValueObj:
                                                                                                                                replacedColumn: ""
                                                                                                                                values:
                                                                                                                                  $type: CompositorValueSetCollectionSet
                                                                                                                                  set:
                                                                                                                                  - $type: CompositorValueSet
                                                                                                                          - $type: ElementValue
                                                                                                                            replacedColumn: ""
                                                                                            - $type: ElementValue
                                                                                              replacedColumn: ""
                                          - $type: ElementValue
                                            replacedColumn: ""
                      - $type: ElementValue
                        replacedColumn: ""
                      - $type: ElementValue
                        replacedColumn: ""
                        values:
                        - $type: ComplexValue
                          replacedColumn: ""
                          allowArrayExclude: true
                          attributes:
                          - replacedColumn: ""
                            value:
                              $type: StringValue
                              replacedColumn: ""
                              value: string
                              xmlEncoding: 2
                            useValue: true
                          contentValue: true
                          contentValueObj:
                            $type: StringValue
                            replacedColumn: ""
                            mode: 3
                            columnName: "TestCases: Name"
                            value: Agent - Ending Agents contract (124 tests)
                            xmlEncoding: 2
                          compositorValue: true
                          compositorValueObj:
                            replacedColumn: ""
                            values:
                              $type: CompositorValueSetCollectionSet
                              set:
                              - $type: CompositorValueSet
                      - $type: ElementValue
                        replacedColumn: ""
                        values:
                        - $type: ComplexValue
                          replacedColumn: ""
                          attributes:
                          - replacedColumn: ""
                            value:
                              $type: StringValue
                              replacedColumn: ""
                              value: object
                              xmlEncoding: 2
                            useValue: true
                          compositorValue: true
                          compositorValueObj:
                            replacedColumn: ""
                            values:
                              $type: CompositorValueSetCollectionSet
                              set:
                              - $type: CompositorValueSet
                                values:
                                - $type: ElementValue
                                  replacedColumn: ""
                                  values:
                                  - $type: ComplexValue
                                    replacedColumn: ""
                                    allowArrayExclude: true
                                    attributes:
                                    - replacedColumn: ""
                                      value:
                                        $type: StringValue
                                        replacedColumn: ""
                                        value: string
                                        xmlEncoding: 2
                                      useValue: true
                                    contentValue: true
                                    contentValueObj:
                                      $type: StringValue
                                      replacedColumn: ""
                                      mode: 3
                                      columnName: TestSuiteName
                                      value: "/TestAssets/AgencyOnly.tst/Test Suite/Agency\
                                        \ (1,157) - Using direct tests Copy"
                                      xmlEncoding: 2
                                    compositorValue: true
                                    compositorValueObj:
                                      replacedColumn: ""
                                      values:
                                        $type: CompositorValueSetCollectionSet
                                        set:
                                        - $type: CompositorValueSet
                      - $type: ElementValue
                        replacedColumn: ""
                        values:
                        - $type: ComplexValue
                          replacedColumn: ""
                          allowArrayExclude: true
                          attributes:
                          - replacedColumn: ""
                            value:
                              $type: StringValue
                              replacedColumn: ""
                              value: object
                              xmlEncoding: 2
                            useValue: true
                          compositorValue: true
                          compositorValueObj:
                            replacedColumn: ""
                            values:
                              $type: CompositorValueSetCollectionSet
                              set:
                              - $type: CompositorValueSet
                                values:
                                - $type: ElementValue
                                  replacedColumn: ""
                                  values:
                                  - $type: ComplexValue
                                    replacedColumn: ""
                                    allowArrayExclude: true
                                    attributes:
                                    - replacedColumn: ""
                                      value:
                                        $type: StringValue
                                        replacedColumn: ""
                                        value: string
                                        xmlEncoding: 2
                                      useValue: true
                                    contentValue: true
                                    contentValueObj:
                                      $type: StringValue
                                      hasMethod: true
                                      method:
                                        hasCode: true
                                        code:
                                          $type: ScriptCode
                                          input:
                                            useText: true
                                            textInput:
                                              $type: ScriptingTextInput
                                              text: "import com.parasoft.api.*;\r\n\
                                                \r\npublic String contentType(ScriptingContext\
                                                \ context)\r\n{\r\n\tif(context.getValue(\"\
                                                TestCases\",\"Body\").equals(\"urlencoded\"\
                                                ))\r\n\t\treturn \"application/x-www-form-urlencoded\"\
                                                \r\n\telse\r\n\t\treturn \"text/plain\"\
                                                \r\n}"
                                        hasMethodId: true
                                        methodId:
                                          $type: ScriptMethodIdentifier
                                          functionName: contentType
                                          arguments:
                                          - com.parasoft.api.ScriptingContext
                                      replacedColumn: ""
                                      mode: 2
                                      value: ""
                                      xmlEncoding: 2
                                    compositorValue: true
                                    compositorValueObj:
                                      replacedColumn: ""
                                      values:
                                        $type: CompositorValueSetCollectionSet
                                        set:
                                        - $type: CompositorValueSet
                                - $type: ElementValue
                                  replacedColumn: ""
                                  values:
                                  - $type: ComplexValue
                                    replacedColumn: ""
                                    allowArrayExclude: true
                                    attributes:
                                    - replacedColumn: ""
                                      value:
                                        $type: StringValue
                                        replacedColumn: ""
                                        value: object
                                        xmlEncoding: 2
                                      useValue: true
                                    compositorValue: true
                                    compositorValueObj:
                                      replacedColumn: ""
                                      values:
                                        $type: CompositorValueSetCollectionSet
                                        set:
                                        - $type: CompositorValueSet
                                          values:
                                          - $type: ElementValue
                                            replacedColumn: ""
                                            values:
                                            - $type: ComplexValue
                                              replacedColumn: ""
                                              allowArrayExclude: true
                                              attributes:
                                              - replacedColumn: ""
                                                value:
                                                  $type: StringValue
                                                  replacedColumn: ""
                                                  value: object
                                                  xmlEncoding: 2
                                                useValue: true
                                              compositorValue: true
                                              compositorValueObj:
                                                replacedColumn: ""
                                                values:
                                                  $type: CompositorValueSetCollectionSet
                                                  set:
                                                  - $type: CompositorValueSet
                                                    values:
                                                    - $type: ElementValue
                                                      replacedColumn: ""
                                                      values:
                                                      - $type: ComplexValue
                                                        replacedColumn: ""
                                                        allowArrayExclude: true
                                                        attributes:
                                                        - replacedColumn: ""
                                                          value:
                                                            $type: StringValue
                                                            replacedColumn: ""
                                                            value: string
                                                            xmlEncoding: 2
                                                          useValue: true
                                                        contentValue: true
                                                        contentValueObj:
                                                          $type: StringValue
                                                          replacedColumn: ""
                                                          mode: 3
                                                          columnName: body
                                                          value: "{\r\n    \"company\"\
                                                            : {\r\n        \"code\"\
                                                            : \"WLI\"\r\n    },\r\n\
                                                            \    \"producerId\": \"\
                                                            {{createdAgentId}}\",\r\
                                                            \n    \"niprNumber\":\
                                                            \ \"777123\",\r\n    \"\
                                                            client\": {\r\n      \
                                                            \  \"clientId\": \"{{createdAgentId}}\"\
                                                            ,\r\n        \"clientType\"\
                                                            : {\r\n            \"\
                                                            code\": \"PERSON\",\r\n\
                                                            \            \"description\"\
                                                            : \"Person\"\r\n     \
                                                            \   },\r\n        \"governmentId\"\
                                                            : \"{{ssn}}\",\r\n   \
                                                            \     \"emailAddress\"\
                                                            : {\r\n            \"\
                                                            emailAddressLine\": \"\
                                                            {{createdAgentId}}@woodmen.org\"\
                                                            \r\n        },\r\n   \
                                                            \     \"phones\": [\r\n\
                                                            \            {\r\n   \
                                                            \             \"phoneType\"\
                                                            : {\r\n              \
                                                            \      \"code\": \"WORK\"\
                                                            ,\r\n                \
                                                            \    \"description\":\
                                                            \ \"Agent Business Phone\"\
                                                            \r\n                },\r\
                                                            \n                \"phoneNumber\"\
                                                            : \"402-555-1122\"\r\n\
                                                            \            },\r\n  \
                                                            \          {\r\n     \
                                                            \           \"phoneType\"\
                                                            : {\r\n              \
                                                            \      \"code\": \"MOBILE\"\
                                                            ,\r\n                \
                                                            \    \"description\":\
                                                            \ \"Mobile\"\r\n     \
                                                            \           },\r\n   \
                                                            \             \"phoneNumber\"\
                                                            : \"402-555-3333\"\r\n\
                                                            \            },\r\n  \
                                                            \          {\r\n     \
                                                            \           \"phoneType\"\
                                                            : {\r\n              \
                                                            \      \"code\": \"FAX\"\
                                                            ,\r\n                \
                                                            \    \"description\":\
                                                            \ \"Fax\"\r\n        \
                                                            \        },\r\n      \
                                                            \          \"phoneNumber\"\
                                                            : \"402-555-4444\"\r\n\
                                                            \            }\r\n   \
                                                            \     ],\r\n        \"\
                                                            birthDate\": \"{{dob}}\"\
                                                            ,\r\n        \"firstName\"\
                                                            : \"NewWriting\",\r\n\
                                                            \        \"gender\": {\r\
                                                            \n            \"code\"\
                                                            : \"MALE\",\r\n      \
                                                            \      \"description\"\
                                                            : \"Male\"\r\n       \
                                                            \ },\r\n        \"lastName\"\
                                                            : \"NewAgent\",\r\n  \
                                                            \      \"middleName\"\
                                                            : \"Middle\",\r\n    \
                                                            \    \"namePrefix\": \"\
                                                            Mr\",\r\n        \"nameSuffix\"\
                                                            : \"II\",\r\n        \"\
                                                            preferredName\": \"pref\"\
                                                            \r\n    },\r\n    \"hierarchies\"\
                                                            : [\r\n        {\r\n \
                                                            \           \"effectiveDate\"\
                                                            : \"2017-02-12\",\r\n\
                                                            \            \"terminationDate\"\
                                                            : \"2018-02-02\",\r\n\
                                                            \            \"producerId\"\
                                                            : \"{{createdAgentId}}\"\
                                                            ,\r\n            \"areaManagerProducerId\"\
                                                            : \"267778\",\r\n    \
                                                            \        \"regionManagerProducerId\"\
                                                            : \"267779\",\r\n    \
                                                            \        \"salesRegionId\"\
                                                            : \"000880\"\r\n     \
                                                            \   }\r\n    ],\r\n  \
                                                            \  \"contracts\": [\r\n\
                                                            \        {\r\n       \
                                                            \ \t\"yearsOfService\"\
                                                            : 6,\r\n        \t\"vestedType\"\
                                                            : \"\",\r\n          \
                                                            \  \"taxReportingIndicator\"\
                                                            : \"Y\",\r\n         \
                                                            \   \"currentSituationStatus\"\
                                                            : \"PT\",\r\n        \
                                                            \    \"maxAnnualizedPayment\"\
                                                            : 4000,\r\n          \
                                                            \  \"annualizations\"\
                                                            \ : [],\r\n          \
                                                            \  \"finraDates\": [\r\
                                                            \n            \t{\r\n\
                                                            \            \t\t\"finraEffectiveDate\"\
                                                            : \"\",\r\n          \
                                                            \  \t\t\"producerStatus\"\
                                                            : \"\"\r\n           \
                                                            \ \t}\r\n            ]\r\
                                                            \n        }\r\n    ],\r\
                                                            \n    \"licenses\": [],\r\
                                                            \n    \"appointments\"\
                                                            : [],\r\n    \"contractStartDate\"\
                                                            : \"2013-01-01\",\r\n\
                                                            \    \"terminationDate\"\
                                                            : \"2018-02-02\",\r\n\
                                                            \    \"addresses\": [\r\
                                                            \n        {\r\n      \
                                                            \      \"addressType\"\
                                                            : {\r\n              \
                                                            \  \"code\": \"ML\",\r\
                                                            \n                \"description\"\
                                                            : \"Agent Business Address\"\
                                                            \r\n            },\r\n\
                                                            \            \"line1\"\
                                                            : \"1700 Farnam Street\"\
                                                            ,\r\n            \"line2\"\
                                                            : \"\",\r\n          \
                                                            \  \"line3\": \"\",\r\n\
                                                            \            \"line4\"\
                                                            : \"\",\r\n          \
                                                            \  \"city\": \"Omaha\"\
                                                            ,\r\n            \"country\"\
                                                            : {\r\n              \
                                                            \  \"code\": \"USA\",\r\
                                                            \n                \"description\"\
                                                            : \"United States of America\"\
                                                            \r\n            },\r\n\
                                                            \            \"state\"\
                                                            : {\r\n              \
                                                            \  \"code\": \"NE\"\r\n\
                                                            \            },\r\n  \
                                                            \          \"zip\": \"\
                                                            68102\",\r\n         \
                                                            \   \"addressCountyName\"\
                                                            : \"123\",\r\n       \
                                                            \     \"addressValidIndicator\"\
                                                            : {\r\n              \
                                                            \  \"code\": \"0\",\r\n\
                                                            \                \"description\"\
                                                            : \"True\"\r\n       \
                                                            \     }\r\n        }\r\
                                                            \n    ],\r\n    \"citizenship\"\
                                                            : {\r\n        \"code\"\
                                                            : \"US\",\r\n        \"\
                                                            description\": \"United\
                                                            \ States of America\"\r\
                                                            \n    },\r\n    \"compensationSchedules\"\
                                                            : [\r\n        {\r\n \
                                                            \           \"compensationScheduleEffectiveDate\"\
                                                            : \"2013-01-01\",\r\n\
                                                            \            \"compensationScheduleTerminationDate\"\
                                                            : \"2017-02-12\",\r\n\
                                                            \            \"producerContractType\"\
                                                            : {\r\n              \
                                                            \  \"code\": \"ALPH\"\
                                                            ,\r\n                \"\
                                                            description\": \"Alpha\
                                                            \ contract\"\r\n     \
                                                            \       }\r\n        },\r\
                                                            \n                {\r\n\
                                                            \            \"compensationScheduleEffectiveDate\"\
                                                            : \"2017-02-12\",\r\n\
                                                            \            \"compensationScheduleTerminationDate\"\
                                                            : \"2018-02-02\",\r\n\
                                                            \            \"producerContractType\"\
                                                            : {\r\n              \
                                                            \  \"code\": \"DELT\"\
                                                            ,\r\n                \"\
                                                            description\": \"Delta\
                                                            \ contract\"\r\n     \
                                                            \       }\r\n        }\r\
                                                            \n    ]\r\n}"
                                                          xmlEncoding: 2
                                                        compositorValue: true
                                                        compositorValueObj:
                                                          replacedColumn: ""
                                                          values:
                                                            $type: CompositorValueSetCollectionSet
                                                            set:
                                                            - $type: CompositorValueSet
                                - $type: ElementValue
                                  replacedColumn: ""
                                  values:
                                  - $type: ComplexValue
                                    replacedColumn: ""
                                    allowArrayExclude: true
                                    attributes:
                                    - replacedColumn: ""
                                      value:
                                        $type: StringValue
                                        replacedColumn: ""
                                        value: enum
                                        xmlEncoding: 2
                                      useValue: true
                                    contentValue: true
                                    contentValueObj:
                                      $type: EnumValue
                                      replacedColumn: ""
                                      selectedIdx: 4
                                    compositorValue: true
                                    compositorValueObj:
                                      replacedColumn: ""
                                      values:
                                        $type: CompositorValueSetCollectionSet
                                        set:
                                        - $type: CompositorValueSet
                      - $type: ElementValue
                        replacedColumn: ""
                        values:
                        - $type: ComplexValue
                          replacedColumn: ""
                          allowArrayExclude: true
                          attributes:
                          - replacedColumn: ""
                            value:
                              $type: StringValue
                              replacedColumn: ""
                              value: object
                              xmlEncoding: 2
                            useValue: true
                          compositorValue: true
                          compositorValueObj:
                            replacedColumn: ""
                            values:
                              $type: CompositorValueSetCollectionSet
                              set:
                              - $type: CompositorValueSet
                                values:
                                - $type: ElementValue
                                  replacedColumn: ""
                                  values:
                                  - $type: ComplexValue
                                    replacedColumn: ""
                                    allowArrayExclude: true
                                    attributes:
                                    - replacedColumn: ""
                                      value:
                                        $type: StringValue
                                        replacedColumn: ""
                                        value: enum
                                        xmlEncoding: 2
                                      useValue: true
                                    contentValue: true
                                    contentValueObj:
                                      $type: EnumValue
                                      replacedColumn: ""
                                    compositorValue: true
                                    compositorValueObj:
                                      replacedColumn: ""
                                      values:
                                        $type: CompositorValueSetCollectionSet
                                        set:
                                        - $type: CompositorValueSet
                                - $type: ElementValue
                                  replacedColumn: ""
                                  values:
                                  - $type: ComplexValue
                                    replacedColumn: ""
                                    allowArrayExclude: true
                                    attributes:
                                    - replacedColumn: ""
                                      value:
                                        $type: StringValue
                                        replacedColumn: ""
                                        value: object
                                        xmlEncoding: 2
                                      useValue: true
                                    compositorValue: true
                                    compositorValueObj:
                                      replacedColumn: ""
                                      values:
                                        $type: CompositorValueSetCollectionSet
                                        set:
                                        - $type: CompositorValueSet
                                          values:
                                          - $type: ElementValue
                                            replacedColumn: ""
                                            values:
                                            - $type: ComplexValue
                                              replacedColumn: ""
                                              allowArrayExclude: true
                                              attributes:
                                              - replacedColumn: ""
                                                value:
                                                  $type: StringValue
                                                  replacedColumn: ""
                                                  value: string
                                                  xmlEncoding: 2
                                                useValue: true
                                              contentValue: true
                                              contentValueObj:
                                                $type: StringValue
                                                replacedColumn: ""
                                                mode: 3
                                                columnName: "TestCases: Endpoint"
                                                value: "{{agency}}/agency/producer/WLI/"
                                                xmlEncoding: 2
                                              compositorValue: true
                                              compositorValueObj:
                                                replacedColumn: ""
                                                values:
                                                  $type: CompositorValueSetCollectionSet
                                                  set:
                                                  - $type: CompositorValueSet
            elementTypeName: root
          hasServiceInfo: true
          serviceInfo:
            serviceDescriptor:
              $type: StandardServiceDescriptor
              location: http://localhost:9080/soavirt/api/v6
          jsonBuilder:
            hasValue: true
            value:
              $type: JSONObjectValue
              nameIsNull: true
          schemaURL:
            MessagingClient_SchemaLocation: "${HOST}:${PORT}/soavirt/api/v6"
          formInput:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: ":"
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
          jmsMessageOutputProvider:
            $type: JMSMessageOutputProvider
            jmsOutputProviderRequest:
              $type: JMSOutputProvider
              name: Request Object
              menuName: Object
            jmsOutputProviderResponse:
              $type: JMSOutputProvider
              name: Response Message Object
              menuName: Message Object
          router:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              HTTPClient_Endpoint: http://localhost:9080/soa
          transportProperties:
            manager:
              properties:
              - $type: HTTPClientHTTPProperties
                followRedirects:
                  bool: true
                common:
                  auth:
                    useDefault: false
                    authName: Basic
                  method:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: HTTPMethodTestValue
                      method: GET
                  httpHeaders:
                    mode: 1
                keepAlive1_1:
                  bool: true
              - $type: HTTPClientHTTPProperties
                followRedirects:
                  bool: true
                common:
                  auth:
                    useDefault: false
                    authName: Basic
                  method:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: HTTPMethodTestValue
                      method: GET
                  httpHeaders:
                    mode: 1
                protocol: 1
                keepAlive1_1:
                  bool: true
              - $type: NoneTransportProperties
            messageExchangePattern:
              inverted: true
          outputProviders:
            requestHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Request Transport Header
            responseHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Response Transport Header
            xmlRequestOutput:
              $type: NamedXMLToolOutputProvider
              outputTools:
              - $type: MethodTool
                dataSourceNames:
                - Postman Collection
                iconName: Method
                name: Extension Tool
                method:
                  hasCode: true
                  code:
                    $type: ScriptCode
                    input:
                      useText: true
                      textInput:
                        $type: ScriptingTextInput
                        text: "import com.parasoft.api.*;\r\nimport java.util.regex.*;\r\
                          \n\r\npublic String replaceVariables(Object input, ExtensionToolContext\
                          \ context)\r\n{\r\n\tString start = input.toString();\r\n\
                          \tPattern pattern = Pattern.compile(\"(\\\\{\\\\{)(.*?)(\\\
                          \\}\\\\})\");\r\n\tMatcher matcher = pattern.matcher(start);\r\
                          \n\t\r\n\tList<String> listMatches = new ArrayList<String>();\r\
                          \n\t\r\n\twhile(matcher.find())\r\n    {\r\n       listMatches.add(matcher.group(2));\r\
                          \n    }\r\n\r\n    for(String s : listMatches)\r\n    {\r\
                          \n    \t//Application.showMessage(\"FIND ME HERE! \" + s)\r\
                          \n    \tif(s.startsWith(\"\\$\"))\r\n    \t{\r\n    \t\t\
                          s = s.substring(1);\r\n    \t\t//Application.showMessage(\"\
                          Did it work? \" + s)\r\n    \t}\r\n    \tstart = start.replaceFirst(pattern,\
                          \ \"\\\\\\${\"+s+\"}\");\r\n    \tcontext.setValue(\"variablesToAdd\"\
                          , (context.getValue(\"variablesToAdd\") + \",\" + s));\r\
                          \n    }\r\n    \r\n    /*pattern = Pattern.compile(\"(\\\
                          \\{\\\\{)(.*?)(\\\\}\\\\})\");\r\n    matcher = pattern.matcher(start);\r\
                          \n    \r\n    listMatches = new ArrayList<String>();\r\n\
                          \t\r\n\twhile(matcher.find())\r\n    {\r\n       listMatches.add(matcher.group(2));\r\
                          \n    }\r\n\r\n    for(String s : listMatches)\r\n    {\r\
                          \n    \tstart = start.replaceFirst(pattern,\"\\\\\\${\"\
                          +s+\"}\")\r\n    \tcontext.setValue(\"variablesToAdd\",\
                          \ (context.getValue(\"variablesToAdd\") + \",\" + s))\r\n\
                          \    }*/\r\n    \r\n    return start;\r\n}"
                  hasMethodId: true
                  methodId:
                    $type: ScriptMethodIdentifier
                    functionName: replaceVariables
                    arguments:
                    - java.lang.Object
                    - com.parasoft.api.ExtensionToolContext
              menuName: Traffic
              name: Request Traffic
            trafficOutput:
              m_name: Traffic Stream
            objectOutput:
              $type: ObjectOutputProvider
              outputTools:
              - $type: TrafficViewer
                iconName: TrafficViewer
                name: Traffic Viewer
                showRequestHeaders: true
                showResponseHeaders: true
              name: Traffic Object
          literal:
            use: 1
            text:
              MessagingClient_LiteralMessage: "{\"resource\":{\"type\":\"literalText\"\
                ,\"literalText\":{\"fixed\":\"${TestCases: Endpoint}\"}},\"header\"\
                :{\"method\":{\"value\":\"${TestCases: Method}\",\"methodType\":\"\
                CUSTOM\"}},\"httpOptions\":{\"transport\":{\"type\":\"http10\",\"\
                http10\":{\"general\":{\"endpoint\":{\"value\":{\"type\":\"fixed\"\
                ,\"fixed\":\"${TestCases: Endpoint}\"},\"endpointType\":\"custom\"\
                }},\"security\":{\"httpAuthentication\":{\"performAuthentication\"\
                :{\"value\":{\"authenticationType\":{\"type\":\"basic\",\"basic\"\
                :{\"username\":{\"type\":\"fixed\",\"fixed\":\"${Basic_User}\"},\"\
                password\":{\"type\":\"masked\",\"masked\":\"${Basic_Pass}\"}}}},\"\
                enabled\":${boolean:Auth_Enabled}}}},\"httpHeaders\":{\"type\":\"\
                literal\",\"literal\":\"${header}\"}}}},\"parent\":{\"id\":\"${TestSuiteName}\"\
                },\"name\":\"${TestCases: Name}\",\"payload\":{\"inputMode\":\"literal\"\
                ,\"input\":{\"literal\":{\"text\":\"${TestCases: Body}\"}}}}"
              type: application/json
            dataSource:
              columnName: File Contents
          mode: Form JSON
          literalQuery:
            isPropertiesRef: true
          literalPath:
            pathElements:
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: soa
          resourceMethod:
            resourceId: /v6/tools/restClients
            httpMethod: POST
          resourceMode: 3
          baseUrl:
            values:
            - $type: ScriptedValue
            - $type: WadlTestValue
              value: http://localhost:9080/soavirt/api
            fixedValue:
              $type: StringTestValue
            selectedIndex: 1
      - $type: ToolTest
        name: Extension Tool 2
        testFlowLogic:
          dependencyLogic:
            success: 0
        testID: 33
        tool:
          $type: MethodTool
          dataSourceNames:
          - Postman Collection
          iconName: Method
          name: Extension Tool 2
          method:
            hasCode: true
            code:
              $type: ScriptCode
              input:
                useText: true
                textInput:
                  $type: ScriptingTextInput
                  text: "import com.parasoft.api.*;\r\n\r\npublic void incX(Object\
                    \ input, ExtensionToolContext context)\r\n{\r\n\tcontext.setValue(\"\
                    testCaseName\",\"0\")\r\n\tcontext.setValue(\"x\",(Integer.parseInt(context.getValue(\"\
                    x\"))+1).toString());\r\n}"
            hasMethodId: true
            methodId:
              $type: ScriptMethodIdentifier
              functionName: incX
              arguments:
              - java.lang.Object
              - com.parasoft.api.ExtensionToolContext
        writeInput: true
        inputType: InputUsable
        input:
          use: 1
          text:
            text: ""
            type: text/plain
          dataSource:
            columnName: File Contents
    - $type: RESTClientToolTest
      name: REST Client
      testFlowLogic:
        variableCondition:
          variableCondition: true
          variableConditionObj:
            $type: StringCondition
            name: ParentFolderName
            condition: 1
            value: ""
      testID: 137
      tool:
        $type: RESTClient
        dataSourceNames:
        - Postman Collection
        iconName: RESTClient
        name: REST Client
        outputTools:
        - $type: GenericDataBank
          dataSourceNames:
          - Postman Collection
          iconName: XMLDataBank
          name: JSON Data Bank
          wrappedTool:
            $type: XMLtoDataSource
            dataSourceNames:
            - Postman Collection
            iconName: XMLDataBank
            name: XML Data Bank
            selectedXPaths:
            - elementOption: 1
              contentOption: 1
              XMLDataBank_ExtractXPath: "//id[../name=\"${ParentFolderName}\"]/text()"
              mode: 1
            - elementOption: 1
              contentOption: 1
              XMLDataBank_ExtractXPath: "//id[../name=\"${TestSuites: A}\"]/text()"
              mode: 1
            canonicalizeOutput: true
            xmlMessage: true
            virtualDSCreator:
              writableColumns:
              - dataSourceNames:
                - "Child Folders: A"
                customName: toId
              - dataSourceNames:
                - "Child Folders: A"
                customName: fromId
          conversionStrategy:
            dataFormatName: JSON
            conversionStrategyId: JSON
            conversionStrategyClassName: com.parasoft.xml.convert.json.JsonConversionStrategy
        formJson:
          builtFromSchema: true
          value:
            $type: ElementValue
            writeType: true
            type:
              $type: ElementType
              localName: root
              bodyType:
                $type: ComplexType
                attributes:
                - ns: ""
                  name: type
                  defaultValue: object
                  fixed: object
                  contentType:
                    $type: StringType
                    _id: 1
                  required: true
                name: /components/schemas/moveSuiteRequest
                compositor: true
                compositorObj:
                  $type: AllCompositor
                  types:
                  - $type: ElementType
                    localName: from
                    bodyType:
                      $type: ComplexType
                      attributes:
                      - ns: ""
                        name: type
                        defaultValue: object
                        fixed: object
                        contentType:
                          $type: StringType
                          _ref: 1
                        required: true
                      name: /components/schemas/from
                      compositor: true
                      compositorObj:
                        $type: AllCompositor
                        types:
                        - $type: ElementType
                          localName: id
                          bodyType:
                            $type: ComplexType
                            _id: 2
                            attributes:
                            - ns: ""
                              name: type
                              defaultValue: string
                              fixed: string
                              contentType:
                                $type: StringType
                                _ref: 1
                              required: true
                            content: true
                            contentObj:
                              $type: StringType
                              _ref: 1
                            namespace: urn:parasoft:json
                            name: string
                            compositor: true
                            compositorObj:
                              $type: SequenceCompositor
                  - $type: ElementType
                    localName: to
                    bodyType:
                      $type: ComplexType
                      attributes:
                      - ns: ""
                        name: type
                        defaultValue: object
                        fixed: object
                        contentType:
                          $type: StringType
                          _ref: 1
                        required: true
                      name: /components/schemas/to
                      compositor: true
                      compositorObj:
                        $type: AllCompositor
                        types:
                        - $type: ElementType
                          minOccurs: 0
                          localName: name
                          bodyType:
                            $type: ComplexType
                            _ref: 2
                        - $type: ElementType
                          localName: parent
                          bodyType:
                            $type: ComplexType
                            attributes:
                            - ns: ""
                              name: type
                              defaultValue: object
                              fixed: object
                              contentType:
                                $type: StringType
                                _ref: 1
                              required: true
                            name: /components/schemas/parent
                            compositor: true
                            compositorObj:
                              $type: AllCompositor
                              types:
                              - $type: ElementType
                                minOccurs: 0
                                localName: id
                                bodyType:
                                  $type: ComplexType
                                  _ref: 2
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              attributes:
              - replacedColumn: ""
                value:
                  $type: StringValue
                  replacedColumn: ""
                  value: object
                  xmlEncoding: 2
                useValue: true
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
                    values:
                    - $type: ElementValue
                      replacedColumn: ""
                      values:
                      - $type: ComplexValue
                        replacedColumn: ""
                        attributes:
                        - replacedColumn: ""
                          value:
                            $type: StringValue
                            replacedColumn: ""
                            value: object
                            xmlEncoding: 2
                          useValue: true
                        compositorValue: true
                        compositorValueObj:
                          replacedColumn: ""
                          values:
                            $type: CompositorValueSetCollectionSet
                            set:
                            - $type: CompositorValueSet
                              values:
                              - $type: ElementValue
                                replacedColumn: ""
                                values:
                                - $type: ComplexValue
                                  replacedColumn: ""
                                  attributes:
                                  - replacedColumn: ""
                                    value:
                                      $type: StringValue
                                      replacedColumn: ""
                                      value: string
                                      xmlEncoding: 2
                                    useValue: true
                                  contentValue: true
                                  contentValueObj:
                                    $type: StringValue
                                    replacedColumn: ""
                                    value: ""
                                    xmlEncoding: 2
                                  compositorValue: true
                                  compositorValueObj:
                                    replacedColumn: ""
                                    values:
                                      $type: CompositorValueSetCollectionSet
                                      set:
                                      - $type: CompositorValueSet
                    - $type: ElementValue
                      replacedColumn: ""
                      values:
                      - $type: ComplexValue
                        replacedColumn: ""
                        attributes:
                        - replacedColumn: ""
                          value:
                            $type: StringValue
                            replacedColumn: ""
                            value: object
                            xmlEncoding: 2
                          useValue: true
                        compositorValue: true
                        compositorValueObj:
                          replacedColumn: ""
                          values:
                            $type: CompositorValueSetCollectionSet
                            set:
                            - $type: CompositorValueSet
                              values:
                              - $type: ElementValue
                                replacedColumn: ""
                              - $type: ElementValue
                                replacedColumn: ""
                                values:
                                - $type: ComplexValue
                                  replacedColumn: ""
                                  attributes:
                                  - replacedColumn: ""
                                    value:
                                      $type: StringValue
                                      replacedColumn: ""
                                      value: object
                                      xmlEncoding: 2
                                    useValue: true
                                  compositorValue: true
                                  compositorValueObj:
                                    replacedColumn: ""
                                    values:
                                      $type: CompositorValueSetCollectionSet
                                      set:
                                      - $type: CompositorValueSet
                                        values:
                                        - $type: ElementValue
                                          replacedColumn: ""
                                          values:
                                          - $type: ComplexValue
                                            replacedColumn: ""
                                            allowArrayExclude: true
                                            attributes:
                                            - replacedColumn: ""
                                              value:
                                                $type: StringValue
                                                replacedColumn: ""
                                                value: string
                                                xmlEncoding: 2
                                              useValue: true
                                            contentValue: true
                                            contentValueObj:
                                              $type: StringValue
                                              replacedColumn: ""
                                              mode: 3
                                              columnName: "NestedFolders: A"
                                              value: ""
                                              xmlEncoding: 2
                                            compositorValue: true
                                            compositorValueObj:
                                              replacedColumn: ""
                                              values:
                                                $type: CompositorValueSetCollectionSet
                                                set:
                                                - $type: CompositorValueSet
          elementTypeName: root
        hasServiceInfo: true
        serviceInfo:
          serviceDescriptor:
            $type: StandardServiceDescriptor
            location: http://ulvbdparas01.rei.com:9080/soavirt/api/v6
        jsonBuilder:
          hasValue: true
          value:
            $type: JSONObjectValue
            nameIsNull: true
        schemaURL:
          MessagingClient_SchemaLocation: "${HOST}:${PORT}/soavirt/api/v6"
        formInput:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: ":"
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
        jmsMessageOutputProvider:
          $type: JMSMessageOutputProvider
          jmsOutputProviderRequest:
            $type: JMSOutputProvider
            name: Request Object
            menuName: Object
          jmsOutputProviderResponse:
            $type: JMSOutputProvider
            name: Response Message Object
            menuName: Message Object
        transportProperties:
          manager:
            protocol: 1
            properties:
            - $type: HTTPClientHTTPProperties
              followRedirects:
                bool: true
              common:
                auth:
                  useDefault: false
                  authName: Basic
                method:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: GET
              protocol: 1
              keepAlive1_1:
                bool: true
            - $type: HTTPClientHTTPProperties
              followRedirects:
                bool: true
              common:
                auth:
                  useDefault: false
                  authName: Basic
                method:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: GET
              keepAlive1_1:
                bool: true
            - $type: NoneTransportProperties
          messageExchangePattern:
            inverted: true
        outputProviders:
          requestHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Request Transport Header
          responseHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Response Transport Header
          xmlRequestOutput:
            $type: NamedXMLToolOutputProvider
            menuName: Traffic
            name: Request Traffic
          trafficOutput:
            m_name: Traffic Stream
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Traffic Viewer
              showRequestHeaders: true
              showResponseHeaders: true
            name: Traffic Object
        literal:
          use: 1
          text:
            MessagingClient_LiteralMessage: ""
            type: application/json
          dataSource:
            columnName: "Child Folders: A"
        mode: Form JSON
        literalQuery:
          isPropertiesRef: true
        constrainedQuery:
          parameters:
          - $type: ElementValue
            writeType: true
            type:
              $type: ElementType
              localName: id
              bodyType:
                $type: StringType
            replacedColumn: ""
            values:
            - $type: StringValue
              replacedColumn: ""
              mode: 3
              columnName: TopTestSuiteID
              value: /TestAssets/PingOne Platform APIs.tst/Test Suite
              xmlEncoding: 2
          - $type: ElementValue
            writeType: true
            type:
              $type: ElementType
              minOccurs: 0
              localName: fields
              bodyType:
                $type: StringType
            replacedColumn: ""
        resourceMethod:
          resourceId: /v6/descendants/assets
          httpMethod: GET
        resourceMode: 3
        baseUrl:
          values:
          - $type: ScriptedValue
          - $type: WadlTestValue
            value: http://ulvbdparas01.rei.com:9080/soavirt/api
          fixedValue:
            $type: StringTestValue
          selectedIndex: 1
    - $type: RESTClientToolTest
      name: REST Client 2
      testFlowLogic:
        variableCondition:
          variableCondition: true
          variableConditionObj:
            $type: StringCondition
            name: ParentFolderName
            condition: 1
            value: ""
        dependencyLogic:
          index: 4
      testID: 136
      tool:
        $type: RESTClient
        dataSourceNames:
        - Postman Collection
        iconName: RESTClient
        name: Move Folder If Necessary
        formJson:
          builtFromSchema: true
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :root
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              attributes:
              - replacedColumn: ""
                value:
                  $type: StringValue
                  replacedColumn: ""
                  value: object
                  xmlEncoding: 2
                useValue: true
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
                    values:
                    - $type: ElementValue
                      replacedColumn: ""
                      values:
                      - $type: ComplexValue
                        replacedColumn: ""
                        attributes:
                        - replacedColumn: ""
                          value:
                            $type: StringValue
                            replacedColumn: ""
                            value: object
                            xmlEncoding: 2
                          useValue: true
                        compositorValue: true
                        compositorValueObj:
                          replacedColumn: ""
                          values:
                            $type: CompositorValueSetCollectionSet
                            set:
                            - $type: CompositorValueSet
                              values:
                              - $type: ElementValue
                                replacedColumn: ""
                                values:
                                - $type: ComplexValue
                                  replacedColumn: ""
                                  attributes:
                                  - replacedColumn: ""
                                    value:
                                      $type: StringValue
                                      replacedColumn: ""
                                      value: string
                                      xmlEncoding: 2
                                    useValue: true
                                  contentValue: true
                                  contentValueObj:
                                    $type: StringValue
                                    replacedColumn: ""
                                    mode: 3
                                    columnName: fromId
                                    value: /TestAssets/CSA.tst/Test Suite/ITE2 (FUTURE)
                                    xmlEncoding: 2
                                  compositorValue: true
                                  compositorValueObj:
                                    replacedColumn: ""
                                    values:
                                      $type: CompositorValueSetCollectionSet
                                      set:
                                      - $type: CompositorValueSet
                    - $type: ElementValue
                      replacedColumn: ""
                      values:
                      - $type: ComplexValue
                        replacedColumn: ""
                        attributes:
                        - replacedColumn: ""
                          value:
                            $type: StringValue
                            replacedColumn: ""
                            value: object
                            xmlEncoding: 2
                          useValue: true
                        compositorValue: true
                        compositorValueObj:
                          replacedColumn: ""
                          values:
                            $type: CompositorValueSetCollectionSet
                            set:
                            - $type: CompositorValueSet
                              values:
                              - $type: ElementValue
                                replacedColumn: ""
                              - $type: ElementValue
                                replacedColumn: ""
                                values:
                                - $type: ComplexValue
                                  replacedColumn: ""
                                  attributes:
                                  - replacedColumn: ""
                                    value:
                                      $type: StringValue
                                      replacedColumn: ""
                                      value: object
                                      xmlEncoding: 2
                                    useValue: true
                                  compositorValue: true
                                  compositorValueObj:
                                    replacedColumn: ""
                                    values:
                                      $type: CompositorValueSetCollectionSet
                                      set:
                                      - $type: CompositorValueSet
                                        values:
                                        - $type: ElementValue
                                          replacedColumn: ""
                                          values:
                                          - $type: ComplexValue
                                            replacedColumn: ""
                                            allowArrayExclude: true
                                            attributes:
                                            - replacedColumn: ""
                                              value:
                                                $type: StringValue
                                                replacedColumn: ""
                                                value: string
                                                xmlEncoding: 2
                                              useValue: true
                                            contentValue: true
                                            contentValueObj:
                                              $type: StringValue
                                              replacedColumn: ""
                                              mode: 3
                                              columnName: toId
                                              value: /TestAssets/CSA.tst/Test Suite/Archive
                                              xmlEncoding: 2
                                            compositorValue: true
                                            compositorValueObj:
                                              replacedColumn: ""
                                              values:
                                                $type: CompositorValueSetCollectionSet
                                                set:
                                                - $type: CompositorValueSet
          elementTypeName: root
        hasServiceInfo: true
        serviceInfo:
          serviceDescriptor:
            $type: StandardServiceDescriptor
            location: http://ulvbdparas01.rei.com:9080/soavirt/api/v6
        jsonBuilder:
          hasValue: true
          value:
            $type: JSONObjectValue
            nameIsNull: true
        schemaURL:
          MessagingClient_SchemaLocation: "${HOST}:${PORT}/soavirt/api/v6"
        formInput:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: ":"
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
        jmsMessageOutputProvider:
          $type: JMSMessageOutputProvider
          jmsOutputProviderRequest:
            $type: JMSOutputProvider
            name: Request Object
            menuName: Object
          jmsOutputProviderResponse:
            $type: JMSOutputProvider
            name: Response Message Object
            menuName: Message Object
        transportProperties:
          manager:
            protocol: 1
            properties:
            - $type: HTTPClientHTTPProperties
              followRedirects:
                bool: true
              common:
                auth:
                  useDefault: false
                  authName: Basic
                method:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: POST
              protocol: 1
              keepAlive1_1:
                bool: true
            - $type: HTTPClientHTTPProperties
              followRedirects:
                bool: true
              common:
                auth:
                  useDefault: false
                  authName: Basic
                method:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: POST
              keepAlive1_1:
                bool: true
            - $type: NoneTransportProperties
          messageExchangePattern:
            inverted: true
        outputProviders:
          requestHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Request Transport Header
          responseHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Response Transport Header
          xmlRequestOutput:
            $type: NamedXMLToolOutputProvider
            menuName: Traffic
            name: Request Traffic
          trafficOutput:
            m_name: Traffic Stream
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Traffic Viewer
              showRequestHeaders: true
              showResponseHeaders: true
            name: Traffic Object
        literal:
          use: 1
          text:
            MessagingClient_LiteralMessage: ""
            type: application/json
          dataSource:
            columnName: "Child Folders: A"
        mode: Form JSON
        literalQuery:
          isPropertiesRef: true
        resourceMethod:
          resourceId: /v6/suites/move
          httpMethod: POST
        resourceMode: 3
        baseUrl:
          values:
          - $type: ScriptedValue
          - $type: WadlTestValue
            value: http://ulvbdparas01.rei.com:9080/soavirt/api
          fixedValue:
            $type: StringTestValue
          selectedIndex: 1
    - $type: ToolTest
      name: Extension Tool 2
      testID: 36
      tool:
        $type: MethodTool
        dataSourceNames:
        - Postman Collection
        iconName: Method
        name: Extension Tool 2
        method:
          hasCode: true
          code:
            $type: ScriptCode
            input:
              useText: true
              textInput:
                $type: ScriptingTextInput
                text: "import com.parasoft.api.*;\r\n\r\npublic void stopExec(Object\
                  \ input, ExtensionToolContext context)\r\n{\r\n\tcontext.setValue(\"\
                  x\",\"1\");\r\n\tcontext.setValue(\"y\",(Integer.parseInt(context.getValue(\"\
                  y\"))+1).toString());\r\n\tcontext.setValue(\"ParentFolderName\"\
                  ,\"0\");\r\n}"
          hasMethodId: true
          methodId:
            $type: ScriptMethodIdentifier
            functionName: stopExec
            arguments:
            - java.lang.Object
            - com.parasoft.api.ExtensionToolContext
      writeInput: true
      inputType: InputUsable
      input:
        use: 1
        text:
          text: ""
          type: text/plain
        dataSource:
          columnName: File Contents
  - $type: HTTPClientToolTest
    name: Check If Folders 2
    testID: 104
    tool:
      $type: HTTPClient
      dataSourceNames:
      - Postman Collection
      iconName: HTTPClient
      name: Check If Top Level Test Cases
      formJson:
        value:
          $type: ElementValue
          writeType: true
          type:
            $type: ElementType
            localName: root
            bodyType:
              $type: ComplexType
              attributes:
              - ns: ""
                name: type
                fixed: object
                contentType:
                  $type: StringType
                required: true
              name: rootType
              compositor: true
              compositorObj:
                $type: AllCompositor
          replacedColumn: ""
          values:
          - $type: ComplexValue
            replacedColumn: ""
            attributes:
            - replacedColumn: ""
              value:
                $type: StringValue
                replacedColumn: ""
                value: object
                xmlEncoding: 2
              useValue: true
            compositorValue: true
            compositorValueObj:
              replacedColumn: ""
              values:
                $type: CompositorValueSetCollectionSet
                set:
                - $type: CompositorValueSet
        elementTypeName: root
      hasServiceInfo: true
      serviceInfo:
        serviceDescriptor:
          $type: StandardServiceDescriptor
          location: ""
      jsonBuilder:
        hasValue: true
        value:
          $type: JSONObjectValue
          nameIsNull: true
      formInput:
        value:
          $type: ElementValue
          writeType: true
          hasReference: true
          qnameAsString: ":"
          replacedColumn: ""
          values:
          - $type: ComplexValue
            replacedColumn: ""
            compositorValue: true
            compositorValueObj:
              replacedColumn: ""
              values:
                $type: CompositorValueSetCollectionSet
                set:
                - $type: CompositorValueSet
      jmsMessageOutputProvider:
        $type: JMSMessageOutputProvider
        jmsOutputProviderRequest:
          $type: JMSOutputProvider
          name: Request Object
          menuName: Object
        jmsOutputProviderResponse:
          $type: JMSOutputProvider
          name: Response Message Object
          menuName: Message Object
      transportProperties:
        manager:
          protocol: 10
          properties:
          - $type: HTTPClientHTTPProperties
            followRedirects:
              bool: true
            common:
              auth:
                useDefault: false
                customType: 1
              method:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: HTTPMethodTestValue
                  method: POST
            keepAlive1_1:
              bool: true
          - $type: HTTPClientHTTPProperties
            followRedirects:
              bool: true
            common:
              auth:
                useDefault: false
                customType: 1
              method:
                values:
                - $type: ScriptedValue
                fixedValue:
                  $type: HTTPMethodTestValue
                  method: POST
            protocol: 1
            keepAlive1_1:
              bool: true
          - $type: JNDIProperties
            msgExpiration:
              $type: JMSMessageExpiration
            bytesMessageReadMethod:
              string: readUTF()
            responseCorrelation:
              correlationId:
                name: JMSCorrelationID
                value:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: StringTestValue
              messageSelector: ""
            queueProperties:
              jmsDestination:
                name: JMSDestination
                value:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: StringTestValue
                    value: JMS_RequestQueue
              jmsReplyTo:
                name: JMSReplyTo
                value:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: StringTestValue
                    value: JMS_ResponseQueue
            msgType:
              string: javax.jms.TextMessage
            useP2P:
              bool: true
            connProperties:
              jmsFactory:
                name: Connection Factory
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: MQ_JMS_MANAGER
              jndiFactory:
                name: Initial Context
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: com.sun.jndi.fscontext.RefFSContextFactory
              providerURL:
                name: Provider URL
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: file:/C:/JNDI-Directory
              auth:
                service:
                  name: Service
                  value:
                    fixedValue:
                      $type: StringTestValue
                username:
                  name: Username
                  value:
                    fixedValue:
                      $type: StringTestValue
                password:
                  name: Password
                  value:
                    fixedValue:
                      $type: PasswordTestValue
            useSync: true
          - $type: SonicMQJNDIProperties
            msgExpiration:
              $type: JMSMessageExpiration
            bytesMessageReadMethod:
              string: readUTF()
            responseCorrelation:
              correlationId:
                name: JMSCorrelationID
                value:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: StringTestValue
              messageSelector: ""
            queueProperties:
              jmsDestination:
                name: JMSDestination
                value:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: StringTestValue
                    value: JMS_RequestQueue
              jmsReplyTo:
                name: JMSReplyTo
                value:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: StringTestValue
                    value: JMS_ResponseQueue
            msgType:
              string: progress.message.jclient.MultipartMessage
            useP2P:
              bool: true
            connProperties:
              initialContextProps:
              - name: java.naming.security.credentials
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: Administrator
              - name: java.naming.security.principal
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: Administrator
              jmsFactory:
                name: Connection Factory
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: ConnectionFactory
              jndiFactory:
                name: Initial Context
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: com.sonicsw.jndi.mfcontext.MFContextFactory
              providerURL:
                name: Provider URL
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: "tcp://[hostname]:2506"
              auth:
                service:
                  name: Service
                  value:
                    fixedValue:
                      $type: StringTestValue
                username:
                  name: Username
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: Administrator
                password:
                  name: Password
                  value:
                    fixedValue:
                      $type: PasswordTestValue
            useSync: true
            partContentID:
              string: part1
          - $type: MQProperties
            mqrfh2fields:
              version:
                name: Version
                value:
                  fixedValue:
                    $type: StringTestValue
              encoding:
                name: Encoding
                value:
                  fixedValue:
                    $type: StringTestValue
              codedCharSetId:
                name: CodedCharSetId
                value:
                  fixedValue:
                    $type: StringTestValue
              format:
                name: Format
                value:
                  fixedValue:
                    $type: StringTestValue
              flags:
                name: Flags
                value:
                  fixedValue:
                    $type: StringTestValue
              nameValueCodedCharSetId:
                name: NameValueCodedCharSetId
                value:
                  fixedValue:
                    $type: StringTestValue
            mcd:
              msd:
                name: Message Service Domain
                value:
                  fixedValue:
                    $type: StringTestValue
              set:
                name: Message Set
                value:
                  fixedValue:
                    $type: StringTestValue
              type:
                name: Message Type
                value:
                  fixedValue:
                    $type: StringTestValue
              fmt:
                name: Output Format
                value:
                  fixedValue:
                    $type: StringTestValue
            psc:
              subIdentity:
                name: SubIdentity
                value:
                  fixedValue:
                    $type: StringTestValue
              qName:
                name: QName
                value:
                  fixedValue:
                    $type: StringTestValue
              qMgrName:
                name: QMgrName
                value:
                  fixedValue:
                    $type: StringTestValue
              subPoint:
                name: SubPoint
                value:
                  fixedValue:
                    $type: StringTestValue
              filter:
                name: Filter
                value:
                  fixedValue:
                    $type: StringTestValue
              subName:
                name: SubName
                value:
                  fixedValue:
                    $type: StringTestValue
              subUserData:
                name: SubUserData
                value:
                  fixedValue:
                    $type: StringTestValue
            jms:
              destination:
                name: Destination
                value:
                  fixedValue:
                    $type: StringTestValue
              replyTo:
                name: Reply To
                value:
                  fixedValue:
                    $type: StringTestValue
              timestamp:
                name: Timestamp
                value:
                  fixedValue:
                    $type: StringTestValue
              expiration:
                name: Expiration
                value:
                  fixedValue:
                    $type: StringTestValue
              correlationId:
                name: Correlation Id
                value:
                  fixedValue:
                    $type: StringTestValue
              priority:
                name: Priority
                value:
                  fixedValue:
                    $type: StringTestValue
              deliveryMode:
                name: Delivery Mode
                value:
                  fixedValue:
                    $type: StringTestValue
            mqQueueManager:
              ccsid:
                name: CCSID
                value:
                  fixedValue:
                    $type: StringTestValue
            mqSSL:
              peerName:
                name: Peer Name
                value:
                  fixedValue:
                    $type: StringTestValue
              cipherSuite:
                $type: EnumNameValuePair
                name: CipherSuite
                value:
                  fixedValue:
                    $type: StringTestValue
            conn:
              keepAliveConnection: false
              putManagerId:
                name: Put Manager Id
                value:
                  fixedValue:
                    $type: StringTestValue
              getManagerId:
                name: Get Manager Id
                value:
                  fixedValue:
                    $type: StringTestValue
              channel:
                name: Channel
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: CHANNEL1
              host:
                name: Host
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: host
              port:
                name: Port
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: 1414
              manager:
                name: Queue Manager
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: queue.manager.1
              putQueue:
                name: Put Queue
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: PutQueue
              getQueue:
                name: Get Queue
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: GetQueue
              auth:
                service:
                  name: Service
                  value:
                    fixedValue:
                      $type: StringTestValue
                username:
                  name: Username
                  value:
                    fixedValue:
                      $type: StringTestValue
                password:
                  name: Password
                  value:
                    fixedValue:
                      $type: PasswordTestValue
            mqpmMisc:
              applicationIdData:
                name: Application ID data
                value:
                  fixedValue:
                    $type: StringTestValue
              correlationID:
                name: Correlation ID
                value:
                  fixedValue:
                    $type: StringTestValue
              expiry:
                name: Expiry (in tenths of a second)
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: -1
              messageSequenceNumber:
                name: Message sequence number
                value:
                  fixedValue:
                    $type: StringTestValue
              replyToQueueManagerName:
                name: Reply queue manager name
                value:
                  fixedValue:
                    $type: StringTestValue
              replyToQueueName:
                name: Reply queue name
                value:
                  fixedValue:
                    $type: StringTestValue
              putApplicationName:
                name: Put application name
                value:
                  fixedValue:
                    $type: StringTestValue
              applicationOriginData:
                name: Originating application data
                value:
                  fixedValue:
                    $type: StringTestValue
              userId:
                name: User ID
                value:
                  fixedValue:
                    $type: StringTestValue
            mqgmMisc:
              correlationID:
                name: Correlation Id
                value:
                  fixedValue:
                    $type: StringTestValue
              waitInterval:
                name: Wait Interval(in milliseconds)
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: -1
          - $type: RMIProperties
            hostName:
              name: Host
              value:
                fixedValue:
                  $type: StringTestValue
                  value: Host
            portNumber:
              name: Port
              value:
                fixedValue:
                  $type: StringTestValue
                  value: Port
            bindingName:
              name: Binding
              value:
                fixedValue:
                  $type: StringTestValue
                  value: Binding
            remoteInterface:
              name: Remote Interface
              value:
                fixedValue:
                  $type: StringTestValue
                  value: Remote Interface
            methodName:
              name: Method Name
              value:
                fixedValue:
                  $type: StringTestValue
                  value: Method Name
          - $type: SMTPConnectionProperties
            port:
              name: Port
              value:
                fixedValue:
                  $type: StringTestValue
                  value: 25
            host:
              name: SMTP Host
              value:
                fixedValue:
                  $type: StringTestValue
            user:
              name: Username
              value:
                fixedValue:
                  $type: StringTestValue
            pass:
              name: Password
              value:
                fixedValue:
                  $type: PasswordTestValue
                  password: AwAAAAA=
            fromEmail:
              name: From Email
              value:
                fixedValue:
                  $type: StringTestValue
            toEmail:
              name: To Email
              value:
                fixedValue:
                  $type: StringTestValue
            subject:
              name: Subject
              value:
                fixedValue:
                  $type: StringTestValue
          - $type: TIBCOProperties
            timeLimit:
              name: Time Limit
              value:
                fixedValue:
                  $type: StringTestValue
                  value: 0
            service:
              name: ""
              value:
                fixedValue:
                  $type: StringTestValue
            network:
              name: ""
              value:
                fixedValue:
                  $type: StringTestValue
            daemon:
              name: DAEMON
              value:
                fixedValue:
                  $type: StringTestValue
                  value: DAEMON
            sendSubject:
              name: Send Subject
              value:
                fixedValue:
                  $type: StringTestValue
                  value: Send Subject
            replySubject:
              name: Reply Field Name
              value:
                fixedValue:
                  $type: StringTestValue
                  value: Reply Field Name
            sendFieldName:
              name: Send Field Name
              value:
                fixedValue:
                  $type: StringTestValue
                  value: Send Field Name
            replyFieldName:
              name: Reply Field Name
              value:
                fixedValue:
                  $type: StringTestValue
                  value: Reply Field Name
          - $type: NoneTransportProperties
          - $type: CustomTransportProperties
            selected: 0
            configs:
            - $type: CustomTransportConfigurationImpl
              ConfigClassName: com.parasoft.soavirt.transport.socket.SocketTransport
              values:
                customValueMap:
                - charset
                - $type: MultiValueCustomValue
                - eof
                - $type: MultiValueCustomValue
                - host
                - $type: MultiValueCustomValue
                - port
                - $type: MultiValueCustomValue
              className: com.parasoft.soavirt.transport.socket.SocketTransport
              name: TCP/IP Socket
        messageExchangePattern:
          inverted: true
      outputProviders:
        requestHeader:
          $type: HTTPNamedToolOutputProvider
          menuName: Transport Header
          name: Request Transport Header
        responseHeader:
          $type: HTTPNamedToolOutputProvider
          menuName: Transport Header
          name: Response Transport Header
        xmlRequestOutput:
          $type: NamedXMLToolOutputProvider
          outputTools:
          - $type: GenericDataBank
            dataSourceNames:
            - Postman Collection
            iconName: XMLDataBank
            name: JSON Data Bank
            wrappedTool:
              $type: XMLtoDataSource
              dataSourceNames:
              - Postman Collection
              iconName: XMLDataBank
              name: XML Data Bank
              selectedXPaths:
              - elementOption: 1
                contentOption: 1
                XMLDataBank_ExtractXPath: "boolean(/root/item[1]/item/name[../../../info\
                  \ and ../request])"
                mode: 1
              canonicalizeOutput: true
              xmlMessage: true
              virtualDSCreator:
                writableColumns:
                - dataSourceNames:
                  - "SOASyntaxVars: A"
                  testVariableName: topLevelTestCases
                  mode: 3
                  customName: "Test 5: root"
            conversionStrategy:
              dataFormatName: JSON
              conversionStrategyId: JSON
              conversionStrategyClassName: com.parasoft.xml.convert.json.JsonConversionStrategy
          menuName: Traffic
          name: Request Traffic
        trafficOutput:
          m_name: Traffic Stream
        objectOutput:
          $type: ObjectOutputProvider
          outputTools:
          - $type: TrafficViewer
            iconName: TrafficViewer
            name: Traffic Viewer
            showRequestHeaders: true
            showResponseHeaders: true
          name: Traffic Object
      literal:
        use: 1
        text:
          MessagingClient_LiteralMessage: "${File Contents}"
          type: text/json
      mode: Literal
  - $type: TestSuite
    name: Create Top Level Test Cases
    testFlowLogic:
      variableCondition:
        variableCondition: true
        variableConditionObj:
          $type: BooleanCondition
          name: topLevelTestCases
          condition: true
      dependencyLogic:
        index: 6
    testID: 94
    testSuiteLogic: true
    testLogicVariables:
    - $type: TestLogicInteger
      value:
        $type: TestLogicVariableInteger
        useLocalValue: true
        originalValue: 1
        value: 1
    - $type: TestLogicInteger
      name: "y"
      value:
        $type: TestLogicVariableInteger
        originalValue: 1
        value: 1
    dataSources:
    - id: ds_-994842688_1541440446896_1308541627
      impl:
        $type: WritableDataSource
        model:
          columnCount: 11
          columnIdentifiers:
          - Name
          - Endpoint
          - Method
          - Body
          - Basic_User
          - Basic_Pass
          - Auth_Enabled
          - Auth_Type
          - Digest_User
          - Digest_Pass
          rowCount: 181
        writingMode: 3
      name: TestCases
      useAllRows: true
    runMode: 1
    tests:
    - $type: HTTPClientToolTest
      name: Messaging Client 3
      testID: 95
      tool:
        $type: HTTPClient
        dataSourceNames:
        - Postman Collection
        iconName: HTTPClient
        name: Full Message
        formJson:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :root
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              attributes:
              - replacedColumn: ""
                value:
                  $type: StringValue
                  replacedColumn: ""
                  value: object
                  xmlEncoding: 2
                useValue: true
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
          elementTypeName: root
        hasServiceInfo: true
        serviceInfo:
          serviceDescriptor:
            $type: StandardServiceDescriptor
            location: ""
        jsonBuilder:
          hasValue: true
          value:
            $type: JSONObjectValue
            nameIsNull: true
        formInput:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: ":"
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
        jmsMessageOutputProvider:
          $type: JMSMessageOutputProvider
          jmsOutputProviderRequest:
            $type: JMSOutputProvider
            name: Request Object
            menuName: Object
          jmsOutputProviderResponse:
            $type: JMSOutputProvider
            name: Response Message Object
            menuName: Message Object
        transportProperties:
          manager:
            protocol: 10
            properties:
            - $type: HTTPClientHTTPProperties
              followRedirects:
                bool: true
              common:
                auth:
                  useDefault: false
                  customType: 1
                method:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: POST
              keepAlive1_1:
                bool: true
            - $type: HTTPClientHTTPProperties
              followRedirects:
                bool: true
              common:
                auth:
                  useDefault: false
                  customType: 1
                method:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: POST
              protocol: 1
              keepAlive1_1:
                bool: true
            - $type: JNDIProperties
              msgExpiration:
                $type: JMSMessageExpiration
              bytesMessageReadMethod:
                string: readUTF()
              responseCorrelation:
                correlationId:
                  name: JMSCorrelationID
                  value:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: StringTestValue
                messageSelector: ""
              queueProperties:
                jmsDestination:
                  name: JMSDestination
                  value:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: StringTestValue
                      value: JMS_RequestQueue
                jmsReplyTo:
                  name: JMSReplyTo
                  value:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: StringTestValue
                      value: JMS_ResponseQueue
              msgType:
                string: javax.jms.TextMessage
              useP2P:
                bool: true
              connProperties:
                jmsFactory:
                  name: Connection Factory
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: MQ_JMS_MANAGER
                jndiFactory:
                  name: Initial Context
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: com.sun.jndi.fscontext.RefFSContextFactory
                providerURL:
                  name: Provider URL
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: file:/C:/JNDI-Directory
                auth:
                  service:
                    name: Service
                    value:
                      fixedValue:
                        $type: StringTestValue
                  username:
                    name: Username
                    value:
                      fixedValue:
                        $type: StringTestValue
                  password:
                    name: Password
                    value:
                      fixedValue:
                        $type: PasswordTestValue
              useSync: true
            - $type: SonicMQJNDIProperties
              msgExpiration:
                $type: JMSMessageExpiration
              bytesMessageReadMethod:
                string: readUTF()
              responseCorrelation:
                correlationId:
                  name: JMSCorrelationID
                  value:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: StringTestValue
                messageSelector: ""
              queueProperties:
                jmsDestination:
                  name: JMSDestination
                  value:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: StringTestValue
                      value: JMS_RequestQueue
                jmsReplyTo:
                  name: JMSReplyTo
                  value:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: StringTestValue
                      value: JMS_ResponseQueue
              msgType:
                string: progress.message.jclient.MultipartMessage
              useP2P:
                bool: true
              connProperties:
                initialContextProps:
                - name: java.naming.security.credentials
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: Administrator
                - name: java.naming.security.principal
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: Administrator
                jmsFactory:
                  name: Connection Factory
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: ConnectionFactory
                jndiFactory:
                  name: Initial Context
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: com.sonicsw.jndi.mfcontext.MFContextFactory
                providerURL:
                  name: Provider URL
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: "tcp://[hostname]:2506"
                auth:
                  service:
                    name: Service
                    value:
                      fixedValue:
                        $type: StringTestValue
                  username:
                    name: Username
                    value:
                      fixedValue:
                        $type: StringTestValue
                        value: Administrator
                  password:
                    name: Password
                    value:
                      fixedValue:
                        $type: PasswordTestValue
              useSync: true
              partContentID:
                string: part1
            - $type: MQProperties
              mqrfh2fields:
                version:
                  name: Version
                  value:
                    fixedValue:
                      $type: StringTestValue
                encoding:
                  name: Encoding
                  value:
                    fixedValue:
                      $type: StringTestValue
                codedCharSetId:
                  name: CodedCharSetId
                  value:
                    fixedValue:
                      $type: StringTestValue
                format:
                  name: Format
                  value:
                    fixedValue:
                      $type: StringTestValue
                flags:
                  name: Flags
                  value:
                    fixedValue:
                      $type: StringTestValue
                nameValueCodedCharSetId:
                  name: NameValueCodedCharSetId
                  value:
                    fixedValue:
                      $type: StringTestValue
              mcd:
                msd:
                  name: Message Service Domain
                  value:
                    fixedValue:
                      $type: StringTestValue
                set:
                  name: Message Set
                  value:
                    fixedValue:
                      $type: StringTestValue
                type:
                  name: Message Type
                  value:
                    fixedValue:
                      $type: StringTestValue
                fmt:
                  name: Output Format
                  value:
                    fixedValue:
                      $type: StringTestValue
              psc:
                subIdentity:
                  name: SubIdentity
                  value:
                    fixedValue:
                      $type: StringTestValue
                qName:
                  name: QName
                  value:
                    fixedValue:
                      $type: StringTestValue
                qMgrName:
                  name: QMgrName
                  value:
                    fixedValue:
                      $type: StringTestValue
                subPoint:
                  name: SubPoint
                  value:
                    fixedValue:
                      $type: StringTestValue
                filter:
                  name: Filter
                  value:
                    fixedValue:
                      $type: StringTestValue
                subName:
                  name: SubName
                  value:
                    fixedValue:
                      $type: StringTestValue
                subUserData:
                  name: SubUserData
                  value:
                    fixedValue:
                      $type: StringTestValue
              jms:
                destination:
                  name: Destination
                  value:
                    fixedValue:
                      $type: StringTestValue
                replyTo:
                  name: Reply To
                  value:
                    fixedValue:
                      $type: StringTestValue
                timestamp:
                  name: Timestamp
                  value:
                    fixedValue:
                      $type: StringTestValue
                expiration:
                  name: Expiration
                  value:
                    fixedValue:
                      $type: StringTestValue
                correlationId:
                  name: Correlation Id
                  value:
                    fixedValue:
                      $type: StringTestValue
                priority:
                  name: Priority
                  value:
                    fixedValue:
                      $type: StringTestValue
                deliveryMode:
                  name: Delivery Mode
                  value:
                    fixedValue:
                      $type: StringTestValue
              mqQueueManager:
                ccsid:
                  name: CCSID
                  value:
                    fixedValue:
                      $type: StringTestValue
              mqSSL:
                peerName:
                  name: Peer Name
                  value:
                    fixedValue:
                      $type: StringTestValue
                cipherSuite:
                  $type: EnumNameValuePair
                  name: CipherSuite
                  value:
                    fixedValue:
                      $type: StringTestValue
              conn:
                keepAliveConnection: false
                putManagerId:
                  name: Put Manager Id
                  value:
                    fixedValue:
                      $type: StringTestValue
                getManagerId:
                  name: Get Manager Id
                  value:
                    fixedValue:
                      $type: StringTestValue
                channel:
                  name: Channel
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: CHANNEL1
                host:
                  name: Host
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: host
                port:
                  name: Port
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: 1414
                manager:
                  name: Queue Manager
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: queue.manager.1
                putQueue:
                  name: Put Queue
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: PutQueue
                getQueue:
                  name: Get Queue
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: GetQueue
                auth:
                  service:
                    name: Service
                    value:
                      fixedValue:
                        $type: StringTestValue
                  username:
                    name: Username
                    value:
                      fixedValue:
                        $type: StringTestValue
                  password:
                    name: Password
                    value:
                      fixedValue:
                        $type: PasswordTestValue
              mqpmMisc:
                applicationIdData:
                  name: Application ID data
                  value:
                    fixedValue:
                      $type: StringTestValue
                correlationID:
                  name: Correlation ID
                  value:
                    fixedValue:
                      $type: StringTestValue
                expiry:
                  name: Expiry (in tenths of a second)
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: -1
                messageSequenceNumber:
                  name: Message sequence number
                  value:
                    fixedValue:
                      $type: StringTestValue
                replyToQueueManagerName:
                  name: Reply queue manager name
                  value:
                    fixedValue:
                      $type: StringTestValue
                replyToQueueName:
                  name: Reply queue name
                  value:
                    fixedValue:
                      $type: StringTestValue
                putApplicationName:
                  name: Put application name
                  value:
                    fixedValue:
                      $type: StringTestValue
                applicationOriginData:
                  name: Originating application data
                  value:
                    fixedValue:
                      $type: StringTestValue
                userId:
                  name: User ID
                  value:
                    fixedValue:
                      $type: StringTestValue
              mqgmMisc:
                correlationID:
                  name: Correlation Id
                  value:
                    fixedValue:
                      $type: StringTestValue
                waitInterval:
                  name: Wait Interval(in milliseconds)
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: -1
            - $type: RMIProperties
              hostName:
                name: Host
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: Host
              portNumber:
                name: Port
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: Port
              bindingName:
                name: Binding
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: Binding
              remoteInterface:
                name: Remote Interface
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: Remote Interface
              methodName:
                name: Method Name
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: Method Name
            - $type: SMTPConnectionProperties
              port:
                name: Port
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: 25
              host:
                name: SMTP Host
                value:
                  fixedValue:
                    $type: StringTestValue
              user:
                name: Username
                value:
                  fixedValue:
                    $type: StringTestValue
              pass:
                name: Password
                value:
                  fixedValue:
                    $type: PasswordTestValue
                    password: AwAAAAA=
              fromEmail:
                name: From Email
                value:
                  fixedValue:
                    $type: StringTestValue
              toEmail:
                name: To Email
                value:
                  fixedValue:
                    $type: StringTestValue
              subject:
                name: Subject
                value:
                  fixedValue:
                    $type: StringTestValue
            - $type: TIBCOProperties
              timeLimit:
                name: Time Limit
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: 0
              service:
                name: ""
                value:
                  fixedValue:
                    $type: StringTestValue
              network:
                name: ""
                value:
                  fixedValue:
                    $type: StringTestValue
              daemon:
                name: DAEMON
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: DAEMON
              sendSubject:
                name: Send Subject
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: Send Subject
              replySubject:
                name: Reply Field Name
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: Reply Field Name
              sendFieldName:
                name: Send Field Name
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: Send Field Name
              replyFieldName:
                name: Reply Field Name
                value:
                  fixedValue:
                    $type: StringTestValue
                    value: Reply Field Name
            - $type: NoneTransportProperties
            - $type: CustomTransportProperties
              selected: 0
              configs:
              - $type: CustomTransportConfigurationImpl
                ConfigClassName: com.parasoft.soavirt.transport.socket.SocketTransport
                values:
                  customValueMap:
                  - charset
                  - $type: MultiValueCustomValue
                  - eof
                  - $type: MultiValueCustomValue
                  - host
                  - $type: MultiValueCustomValue
                  - port
                  - $type: MultiValueCustomValue
                className: com.parasoft.soavirt.transport.socket.SocketTransport
                name: TCP/IP Socket
          messageExchangePattern:
            inverted: true
        outputProviders:
          requestHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Request Transport Header
          responseHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Response Transport Header
          xmlRequestOutput:
            $type: NamedXMLToolOutputProvider
            outputTools:
            - $type: GenericDataBank
              dataSourceNames:
              - TestCases
              iconName: XMLDataBank
              name: JSON Data Bank
              wrappedTool:
                $type: XMLtoDataSource
                dataSourceNames:
                - TestCases
                iconName: XMLDataBank
                name: XML Data Bank
                selectedXPaths:
                - elementOption: 1
                  contentOption: 1
                  XMLDataBank_ExtractXPath: "/root/item/item[*]/name[../request]/text()"
                  mode: 1
                - elementOption: 1
                  contentOption: 1
                  XMLDataBank_ExtractXPath: "for $i in (1 to count(/root/item[1]/item[./request]))\r\
                    \nreturn\r\nif(exists(/root/item[1]/item[$i]/request[1]/url[1]/raw[1]))\r\
                    \nthen /root/item[1]/item[$i]/request[1]/url[1]/raw[1]/text()\r\
                    \nelse /root/item/item[$i]/request[1]/url[1]/text()"
                  mode: 1
                - elementOption: 1
                  contentOption: 1
                  XMLDataBank_ExtractXPath: "/root/item/item[*]/request[1]/method[1]/text()"
                  mode: 1
                - elementOption: 1
                  contentOption: 1
                  XMLDataBank_ExtractXPath: "for $index in (1 to count(/root/item[1]/item[./request]))\r\
                    \nreturn\r\n(if(exists(/root/item[1]/item[$index]/request[1]/body[1]/raw[1]))\r\
                    \nthen\r\n\t/root/item[1]/item[$index]/request[1]/body[1]/raw[1]/text()\r\
                    \nelse\r\n\t\"\")"
                  mode: 1
                - elementOption: 1
                  contentOption: 1
                  XMLDataBank_ExtractXPath: "for $index in (1 to count(/root/item[1]/item[./request]))\r\
                    \nreturn\r\nif (exists(/root/item[1]/item[$index]/request[1]/auth[1]/basic[1]/username[1]/text()))\r\
                    \nthen /root/item[1]/item[$index]/request[1]/auth[1]/basic[1]/username[1]/text()\r\
                    \nelse\r\n\"\""
                  mode: 1
                - elementOption: 1
                  contentOption: 1
                  XMLDataBank_ExtractXPath: "for $index in (1 to count(/root/item[1]/item[./request]))\r\
                    \nreturn\r\nif (exists(/root/item[1]/item[$index]/request[1]/auth[1]/basic[1]/password[1]/text()))\r\
                    \nthen /root/item[1]/item[$index]/request[1]/auth[1]/basic[1]/password[1]/text()\r\
                    \nelse\r\n\"\""
                  mode: 1
                - elementOption: 1
                  contentOption: 1
                  XMLDataBank_ExtractXPath: "for $index in (1 to count(/root/item[1]/item[./request]))\r\
                    \nreturn\r\nif (exists(/root/item[1]/item[$index]/request[1]/auth[1]/type/text()))\r\
                    \nthen /root/item[1]/item[$index]/request[1]/auth[1]/type/text()\r\
                    \nelse\r\n\"\""
                  mode: 1
                - elementOption: 1
                  contentOption: 1
                  XMLDataBank_ExtractXPath: "for $index in (1 to count(/root/item[1]/item[./request]))\r\
                    \nreturn\r\nif (exists(/root/item[1]/item[$index]/request[1]/auth[1]/digest[1]/username[1]/text()))\r\
                    \nthen /root/item[1]/item[$index]/request[1]/auth[1]/digest[1]/username[1]/text()\r\
                    \nelse\r\n\"\""
                  mode: 1
                - elementOption: 1
                  contentOption: 1
                  XMLDataBank_ExtractXPath: "for $index in (1 to count(/root/item[1]/item[./request]))\r\
                    \nreturn\r\nif (exists(//item[contains(name, \"${TestSuites: A}\"\
                    )]/item[1]/item[$index]/request[1]/auth[1]/digest[1]/username[1]/text()))\r\
                    \nthen //item[contains(name, \"${TestSuites: A}\")]/item[1]/item[$index]/request[1]/auth[1]/digest[1]/username[1]/text()\r\
                    \nelse\r\n\"\""
                  mode: 1
                - elementOption: 1
                  contentOption: 1
                  XMLDataBank_ExtractXPath: "for $index in (1 to count(/root/item[1]/item[./request]))\r\
                    \nreturn\r\nif(exists(/root/item[1]/item[$index]/request[1]/auth[1]/type[1]/text())\
                    \ and /root/item[1]/item[$index]/request[1]/auth[1]/type[1]/text()=\"\
                    basic\")\r\nthen \"true\"\r\nelse \"false\""
                  mode: 1
                extractMissingElements: true
                extractEmptyElements: true
                canonicalizeOutput: true
                xmlMessage: true
                virtualDSCreator:
                  writableColumns:
                  - dataSourceNames:
                    - "TestCases: Name"
                    testVariableName: x
                    mode: 2
                    customName: "Test 1: name"
                  - dataSourceNames:
                    - "TestCases: Endpoint"
                    testVariableName: x
                    mode: 2
                    customName: "Test 1: url"
                  - dataSourceNames:
                    - "TestCases: Method"
                    testVariableName: x
                    mode: 2
                    customName: Method
                  - dataSourceNames:
                    - "TestCases: Body"
                    testVariableName: x
                    mode: 2
                    customName: "Test 1: header"
                  - dataSourceNames:
                    - "TestCases: Basic_User"
                    testVariableName: x
                    mode: 2
                    customName: "Test 1: header"
                  - dataSourceNames:
                    - "TestCases: Basic_Pass"
                    testVariableName: x
                    mode: 2
                    customName: "Test 1: type"
                  - dataSourceNames:
                    - "TestCases: Auth_Type"
                    testVariableName: x
                    mode: 2
                    customName: "Test 1: type"
                  - dataSourceNames:
                    - "TestCases: Digest_User"
                    testVariableName: x
                    mode: 2
                    customName: "Test 1: username"
                  - dataSourceNames:
                    - "TestCases: Digest_Pass"
                    testVariableName: x
                    mode: 2
                    customName: "Test 1: password"
                  - dataSourceNames:
                    - "TestCases: Auth_Enabled"
                    testVariableName: x
                    mode: 2
                    customName: "Test 1: item[1]"
              conversionStrategy:
                dataFormatName: JSON
                conversionStrategyId: JSON
                conversionStrategyClassName: com.parasoft.xml.convert.json.JsonConversionStrategy
            menuName: Traffic
            name: Request Traffic
          trafficOutput:
            m_name: Traffic Stream
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Traffic Viewer
              showRequestHeaders: true
              showResponseHeaders: true
            name: Traffic Object
        literal:
          use: 1
          text:
            MessagingClient_LiteralMessage: "${fullMessage}"
            type: text/json
          dataSource:
            columnName: File Contents
        mode: Literal
    - $type: TestSuite
      name: Create Test Cases
      testID: 97
      testLogicVariables:
      - $type: TestLogicString
        name: header
        value:
          $type: TestLogicVariableString
          originalValue: ""
          value: ""
      - $type: TestLogicString
        name: body
        value:
          $type: TestLogicVariableString
          originalValue: ""
          value: ""
      runMode: 1
      tests:
      - $type: HTTPClientToolTest
        name: Messaging Client 3
        testID: 98
        tool:
          $type: HTTPClient
          dataSourceNames:
          - Postman Collection
          iconName: HTTPClient
          name: Full Message
          formJson:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: :root
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                attributes:
                - replacedColumn: ""
                  value:
                    $type: StringValue
                    replacedColumn: ""
                    value: object
                    xmlEncoding: 2
                  useValue: true
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
            elementTypeName: root
          hasServiceInfo: true
          serviceInfo:
            serviceDescriptor:
              $type: StandardServiceDescriptor
              location: ""
          jsonBuilder:
            hasValue: true
            value:
              $type: JSONObjectValue
              nameIsNull: true
          formInput:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: ":"
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
          jmsMessageOutputProvider:
            $type: JMSMessageOutputProvider
            jmsOutputProviderRequest:
              $type: JMSOutputProvider
              name: Request Object
              menuName: Object
            jmsOutputProviderResponse:
              $type: JMSOutputProvider
              name: Response Message Object
              menuName: Message Object
          transportProperties:
            manager:
              protocol: 10
              properties:
              - $type: HTTPClientHTTPProperties
                followRedirects:
                  bool: true
                common:
                  auth:
                    useDefault: false
                    customType: 1
                  method:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: HTTPMethodTestValue
                      method: POST
                keepAlive1_1:
                  bool: true
              - $type: HTTPClientHTTPProperties
                followRedirects:
                  bool: true
                common:
                  auth:
                    useDefault: false
                    customType: 1
                  method:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: HTTPMethodTestValue
                      method: POST
                protocol: 1
                keepAlive1_1:
                  bool: true
              - $type: JNDIProperties
                msgExpiration:
                  $type: JMSMessageExpiration
                bytesMessageReadMethod:
                  string: readUTF()
                responseCorrelation:
                  correlationId:
                    name: JMSCorrelationID
                    value:
                      values:
                      - $type: ScriptedValue
                      fixedValue:
                        $type: StringTestValue
                  messageSelector: ""
                queueProperties:
                  jmsDestination:
                    name: JMSDestination
                    value:
                      values:
                      - $type: ScriptedValue
                      fixedValue:
                        $type: StringTestValue
                        value: JMS_RequestQueue
                  jmsReplyTo:
                    name: JMSReplyTo
                    value:
                      values:
                      - $type: ScriptedValue
                      fixedValue:
                        $type: StringTestValue
                        value: JMS_ResponseQueue
                msgType:
                  string: javax.jms.TextMessage
                useP2P:
                  bool: true
                connProperties:
                  jmsFactory:
                    name: Connection Factory
                    value:
                      fixedValue:
                        $type: StringTestValue
                        value: MQ_JMS_MANAGER
                  jndiFactory:
                    name: Initial Context
                    value:
                      fixedValue:
                        $type: StringTestValue
                        value: com.sun.jndi.fscontext.RefFSContextFactory
                  providerURL:
                    name: Provider URL
                    value:
                      fixedValue:
                        $type: StringTestValue
                        value: file:/C:/JNDI-Directory
                  auth:
                    service:
                      name: Service
                      value:
                        fixedValue:
                          $type: StringTestValue
                    username:
                      name: Username
                      value:
                        fixedValue:
                          $type: StringTestValue
                    password:
                      name: Password
                      value:
                        fixedValue:
                          $type: PasswordTestValue
                useSync: true
              - $type: SonicMQJNDIProperties
                msgExpiration:
                  $type: JMSMessageExpiration
                bytesMessageReadMethod:
                  string: readUTF()
                responseCorrelation:
                  correlationId:
                    name: JMSCorrelationID
                    value:
                      values:
                      - $type: ScriptedValue
                      fixedValue:
                        $type: StringTestValue
                  messageSelector: ""
                queueProperties:
                  jmsDestination:
                    name: JMSDestination
                    value:
                      values:
                      - $type: ScriptedValue
                      fixedValue:
                        $type: StringTestValue
                        value: JMS_RequestQueue
                  jmsReplyTo:
                    name: JMSReplyTo
                    value:
                      values:
                      - $type: ScriptedValue
                      fixedValue:
                        $type: StringTestValue
                        value: JMS_ResponseQueue
                msgType:
                  string: progress.message.jclient.MultipartMessage
                useP2P:
                  bool: true
                connProperties:
                  initialContextProps:
                  - name: java.naming.security.credentials
                    value:
                      fixedValue:
                        $type: StringTestValue
                        value: Administrator
                  - name: java.naming.security.principal
                    value:
                      fixedValue:
                        $type: StringTestValue
                        value: Administrator
                  jmsFactory:
                    name: Connection Factory
                    value:
                      fixedValue:
                        $type: StringTestValue
                        value: ConnectionFactory
                  jndiFactory:
                    name: Initial Context
                    value:
                      fixedValue:
                        $type: StringTestValue
                        value: com.sonicsw.jndi.mfcontext.MFContextFactory
                  providerURL:
                    name: Provider URL
                    value:
                      fixedValue:
                        $type: StringTestValue
                        value: "tcp://[hostname]:2506"
                  auth:
                    service:
                      name: Service
                      value:
                        fixedValue:
                          $type: StringTestValue
                    username:
                      name: Username
                      value:
                        fixedValue:
                          $type: StringTestValue
                          value: Administrator
                    password:
                      name: Password
                      value:
                        fixedValue:
                          $type: PasswordTestValue
                useSync: true
                partContentID:
                  string: part1
              - $type: MQProperties
                mqrfh2fields:
                  version:
                    name: Version
                    value:
                      fixedValue:
                        $type: StringTestValue
                  encoding:
                    name: Encoding
                    value:
                      fixedValue:
                        $type: StringTestValue
                  codedCharSetId:
                    name: CodedCharSetId
                    value:
                      fixedValue:
                        $type: StringTestValue
                  format:
                    name: Format
                    value:
                      fixedValue:
                        $type: StringTestValue
                  flags:
                    name: Flags
                    value:
                      fixedValue:
                        $type: StringTestValue
                  nameValueCodedCharSetId:
                    name: NameValueCodedCharSetId
                    value:
                      fixedValue:
                        $type: StringTestValue
                mcd:
                  msd:
                    name: Message Service Domain
                    value:
                      fixedValue:
                        $type: StringTestValue
                  set:
                    name: Message Set
                    value:
                      fixedValue:
                        $type: StringTestValue
                  type:
                    name: Message Type
                    value:
                      fixedValue:
                        $type: StringTestValue
                  fmt:
                    name: Output Format
                    value:
                      fixedValue:
                        $type: StringTestValue
                psc:
                  subIdentity:
                    name: SubIdentity
                    value:
                      fixedValue:
                        $type: StringTestValue
                  qName:
                    name: QName
                    value:
                      fixedValue:
                        $type: StringTestValue
                  qMgrName:
                    name: QMgrName
                    value:
                      fixedValue:
                        $type: StringTestValue
                  subPoint:
                    name: SubPoint
                    value:
                      fixedValue:
                        $type: StringTestValue
                  filter:
                    name: Filter
                    value:
                      fixedValue:
                        $type: StringTestValue
                  subName:
                    name: SubName
                    value:
                      fixedValue:
                        $type: StringTestValue
                  subUserData:
                    name: SubUserData
                    value:
                      fixedValue:
                        $type: StringTestValue
                jms:
                  destination:
                    name: Destination
                    value:
                      fixedValue:
                        $type: StringTestValue
                  replyTo:
                    name: Reply To
                    value:
                      fixedValue:
                        $type: StringTestValue
                  timestamp:
                    name: Timestamp
                    value:
                      fixedValue:
                        $type: StringTestValue
                  expiration:
                    name: Expiration
                    value:
                      fixedValue:
                        $type: StringTestValue
                  correlationId:
                    name: Correlation Id
                    value:
                      fixedValue:
                        $type: StringTestValue
                  priority:
                    name: Priority
                    value:
                      fixedValue:
                        $type: StringTestValue
                  deliveryMode:
                    name: Delivery Mode
                    value:
                      fixedValue:
                        $type: StringTestValue
                mqQueueManager:
                  ccsid:
                    name: CCSID
                    value:
                      fixedValue:
                        $type: StringTestValue
                mqSSL:
                  peerName:
                    name: Peer Name
                    value:
                      fixedValue:
                        $type: StringTestValue
                  cipherSuite:
                    $type: EnumNameValuePair
                    name: CipherSuite
                    value:
                      fixedValue:
                        $type: StringTestValue
                conn:
                  keepAliveConnection: false
                  putManagerId:
                    name: Put Manager Id
                    value:
                      fixedValue:
                        $type: StringTestValue
                  getManagerId:
                    name: Get Manager Id
                    value:
                      fixedValue:
                        $type: StringTestValue
                  channel:
                    name: Channel
                    value:
                      fixedValue:
                        $type: StringTestValue
                        value: CHANNEL1
                  host:
                    name: Host
                    value:
                      fixedValue:
                        $type: StringTestValue
                        value: host
                  port:
                    name: Port
                    value:
                      fixedValue:
                        $type: StringTestValue
                        value: 1414
                  manager:
                    name: Queue Manager
                    value:
                      fixedValue:
                        $type: StringTestValue
                        value: queue.manager.1
                  putQueue:
                    name: Put Queue
                    value:
                      fixedValue:
                        $type: StringTestValue
                        value: PutQueue
                  getQueue:
                    name: Get Queue
                    value:
                      fixedValue:
                        $type: StringTestValue
                        value: GetQueue
                  auth:
                    service:
                      name: Service
                      value:
                        fixedValue:
                          $type: StringTestValue
                    username:
                      name: Username
                      value:
                        fixedValue:
                          $type: StringTestValue
                    password:
                      name: Password
                      value:
                        fixedValue:
                          $type: PasswordTestValue
                mqpmMisc:
                  applicationIdData:
                    name: Application ID data
                    value:
                      fixedValue:
                        $type: StringTestValue
                  correlationID:
                    name: Correlation ID
                    value:
                      fixedValue:
                        $type: StringTestValue
                  expiry:
                    name: Expiry (in tenths of a second)
                    value:
                      fixedValue:
                        $type: StringTestValue
                        value: -1
                  messageSequenceNumber:
                    name: Message sequence number
                    value:
                      fixedValue:
                        $type: StringTestValue
                  replyToQueueManagerName:
                    name: Reply queue manager name
                    value:
                      fixedValue:
                        $type: StringTestValue
                  replyToQueueName:
                    name: Reply queue name
                    value:
                      fixedValue:
                        $type: StringTestValue
                  putApplicationName:
                    name: Put application name
                    value:
                      fixedValue:
                        $type: StringTestValue
                  applicationOriginData:
                    name: Originating application data
                    value:
                      fixedValue:
                        $type: StringTestValue
                  userId:
                    name: User ID
                    value:
                      fixedValue:
                        $type: StringTestValue
                mqgmMisc:
                  correlationID:
                    name: Correlation Id
                    value:
                      fixedValue:
                        $type: StringTestValue
                  waitInterval:
                    name: Wait Interval(in milliseconds)
                    value:
                      fixedValue:
                        $type: StringTestValue
                        value: -1
              - $type: RMIProperties
                hostName:
                  name: Host
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: Host
                portNumber:
                  name: Port
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: Port
                bindingName:
                  name: Binding
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: Binding
                remoteInterface:
                  name: Remote Interface
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: Remote Interface
                methodName:
                  name: Method Name
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: Method Name
              - $type: SMTPConnectionProperties
                port:
                  name: Port
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: 25
                host:
                  name: SMTP Host
                  value:
                    fixedValue:
                      $type: StringTestValue
                user:
                  name: Username
                  value:
                    fixedValue:
                      $type: StringTestValue
                pass:
                  name: Password
                  value:
                    fixedValue:
                      $type: PasswordTestValue
                      password: AwAAAAA=
                fromEmail:
                  name: From Email
                  value:
                    fixedValue:
                      $type: StringTestValue
                toEmail:
                  name: To Email
                  value:
                    fixedValue:
                      $type: StringTestValue
                subject:
                  name: Subject
                  value:
                    fixedValue:
                      $type: StringTestValue
              - $type: TIBCOProperties
                timeLimit:
                  name: Time Limit
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: 0
                service:
                  name: ""
                  value:
                    fixedValue:
                      $type: StringTestValue
                network:
                  name: ""
                  value:
                    fixedValue:
                      $type: StringTestValue
                daemon:
                  name: DAEMON
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: DAEMON
                sendSubject:
                  name: Send Subject
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: Send Subject
                replySubject:
                  name: Reply Field Name
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: Reply Field Name
                sendFieldName:
                  name: Send Field Name
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: Send Field Name
                replyFieldName:
                  name: Reply Field Name
                  value:
                    fixedValue:
                      $type: StringTestValue
                      value: Reply Field Name
              - $type: NoneTransportProperties
              - $type: CustomTransportProperties
                selected: 0
                configs:
                - $type: CustomTransportConfigurationImpl
                  ConfigClassName: com.parasoft.soavirt.transport.socket.SocketTransport
                  values:
                    customValueMap:
                    - charset
                    - $type: MultiValueCustomValue
                    - eof
                    - $type: MultiValueCustomValue
                    - host
                    - $type: MultiValueCustomValue
                    - port
                    - $type: MultiValueCustomValue
                  className: com.parasoft.soavirt.transport.socket.SocketTransport
                  name: TCP/IP Socket
            messageExchangePattern:
              inverted: true
          outputProviders:
            requestHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Request Transport Header
            responseHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Response Transport Header
            xmlRequestOutput:
              $type: NamedXMLToolOutputProvider
              outputTools:
              - $type: GenericDataBank
                dataSourceNames:
                - TestCases
                iconName: XMLDataBank
                name: JSON Data Bank
                wrappedTool:
                  $type: XMLtoDataSource
                  dataSourceNames:
                  - TestCases
                  iconName: XMLDataBank
                  name: XML Data Bank
                  selectedXPaths:
                  - elementOption: 1
                    contentOption: 2
                    XMLDataBank_ExtractXPath: "//item[./name/text() = \"${TestCases:\
                      \ Name}\"]/request[1]/header[1]/item[*]"
                    mode: 1
                  - elementOption: 1
                    contentOption: 1
                    XMLDataBank_ExtractXPath: "//item[name=\"${TestCases: Name}\"\
                      ]/request[1]/auth[1]/bearer[1]/item[1]/value[1]/text()"
                    mode: 1
                  extractMissingElements: true
                  extractEmptyElements: true
                  canonicalizeOutput: true
                  xmlMessage: true
                  virtualDSCreator:
                    writableColumns:
                    - dataSourceNames:
                      - "TestCases: Basic_Enabled"
                      testVariableName: header
                      mode: 3
                      customName: headers
                    - dataSourceNames:
                      - "TestCases: Auth_Enabled"
                      testVariableName: body
                      customName: TokenName
                conversionStrategy:
                  dataFormatName: JSON
                  conversionStrategyId: JSON
                  conversionStrategyClassName: com.parasoft.xml.convert.json.JsonConversionStrategy
              menuName: Traffic
              name: Request Traffic
            trafficOutput:
              m_name: Traffic Stream
            objectOutput:
              $type: ObjectOutputProvider
              outputTools:
              - $type: TrafficViewer
                iconName: TrafficViewer
                name: Traffic Viewer
                showRequestHeaders: true
                showResponseHeaders: true
              name: Traffic Object
          literal:
            use: 1
            text:
              MessagingClient_LiteralMessage: "${fullMessage}"
              type: text/json
            dataSource:
              columnName: File Contents
          mode: Literal
      - $type: ToolTest
        name: Extension Tool 3
        testFlowLogic:
          dependencyLogic:
            success: 0
        testID: 99
        tool:
          $type: MethodTool
          dataSourceNames:
          - Postman Collection
          iconName: Method
          name: Extension Tool 3
          method:
            hasCode: true
            code:
              $type: ScriptCode
              input:
                useText: true
                textInput:
                  $type: ScriptingTextInput
                  text: "import com.parasoft.api.*;\r\n\r\npublic void fixHeaders(Object\
                    \ input, ExtensionToolContext context){\r\n\t// [{\"key\":\"my-sample-header\"\
                    ,\"value\":\"Lorem ipsum dolor sit amet\",\"description\":\"\"\
                    },{\"key\":\"my-sample-header2\",\"value\":\"some other Latin\
                    \ stuff\",\"description\":\"\"}]\r\n\t\r\n\tString header = context.getValue(\"\
                    header\");\r\n\t\r\n\tString body = context.getValue(\"TestCases\"\
                    ,\"Body\");\r\n\tif(!body.equals(\"urlencoded\"))\r\n\t{\r\n\t\
                    \tcontext.setValue(\"body\",body);\r\n\t}\r\n\telse\r\n\t{\r\n\
                    \t\tString newBody = context.getValue(\"Generated Data Source\"\
                    ,\"urlencoded\");\r\n\t\tApplication.showMessage(\"URL Encoded\
                    \ Body: \" + newBody);\r\n\t\t//StringTokenizer st = new StringTokenizer(newBody,\"\
                    },\");\r\n\t\tString[] list = newBody.split(\"\\\"}\")\r\n\t\t\
                    String create = \"\";\r\n\t\tfor(int i=0; i < list.size(); i++)\r\
                    \n\t\t{\r\n\t\t\tString val = list[i];\r\n\t\t\t//Application.showMessage(val);\r\
                    \n\t\t\tif(val.equals(\"]\"))\r\n\t\t\t\tdoNothing();\r\n\t\t\t\
                    else\r\n\t\t\t{\r\n\t\t\t\tcreate += val.substring((val.indexOf(\"\
                    key\\\":\") + 6), val.indexOf(\"\\\",\\\"value\"));\r\n\t\t\t\t\
                    create += \"=\";\r\n\t\t\t\tcreate += val.substring((val.indexOf(\"\
                    value\\\":\") + 8), val.indexOf(\"\\\",\\\"type\"));\r\n\t\t\t\
                    \tif(i < list.size() - 2)\r\n\t\t\t\t\tcreate += \"&\";\r\n\t\t\
                    \t}\r\n\t\t}\r\n\r\n\t\tcontext.setValue(\"body\",create);\r\n\
                    \t}\r\n\t\r\n\tif(header.equals(\"0\")) return;\r\n\t\r\n\theader\
                    \ = header.replaceAll(\"\\\\[\",\"\");\r\n\theader = header.replaceAll(\"\
                    \\\\]\",\"\");\r\n\t\r\n\t//Application.showMessage(header);\r\
                    \n\tStringTokenizer st = new StringTokenizer(header,\"\\\\},\\\
                    \\{\");\r\n\theader = \"\";\r\n\t\r\n\twhile(st.hasMoreTokens())\r\
                    \n\t{\r\n\t\tString temp = st.nextToken();\r\n\t\t//Application.showMessage(temp);\r\
                    \n\t\ttemp = temp.replaceAll(\"\\\"\",\"\");\r\n\t\tif(temp.contains(\"\
                    Authorization\"))\r\n\t\t{\r\n\t\t\ttemp = st.nextToken();\r\n\
                    \t\t\tif(temp.contains(\"OAuth\"))\r\n\t\t\t\theader = header\
                    \ + \"Authorization: \" + temp.substring(temp.indexOf(\":\") +\
                    \ 1) + \"\\n\";\r\n\t\t}\r\n\t\telse if(temp.startsWith(\"key\"\
                    ))\r\n\t\t\theader = header + temp.substring(temp.indexOf(\":\"\
                    ) + 1) + \":\";\r\n\t\telse if(temp.startsWith(\"value\"))\r\n\
                    \t\t\theader = header + temp.substring(temp.indexOf(\":\") + 1)\
                    \ + \"\\n\";\r\n\t\telse if(temp.startsWith(\"description\"))\r\
                    \n\t\t\tdoNothing();\r\n\t\t\t\r\n\t\t//Application.showMessage(header);\r\
                    \n\t}\r\n\tcontext.setValue(\"header\",header);\r\n}\r\n\r\npublic\
                    \ void doNothing()\r\n{\r\n\treturn;\r\n}"
            hasMethodId: true
            methodId:
              $type: ScriptMethodIdentifier
              functionName: fixHeaders
              arguments:
              - java.lang.Object
              - com.parasoft.api.ExtensionToolContext
        writeInput: true
        inputType: InputUsable
        input:
          use: 1
          text:
            text: ""
            type: text/plain
          dataSource:
            columnName: File Contents
      - $type: RESTClientToolTest
        name: Create Test Cases 2
        testFlowLogic:
          variableCondition:
            variableCondition: true
            variableConditionObj:
              $type: StringCondition
              name: testCaseName
              condition: 1
              value: 0
        testID: 164
        tool:
          $type: RESTClient
          dataSourceNames:
          - TestCases
          iconName: RESTClient
          name: Create Test Cases 2
          formJson:
            builtFromSchema: true
            value:
              $type: ElementValue
              writeType: true
              type:
                $type: ElementType
                localName: root
                bodyType:
                  $type: ComplexType
                  attributes:
                  - ns: ""
                    name: type
                    defaultValue: object
                    fixed: object
                    contentType:
                      $type: StringType
                      _id: 1
                    required: true
                  name: /components/schemas/restClientsRequest
                  compositor: true
                  compositorObj:
                    $type: AllCompositor
                    types:
                    - $type: ElementType
                      minOccurs: 0
                      localName: dataSource
                      bodyType:
                        $type: ComplexType
                        _id: 2
                        attributes:
                        - ns: ""
                          name: type
                          defaultValue: string
                          fixed: string
                          contentType:
                            $type: StringType
                            _ref: 1
                          required: true
                        content: true
                        contentObj:
                          $type: StringType
                          _ref: 1
                        namespace: urn:parasoft:json
                        name: string
                        compositor: true
                        compositorObj:
                          $type: SequenceCompositor
                    - $type: ElementType
                      minOccurs: 0
                      localName: header
                      bodyType:
                        $type: ComplexType
                        attributes:
                        - ns: ""
                          name: type
                          defaultValue: object
                          fixed: object
                          contentType:
                            $type: StringType
                            _ref: 1
                          required: true
                        name: /components/schemas/header
                        compositor: true
                        compositorObj:
                          $type: AllCompositor
                          types:
                          - $type: ElementType
                            minOccurs: 0
                            localName: method
                            bodyType:
                              $type: ComplexType
                              attributes:
                              - ns: ""
                                name: type
                                defaultValue: object
                                fixed: object
                                contentType:
                                  $type: StringType
                                  _ref: 1
                                required: true
                              name: /components/schemas/restHttpMethod
                              compositor: true
                              compositorObj:
                                $type: AllCompositor
                                types:
                                - $type: ElementType
                                  minOccurs: 0
                                  localName: methodType
                                  bodyType:
                                    $type: ComplexType
                                    attributes:
                                    - ns: ""
                                      name: type
                                      defaultValue: enum
                                      fixed: enum
                                      contentType:
                                        $type: StringType
                                        _ref: 1
                                      required: true
                                    content: true
                                    contentObj:
                                      $type: EnumType
                                      values:
                                      - '"GET"'
                                      - '"POST"'
                                      - '"OPTIONS"'
                                      - '"HEAD"'
                                      - '"PUT"'
                                      - '"DELETE"'
                                      - '"TRACE"'
                                      - '"CUSTOM"'
                                      baseType: anonymous
                                    name: /components/schemas/methodType
                                    compositor: true
                                    compositorObj:
                                      $type: SequenceCompositor
                                - $type: ElementType
                                  minOccurs: 0
                                  localName: value
                                  bodyType:
                                    $type: ComplexType
                                    _ref: 2
                    - $type: ElementType
                      minOccurs: 0
                      localName: httpOptions
                      bodyType:
                        $type: ComplexType
                        attributes:
                        - ns: ""
                          name: type
                          defaultValue: object
                          fixed: object
                          contentType:
                            $type: StringType
                            _ref: 1
                          required: true
                        name: /components/schemas/httpOptions
                        compositor: true
                        compositorObj:
                          $type: AllCompositor
                          types:
                          - $type: ElementType
                            localName: transport
                            bodyType:
                              $type: ComplexType
                              attributes:
                              - ns: ""
                                name: type
                                defaultValue: object
                                fixed: object
                                contentType:
                                  $type: StringType
                                  _ref: 1
                                required: true
                              name: /components/schemas/restTransport
                              compositor: true
                              compositorObj:
                                $type: AllCompositor
                                types:
                                - $type: ElementType
                                  minOccurs: 0
                                  localName: type
                                  bodyType:
                                    $type: ComplexType
                                    attributes:
                                    - ns: ""
                                      name: type
                                      defaultValue: enum
                                      fixed: enum
                                      contentType:
                                        $type: StringType
                                        _ref: 1
                                      required: true
                                    content: true
                                    contentObj:
                                      $type: EnumType
                                      values:
                                      - '"http10"'
                                      - '"http11"'
                                      - '"none"'
                                      baseType: anonymous
                                    name: /components/schemas/restTransportType
                                    compositor: true
                                    compositorObj:
                                      $type: SequenceCompositor
                                - $type: ElementType
                                  minOccurs: 0
                                  localName: http10
                                  bodyType:
                                    $type: ComplexType
                                    attributes:
                                    - ns: ""
                                      name: type
                                      defaultValue: object
                                      fixed: object
                                      contentType:
                                        $type: StringType
                                        _ref: 1
                                      required: true
                                    name: /components/schemas/http10
                                    compositor: true
                                    compositorObj:
                                      $type: AllCompositor
                                      types:
                                      - $type: ElementType
                                        minOccurs: 0
                                        localName: cookieSettings
                                        bodyType:
                                          $type: ComplexType
                                          _id: 3
                                          attributes:
                                          - ns: ""
                                            name: type
                                            defaultValue: object
                                            fixed: object
                                            contentType:
                                              $type: StringType
                                              _ref: 1
                                            required: true
                                          name: /components/schemas/cookieSettings
                                          compositor: true
                                          compositorObj:
                                            $type: AllCompositor
                                            types:
                                            - $type: ElementType
                                              minOccurs: 0
                                              localName: mode
                                              bodyType:
                                                $type: ComplexType
                                                attributes:
                                                - ns: ""
                                                  name: type
                                                  defaultValue: enum
                                                  fixed: enum
                                                  contentType:
                                                    $type: StringType
                                                    _ref: 1
                                                  required: true
                                                content: true
                                                contentObj:
                                                  $type: EnumType
                                                  values:
                                                  - '"Default"'
                                                  - '"Custom"'
                                                  baseType: anonymous
                                                name: /components/schemas/soapMode
                                                compositor: true
                                                compositorObj:
                                                  $type: SequenceCompositor
                                            - $type: ElementType
                                              minOccurs: 0
                                              localName: reset
                                              bodyType:
                                                $type: ComplexType
                                                _id: 4
                                                attributes:
                                                - ns: ""
                                                  name: type
                                                  defaultValue: boolean
                                                  fixed: boolean
                                                  contentType:
                                                    $type: StringType
                                                    _ref: 1
                                                  required: true
                                                content: true
                                                contentObj:
                                                  $type: BooleanType
                                                namespace: urn:parasoft:json
                                                name: boolean
                                                compositor: true
                                                compositorObj:
                                                  $type: SequenceCompositor
                                      - $type: ElementType
                                        minOccurs: 0
                                        localName: generalSettings
                                        bodyType:
                                          $type: ComplexType
                                          _id: 5
                                          attributes:
                                          - ns: ""
                                            name: type
                                            defaultValue: object
                                            fixed: object
                                            contentType:
                                              $type: StringType
                                              _ref: 1
                                            required: true
                                          name: /components/schemas/generalSettings
                                          compositor: true
                                          compositorObj:
                                            $type: AllCompositor
                                            types:
                                            - $type: ElementType
                                              minOccurs: 0
                                              localName: connectionMode
                                              bodyType:
                                                $type: ComplexType
                                                attributes:
                                                - ns: ""
                                                  name: type
                                                  defaultValue: enum
                                                  fixed: enum
                                                  contentType:
                                                    $type: StringType
                                                    _ref: 1
                                                  required: true
                                                content: true
                                                contentObj:
                                                  $type: EnumType
                                                  values:
                                                  - '"CONNECTION_KEEP_ALIVE"'
                                                  - '"CONNECTION_CLOSE"'
                                                  baseType: anonymous
                                                name: /components/schemas/connectionMode
                                                compositor: true
                                                compositorObj:
                                                  $type: SequenceCompositor
                                            - $type: ElementType
                                              minOccurs: 0
                                              localName: gzipRequest
                                              bodyType:
                                                $type: ComplexType
                                                _ref: 4
                                            - $type: ElementType
                                              minOccurs: 0
                                              localName: decompressResponse
                                              bodyType:
                                                $type: ComplexType
                                                _ref: 4
                                            - $type: ElementType
                                              minOccurs: 0
                                              localName: followHttpRedirects
                                              bodyType:
                                                $type: ComplexType
                                                _ref: 4
                                      - $type: ElementType
                                        minOccurs: 0
                                        localName: httpHeaders
                                        bodyType:
                                          $type: ComplexType
                                          _id: 6
                                          attributes:
                                          - ns: ""
                                            name: type
                                            defaultValue: object
                                            fixed: object
                                            contentType:
                                              $type: StringType
                                              _ref: 1
                                            required: true
                                          name: /components/schemas/httpHeaders
                                          compositor: true
                                          compositorObj:
                                            $type: AllCompositor
                                            types:
                                            - $type: ElementType
                                              minOccurs: 0
                                              localName: type
                                              bodyType:
                                                $type: ComplexType
                                                attributes:
                                                - ns: ""
                                                  name: type
                                                  defaultValue: enum
                                                  fixed: enum
                                                  contentType:
                                                    $type: StringType
                                                    _ref: 1
                                                  required: true
                                                content: true
                                                contentObj:
                                                  $type: EnumType
                                                  values:
                                                  - '"literal"'
                                                  - '"table"'
                                                  baseType: anonymous
                                                name: /components/schemas/httpHeadersType
                                                compositor: true
                                                compositorObj:
                                                  $type: SequenceCompositor
                                            - $type: ElementType
                                              minOccurs: 0
                                              localName: httpHeadersTable
                                              bodyType:
                                                $type: ComplexType
                                                attributes:
                                                - ns: ""
                                                  name: type
                                                  defaultValue: object
                                                  fixed: object
                                                  contentType:
                                                    $type: StringType
                                                    _ref: 1
                                                  required: true
                                                name: /components/schemas/httpHeadersTable
                                                compositor: true
                                                compositorObj:
                                                  $type: AllCompositor
                                                  types:
                                                  - $type: ElementType
                                                    localName: rows
                                                    bodyType:
                                                      $type: ComplexType
                                                      attributes:
                                                      - ns: ""
                                                        name: type
                                                        defaultValue: array
                                                        fixed: array
                                                        contentType:
                                                          $type: StringType
                                                          _ref: 1
                                                        required: true
                                                      name: /components/schemas/httpHeadersTable/properties/rows
                                                      compositor: true
                                                      compositorObj:
                                                        $type: SequenceCompositor
                                                        types:
                                                        - $type: ElementType
                                                          minOccurs: 0
                                                          maxOccurs: -1
                                                          localName: item
                                                          bodyType:
                                                            $type: ComplexType
                                                            attributes:
                                                            - ns: ""
                                                              name: type
                                                              defaultValue: object
                                                              fixed: object
                                                              contentType:
                                                                $type: StringType
                                                                _ref: 1
                                                              required: true
                                                            name: /components/schemas/nameComplexValue
                                                            compositor: true
                                                            compositorObj:
                                                              $type: AllCompositor
                                                              types:
                                                              - $type: ElementType
                                                                localName: name
                                                                bodyType:
                                                                  $type: ComplexType
                                                                  _ref: 2
                                                              - $type: ElementType
                                                                localName: value
                                                                bodyType:
                                                                  $type: ComplexType
                                                                  _id: 7
                                                                  attributes:
                                                                  - ns: ""
                                                                    name: type
                                                                    defaultValue: object
                                                                    fixed: object
                                                                    contentType:
                                                                      $type: StringType
                                                                      _ref: 1
                                                                    required: true
                                                                  name: /components/schemas/complexValueFPS
                                                                  compositor: true
                                                                  compositorObj:
                                                                    $type: AllCompositor
                                                                    types:
                                                                    - $type: ElementType
                                                                      minOccurs: 0
                                                                      localName: type
                                                                      bodyType:
                                                                        $type: ComplexType
                                                                        attributes:
                                                                        - ns: ""
                                                                          name: type
                                                                          defaultValue: enum
                                                                          fixed: enum
                                                                          contentType:
                                                                            $type: StringType
                                                                            _ref: 1
                                                                          required: true
                                                                        content: true
                                                                        contentObj:
                                                                          $type: EnumType
                                                                          values:
                                                                          - '"fixed"'
                                                                          - '"parameterized"'
                                                                          - '"scripted"'
                                                                          baseType: anonymous
                                                                        name: /components/schemas/complexValueFPSType
                                                                        compositor: true
                                                                        compositorObj:
                                                                          $type: SequenceCompositor
                                                                    - $type: ElementType
                                                                      minOccurs: 0
                                                                      localName: fixed
                                                                      bodyType:
                                                                        $type: ComplexType
                                                                        _ref: 2
                                                                    - $type: ElementType
                                                                      minOccurs: 0
                                                                      localName: parameterized
                                                                      bodyType:
                                                                        $type: ComplexType
                                                                        _id: 8
                                                                        attributes:
                                                                        - ns: ""
                                                                          name: type
                                                                          defaultValue: object
                                                                          fixed: object
                                                                          contentType:
                                                                            $type: StringType
                                                                            _ref: 1
                                                                          required: true
                                                                        name: /components/schemas/parameterized
                                                                        compositor: true
                                                                        compositorObj:
                                                                          $type: AllCompositor
                                                                          types:
                                                                          - $type: ElementType
                                                                            minOccurs: 0
                                                                            localName: columnName
                                                                            bodyType:
                                                                              $type: ComplexType
                                                                              _ref: 2
                                                                    - $type: ElementType
                                                                      minOccurs: 0
                                                                      localName: scripted
                                                                      bodyType:
                                                                        $type: ComplexType
                                                                        attributes:
                                                                        - ns: ""
                                                                          name: type
                                                                          defaultValue: object
                                                                          fixed: object
                                                                          contentType:
                                                                            $type: StringType
                                                                            _ref: 1
                                                                          required: true
                                                                        name: /components/schemas/scripted
                                                                        compositor: true
                                                                        compositorObj:
                                                                          $type: AllCompositor
                                                                          types:
                                                                          - $type: ElementType
                                                                            minOccurs: 0
                                                                            localName: language
                                                                            bodyType:
                                                                              $type: ComplexType
                                                                              _ref: 2
                                                                          - $type: ElementType
                                                                            minOccurs: 0
                                                                            localName: method
                                                                            bodyType:
                                                                              $type: ComplexType
                                                                              attributes:
                                                                              - ns: ""
                                                                                name: type
                                                                                defaultValue: object
                                                                                fixed: object
                                                                                contentType:
                                                                                  $type: StringType
                                                                                  _ref: 1
                                                                                required: true
                                                                              name: /components/schemas/method
                                                                              compositor: true
                                                                              compositorObj:
                                                                                $type: AllCompositor
                                                                                types:
                                                                                - $type: ElementType
                                                                                  minOccurs: 0
                                                                                  localName: arguments
                                                                                  bodyType:
                                                                                    $type: ComplexType
                                                                                    attributes:
                                                                                    - ns: ""
                                                                                      name: type
                                                                                      defaultValue: array
                                                                                      fixed: array
                                                                                      contentType:
                                                                                        $type: StringType
                                                                                        _ref: 1
                                                                                      required: true
                                                                                    name: /components/schemas/method/properties/arguments
                                                                                    compositor: true
                                                                                    compositorObj:
                                                                                      $type: SequenceCompositor
                                                                                      types:
                                                                                      - $type: ElementType
                                                                                        minOccurs: 0
                                                                                        maxOccurs: -1
                                                                                        localName: item
                                                                                        bodyType:
                                                                                          $type: ComplexType
                                                                                          _ref: 2
                                                                                - $type: ElementType
                                                                                  localName: name
                                                                                  bodyType:
                                                                                    $type: ComplexType
                                                                                    _ref: 2
                                                                          - $type: ElementType
                                                                            minOccurs: 0
                                                                            localName: useDataSource
                                                                            bodyType:
                                                                              $type: ComplexType
                                                                              _ref: 4
                                                                          - $type: ElementType
                                                                            minOccurs: 0
                                                                            localName: value
                                                                            bodyType:
                                                                              $type: ComplexType
                                                                              attributes:
                                                                              - ns: ""
                                                                                name: type
                                                                                defaultValue: object
                                                                                fixed: object
                                                                                contentType:
                                                                                  $type: StringType
                                                                                  _ref: 1
                                                                                required: true
                                                                              name: /components/schemas/value
                                                                              compositor: true
                                                                              compositorObj:
                                                                                $type: AllCompositor
                                                                                types:
                                                                                - $type: ElementType
                                                                                  minOccurs: 0
                                                                                  localName: class
                                                                                  bodyType:
                                                                                    $type: ComplexType
                                                                                    _ref: 2
                                                                                - $type: ElementType
                                                                                  minOccurs: 0
                                                                                  localName: file
                                                                                  bodyType:
                                                                                    $type: ComplexType
                                                                                    attributes:
                                                                                    - ns: ""
                                                                                      name: type
                                                                                      defaultValue: object
                                                                                      fixed: object
                                                                                      contentType:
                                                                                        $type: StringType
                                                                                        _ref: 1
                                                                                      required: true
                                                                                    name: /components/schemas/file
                                                                                    compositor: true
                                                                                    compositorObj:
                                                                                      $type: AllCompositor
                                                                                      types:
                                                                                      - $type: ElementType
                                                                                        localName: location
                                                                                        bodyType:
                                                                                          $type: ComplexType
                                                                                          attributes:
                                                                                          - ns: ""
                                                                                            name: type
                                                                                            defaultValue: object
                                                                                            fixed: object
                                                                                            contentType:
                                                                                              $type: StringType
                                                                                              _ref: 1
                                                                                            required: true
                                                                                          name: /components/schemas/fileLocation
                                                                                          compositor: true
                                                                                          compositorObj:
                                                                                            $type: AllCompositor
                                                                                            types:
                                                                                            - $type: ElementType
                                                                                              minOccurs: 0
                                                                                              localName: external
                                                                                              bodyType:
                                                                                                $type: ComplexType
                                                                                                _ref: 2
                                                                                            - $type: ElementType
                                                                                              minOccurs: 0
                                                                                              localName: id
                                                                                              bodyType:
                                                                                                $type: ComplexType
                                                                                                _ref: 2
                                                                                - $type: ElementType
                                                                                  minOccurs: 0
                                                                                  localName: text
                                                                                  bodyType:
                                                                                    $type: ComplexType
                                                                                    _ref: 2
                                            - $type: ElementType
                                              minOccurs: 0
                                              localName: literal
                                              bodyType:
                                                $type: ComplexType
                                                _ref: 2
                                      - $type: ElementType
                                        minOccurs: 0
                                        localName: security
                                        bodyType:
                                          $type: ComplexType
                                          _id: 9
                                          attributes:
                                          - ns: ""
                                            name: type
                                            defaultValue: object
                                            fixed: object
                                            contentType:
                                              $type: StringType
                                              _ref: 1
                                            required: true
                                          name: /components/schemas/restSecurity
                                          compositor: true
                                          compositorObj:
                                            $type: AllCompositor
                                            types:
                                            - $type: ElementType
                                              minOccurs: 0
                                              localName: httpAuthentication
                                              bodyType:
                                                $type: ComplexType
                                                attributes:
                                                - ns: ""
                                                  name: type
                                                  defaultValue: object
                                                  fixed: object
                                                  contentType:
                                                    $type: StringType
                                                    _ref: 1
                                                  required: true
                                                name: /components/schemas/httpAuthentication
                                                compositor: true
                                                compositorObj:
                                                  $type: AllCompositor
                                                  types:
                                                  - $type: ElementType
                                                    minOccurs: 0
                                                    localName: performAuthentication
                                                    bodyType:
                                                      $type: ComplexType
                                                      attributes:
                                                      - ns: ""
                                                        name: type
                                                        defaultValue: object
                                                        fixed: object
                                                        contentType:
                                                          $type: StringType
                                                          _ref: 1
                                                        required: true
                                                      name: /components/schemas/performAuthentication
                                                      compositor: true
                                                      compositorObj:
                                                        $type: AllCompositor
                                                        types:
                                                        - $type: ElementType
                                                          minOccurs: 0
                                                          localName: enabled
                                                          bodyType:
                                                            $type: ComplexType
                                                            _ref: 4
                                                        - $type: ElementType
                                                          minOccurs: 0
                                                          localName: value
                                                          bodyType:
                                                            $type: ComplexType
                                                            attributes:
                                                            - ns: ""
                                                              name: type
                                                              defaultValue: object
                                                              fixed: object
                                                              contentType:
                                                                $type: StringType
                                                                _ref: 1
                                                              required: true
                                                            name: /components/schemas/authenticationSettings
                                                            compositor: true
                                                            compositorObj:
                                                              $type: AllCompositor
                                                              types:
                                                              - $type: ElementType
                                                                minOccurs: 0
                                                                localName: authenticationType
                                                                bodyType:
                                                                  $type: ComplexType
                                                                  attributes:
                                                                  - ns: ""
                                                                    name: type
                                                                    defaultValue: object
                                                                    fixed: object
                                                                    contentType:
                                                                      $type: StringType
                                                                      _ref: 1
                                                                    required: true
                                                                  name: /components/schemas/authenticationType
                                                                  compositor: true
                                                                  compositorObj:
                                                                    $type: AllCompositor
                                                                    types:
                                                                    - $type: ElementType
                                                                      minOccurs: 0
                                                                      localName: type
                                                                      bodyType:
                                                                        $type: ComplexType
                                                                        attributes:
                                                                        - ns: ""
                                                                          name: type
                                                                          defaultValue: enum
                                                                          fixed: enum
                                                                          contentType:
                                                                            $type: StringType
                                                                            _ref: 1
                                                                          required: true
                                                                        content: true
                                                                        contentObj:
                                                                          $type: EnumType
                                                                          values:
                                                                          - '"basic"'
                                                                          - '"ntlm"'
                                                                          - '"kerberos"'
                                                                          - '"digest"'
                                                                          baseType: anonymous
                                                                        name: /components/schemas/authenticationTypeType
                                                                        compositor: true
                                                                        compositorObj:
                                                                          $type: SequenceCompositor
                                                                    - $type: ElementType
                                                                      minOccurs: 0
                                                                      localName: basic
                                                                      bodyType:
                                                                        $type: ComplexType
                                                                        attributes:
                                                                        - ns: ""
                                                                          name: type
                                                                          defaultValue: object
                                                                          fixed: object
                                                                          contentType:
                                                                            $type: StringType
                                                                            _ref: 1
                                                                          required: true
                                                                        name: /components/schemas/basic
                                                                        compositor: true
                                                                        compositorObj:
                                                                          $type: AllCompositor
                                                                          types:
                                                                          - $type: ElementType
                                                                            minOccurs: 0
                                                                            localName: password
                                                                            bodyType:
                                                                              $type: ComplexType
                                                                              attributes:
                                                                              - ns: ""
                                                                                name: type
                                                                                defaultValue: object
                                                                                fixed: object
                                                                                contentType:
                                                                                  $type: StringType
                                                                                  _ref: 1
                                                                                required: true
                                                                              name: /components/schemas/complexValueMP
                                                                              compositor: true
                                                                              compositorObj:
                                                                                $type: AllCompositor
                                                                                types:
                                                                                - $type: ElementType
                                                                                  minOccurs: 0
                                                                                  localName: type
                                                                                  bodyType:
                                                                                    $type: ComplexType
                                                                                    attributes:
                                                                                    - ns: ""
                                                                                      name: type
                                                                                      defaultValue: enum
                                                                                      fixed: enum
                                                                                      contentType:
                                                                                        $type: StringType
                                                                                        _ref: 1
                                                                                      required: true
                                                                                    content: true
                                                                                    contentObj:
                                                                                      $type: EnumType
                                                                                      values:
                                                                                      - '"masked"'
                                                                                      - '"parameterized"'
                                                                                      baseType: anonymous
                                                                                    name: /components/schemas/complexValueMPType
                                                                                    compositor: true
                                                                                    compositorObj:
                                                                                      $type: SequenceCompositor
                                                                                - $type: ElementType
                                                                                  minOccurs: 0
                                                                                  localName: masked
                                                                                  bodyType:
                                                                                    $type: ComplexType
                                                                                    _ref: 2
                                                                                - $type: ElementType
                                                                                  minOccurs: 0
                                                                                  localName: parameterized
                                                                                  bodyType:
                                                                                    $type: ComplexType
                                                                                    _ref: 8
                                                                          - $type: ElementType
                                                                            minOccurs: 0
                                                                            localName: username
                                                                            bodyType:
                                                                              $type: ComplexType
                                                                              attributes:
                                                                              - ns: ""
                                                                                name: type
                                                                                defaultValue: object
                                                                                fixed: object
                                                                                contentType:
                                                                                  $type: StringType
                                                                                  _ref: 1
                                                                                required: true
                                                                              name: /components/schemas/complexValueFP
                                                                              compositor: true
                                                                              compositorObj:
                                                                                $type: AllCompositor
                                                                                types:
                                                                                - $type: ElementType
                                                                                  minOccurs: 0
                                                                                  localName: type
                                                                                  bodyType:
                                                                                    $type: ComplexType
                                                                                    attributes:
                                                                                    - ns: ""
                                                                                      name: type
                                                                                      defaultValue: enum
                                                                                      fixed: enum
                                                                                      contentType:
                                                                                        $type: StringType
                                                                                        _ref: 1
                                                                                      required: true
                                                                                    content: true
                                                                                    contentObj:
                                                                                      $type: EnumType
                                                                                      values:
                                                                                      - '"fixed"'
                                                                                      - '"parameterized"'
                                                                                      baseType: anonymous
                                                                                    name: /components/schemas/complexValueFPType
                                                                                    compositor: true
                                                                                    compositorObj:
                                                                                      $type: SequenceCompositor
                                                                                - $type: ElementType
                                                                                  minOccurs: 0
                                                                                  localName: fixed
                                                                                  bodyType:
                                                                                    $type: ComplexType
                                                                                    _ref: 2
                                                                                - $type: ElementType
                                                                                  minOccurs: 0
                                                                                  localName: parameterized
                                                                                  bodyType:
                                                                                    $type: ComplexType
                                                                                    _ref: 8
                                                              - $type: ElementType
                                                                minOccurs: 0
                                                                localName: useGlobal
                                                                bodyType:
                                                                  $type: ComplexType
                                                                  _ref: 4
                                - $type: ElementType
                                  minOccurs: 0
                                  localName: http11
                                  bodyType:
                                    $type: ComplexType
                                    attributes:
                                    - ns: ""
                                      name: type
                                      defaultValue: object
                                      fixed: object
                                      contentType:
                                        $type: StringType
                                        _ref: 1
                                      required: true
                                    name: /components/schemas/http11
                                    compositor: true
                                    compositorObj:
                                      $type: AllCompositor
                                      types:
                                      - $type: ElementType
                                        minOccurs: 0
                                        localName: cookieSettings
                                        bodyType:
                                          $type: ComplexType
                                          _ref: 3
                                      - $type: ElementType
                                        minOccurs: 0
                                        localName: generalSettings
                                        bodyType:
                                          $type: ComplexType
                                          _ref: 5
                                      - $type: ElementType
                                        minOccurs: 0
                                        localName: httpHeaders
                                        bodyType:
                                          $type: ComplexType
                                          _ref: 6
                                      - $type: ElementType
                                        minOccurs: 0
                                        localName: security
                                        bodyType:
                                          $type: ComplexType
                                          _ref: 9
                    - $type: ElementType
                      minOccurs: 0
                      localName: misc
                      bodyType:
                        $type: ComplexType
                        attributes:
                        - ns: ""
                          name: type
                          defaultValue: object
                          fixed: object
                          contentType:
                            $type: StringType
                            _ref: 1
                          required: true
                        name: /components/schemas/restMisc
                        compositor: true
                        compositorObj:
                          $type: AllCompositor
                          types:
                          - $type: ElementType
                            minOccurs: 0
                            localName: timeout
                            bodyType:
                              $type: ComplexType
                              attributes:
                              - ns: ""
                                name: type
                                defaultValue: object
                                fixed: object
                                contentType:
                                  $type: StringType
                                  _ref: 1
                                required: true
                              name: /components/schemas/timeout
                              compositor: true
                              compositorObj:
                                $type: AllCompositor
                                types:
                                - $type: ElementType
                                  minOccurs: 0
                                  localName: action
                                  bodyType:
                                    $type: ComplexType
                                    attributes:
                                    - ns: ""
                                      name: type
                                      defaultValue: enum
                                      fixed: enum
                                      contentType:
                                        $type: StringType
                                        _ref: 1
                                      required: true
                                    content: true
                                    contentObj:
                                      $type: EnumType
                                      values:
                                      - '"failOnTimeout"'
                                      - '"passOnTimeout"'
                                      baseType: anonymous
                                    name: /components/schemas/restTimeoutAction
                                    compositor: true
                                    compositorObj:
                                      $type: SequenceCompositor
                                - $type: ElementType
                                  minOccurs: 0
                                  localName: milliseconds
                                  bodyType:
                                    $type: ComplexType
                                    attributes:
                                    - ns: ""
                                      name: type
                                      defaultValue: object
                                      fixed: object
                                      contentType:
                                        $type: StringType
                                        _ref: 1
                                      required: true
                                    name: /components/schemas/milliseconds
                                    compositor: true
                                    compositorObj:
                                      $type: AllCompositor
                                      types:
                                      - $type: ElementType
                                        minOccurs: 0
                                        localName: mode
                                        bodyType:
                                          $type: ComplexType
                                          attributes:
                                          - ns: ""
                                            name: type
                                            defaultValue: enum
                                            fixed: enum
                                            contentType:
                                              $type: StringType
                                              _ref: 1
                                            required: true
                                          content: true
                                          contentObj:
                                            $type: EnumType
                                            values:
                                            - '"Default"'
                                            - '"Custom"'
                                            baseType: anonymous
                                          name: /components/schemas/restMode
                                          compositor: true
                                          compositorObj:
                                            $type: SequenceCompositor
                                      - $type: ElementType
                                        minOccurs: 0
                                        localName: value
                                        bodyType:
                                          $type: ComplexType
                                          attributes:
                                          - ns: ""
                                            name: type
                                            defaultValue: number
                                            fixed: number
                                            contentType:
                                              $type: StringType
                                              _ref: 1
                                            required: true
                                          content: true
                                          contentObj:
                                            $type: LongType
                                          namespace: urn:parasoft:json
                                          name: number
                                          compositor: true
                                          compositorObj:
                                            $type: SequenceCompositor
                          - $type: ElementType
                            minOccurs: 0
                            localName: validHttpResponseCodes
                            bodyType:
                              $type: ComplexType
                              _ref: 7
                    - $type: ElementType
                      minOccurs: 0
                      localName: name
                      bodyType:
                        $type: ComplexType
                        _ref: 2
                    - $type: ElementType
                      localName: parent
                      bodyType:
                        $type: ComplexType
                        attributes:
                        - ns: ""
                          name: type
                          defaultValue: object
                          fixed: object
                          contentType:
                            $type: StringType
                            _ref: 1
                          required: true
                        name: /components/schemas/parent
                        compositor: true
                        compositorObj:
                          $type: AllCompositor
                          types:
                          - $type: ElementType
                            minOccurs: 0
                            localName: id
                            bodyType:
                              $type: ComplexType
                              _ref: 2
                    - $type: ElementType
                      minOccurs: 0
                      localName: payload
                      bodyType:
                        $type: ComplexType
                        attributes:
                        - ns: ""
                          name: type
                          defaultValue: object
                          fixed: object
                          contentType:
                            $type: StringType
                            _ref: 1
                          required: true
                        name: /components/schemas/payload
                        compositor: true
                        compositorObj:
                          $type: AllCompositor
                          types:
                          - $type: ElementType
                            minOccurs: 0
                            localName: contentType
                            bodyType:
                              $type: ComplexType
                              _ref: 2
                          - $type: ElementType
                            minOccurs: 0
                            localName: input
                            bodyType:
                              $type: ComplexType
                              attributes:
                              - ns: ""
                                name: type
                                defaultValue: object
                                fixed: object
                                contentType:
                                  $type: StringType
                                  _ref: 1
                                required: true
                              name: /components/schemas/input
                              compositor: true
                              compositorObj:
                                $type: AllCompositor
                                types:
                                - $type: ElementType
                                  minOccurs: 0
                                  localName: literal
                                  bodyType:
                                    $type: ComplexType
                                    attributes:
                                    - ns: ""
                                      name: type
                                      defaultValue: object
                                      fixed: object
                                      contentType:
                                        $type: StringType
                                        _ref: 1
                                      required: true
                                    name: /components/schemas/literal
                                    compositor: true
                                    compositorObj:
                                      $type: AllCompositor
                                      types:
                                      - $type: ElementType
                                        minOccurs: 0
                                        localName: text
                                        bodyType:
                                          $type: ComplexType
                                          _ref: 2
                          - $type: ElementType
                            minOccurs: 0
                            localName: inputMode
                            bodyType:
                              $type: ComplexType
                              attributes:
                              - ns: ""
                                name: type
                                defaultValue: enum
                                fixed: enum
                                contentType:
                                  $type: StringType
                                  _ref: 1
                                required: true
                              content: true
                              contentObj:
                                $type: EnumType
                                values:
                                - '"formInput"'
                                - '"formXML"'
                                - '"formJSON"'
                                - '"table"'
                                - '"literal"'
                                - '"scripted"'
                                baseType: anonymous
                              name: /components/schemas/inputModeRESTClient
                              compositor: true
                              compositorObj:
                                $type: SequenceCompositor
                    - $type: ElementType
                      minOccurs: 0
                      localName: resource
                      bodyType:
                        $type: ComplexType
                        attributes:
                        - ns: ""
                          name: type
                          defaultValue: object
                          fixed: object
                          contentType:
                            $type: StringType
                            _ref: 1
                          required: true
                        name: /components/schemas/resource
                        compositor: true
                        compositorObj:
                          $type: AllCompositor
                          types:
                          - $type: ElementType
                            minOccurs: 0
                            localName: type
                            bodyType:
                              $type: ComplexType
                              attributes:
                              - ns: ""
                                name: type
                                defaultValue: enum
                                fixed: enum
                                contentType:
                                  $type: StringType
                                  _ref: 1
                                required: true
                              content: true
                              contentObj:
                                $type: EnumType
                                values:
                                - '"literalText"'
                                - '"raml"'
                                - '"swagger"'
                                - '"wadl"'
                                baseType: anonymous
                              name: /components/schemas/resourceType
                              compositor: true
                              compositorObj:
                                $type: SequenceCompositor
                          - $type: ElementType
                            minOccurs: 0
                            localName: literalText
                            bodyType:
                              $type: ComplexType
                              attributes:
                              - ns: ""
                                name: type
                                defaultValue: object
                                fixed: object
                                contentType:
                                  $type: StringType
                                  _ref: 1
                                required: true
                              name: /components/schemas/fixedElement
                              compositor: true
                              compositorObj:
                                $type: AllCompositor
                                types:
                                - $type: ElementType
                                  minOccurs: 0
                                  localName: fixed
                                  bodyType:
                                    $type: ComplexType
                                    _ref: 2
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                attributes:
                - replacedColumn: ""
                  value:
                    $type: StringValue
                    replacedColumn: ""
                    value: object
                    xmlEncoding: 2
                  useValue: true
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
                      values:
                      - $type: ElementValue
                        replacedColumn: ""
                      - $type: ElementValue
                        replacedColumn: ""
                        values:
                        - $type: ComplexValue
                          replacedColumn: ""
                          allowArrayExclude: true
                          attributes:
                          - replacedColumn: ""
                            value:
                              $type: StringValue
                              replacedColumn: ""
                              value: object
                              xmlEncoding: 2
                            useValue: true
                          compositorValue: true
                          compositorValueObj:
                            replacedColumn: ""
                            values:
                              $type: CompositorValueSetCollectionSet
                              set:
                              - $type: CompositorValueSet
                                values:
                                - $type: ElementValue
                                  replacedColumn: ""
                                  values:
                                  - $type: ComplexValue
                                    replacedColumn: ""
                                    allowArrayExclude: true
                                    attributes:
                                    - replacedColumn: ""
                                      value:
                                        $type: StringValue
                                        replacedColumn: ""
                                        value: object
                                        xmlEncoding: 2
                                      useValue: true
                                    compositorValue: true
                                    compositorValueObj:
                                      replacedColumn: ""
                                      values:
                                        $type: CompositorValueSetCollectionSet
                                        set:
                                        - $type: CompositorValueSet
                                          values:
                                          - $type: ElementValue
                                            replacedColumn: ""
                                            values:
                                            - $type: ComplexValue
                                              replacedColumn: ""
                                              allowArrayExclude: true
                                              attributes:
                                              - replacedColumn: ""
                                                value:
                                                  $type: StringValue
                                                  replacedColumn: ""
                                                  value: enum
                                                  xmlEncoding: 2
                                                useValue: true
                                              contentValue: true
                                              contentValueObj:
                                                $type: EnumValue
                                                replacedColumn: ""
                                                selectedIdx: 7
                                              compositorValue: true
                                              compositorValueObj:
                                                replacedColumn: ""
                                                values:
                                                  $type: CompositorValueSetCollectionSet
                                                  set:
                                                  - $type: CompositorValueSet
                                          - $type: ElementValue
                                            replacedColumn: ""
                                            values:
                                            - $type: ComplexValue
                                              replacedColumn: ""
                                              allowArrayExclude: true
                                              attributes:
                                              - replacedColumn: ""
                                                value:
                                                  $type: StringValue
                                                  replacedColumn: ""
                                                  value: string
                                                  xmlEncoding: 2
                                                useValue: true
                                              contentValue: true
                                              contentValueObj:
                                                $type: StringValue
                                                replacedColumn: ""
                                                mode: 3
                                                columnName: "TestCases: Method"
                                                value: POST
                                                xmlEncoding: 2
                                              compositorValue: true
                                              compositorValueObj:
                                                replacedColumn: ""
                                                values:
                                                  $type: CompositorValueSetCollectionSet
                                                  set:
                                                  - $type: CompositorValueSet
                      - $type: ElementValue
                        replacedColumn: ""
                        values:
                        - $type: ComplexValue
                          replacedColumn: ""
                          allowArrayExclude: true
                          attributes:
                          - replacedColumn: ""
                            value:
                              $type: StringValue
                              replacedColumn: ""
                              value: object
                              xmlEncoding: 2
                            useValue: true
                          compositorValue: true
                          compositorValueObj:
                            replacedColumn: ""
                            values:
                              $type: CompositorValueSetCollectionSet
                              set:
                              - $type: CompositorValueSet
                                values:
                                - $type: ElementValue
                                  replacedColumn: ""
                                  values:
                                  - $type: ComplexValue
                                    replacedColumn: ""
                                    attributes:
                                    - replacedColumn: ""
                                      value:
                                        $type: StringValue
                                        replacedColumn: ""
                                        value: object
                                        xmlEncoding: 2
                                      useValue: true
                                    compositorValue: true
                                    compositorValueObj:
                                      replacedColumn: ""
                                      values:
                                        $type: CompositorValueSetCollectionSet
                                        set:
                                        - $type: CompositorValueSet
                                          values:
                                          - $type: ElementValue
                                            replacedColumn: ""
                                            values:
                                            - $type: ComplexValue
                                              replacedColumn: ""
                                              allowArrayExclude: true
                                              attributes:
                                              - replacedColumn: ""
                                                value:
                                                  $type: StringValue
                                                  replacedColumn: ""
                                                  value: enum
                                                  xmlEncoding: 2
                                                useValue: true
                                              contentValue: true
                                              contentValueObj:
                                                $type: EnumValue
                                                replacedColumn: ""
                                              compositorValue: true
                                              compositorValueObj:
                                                replacedColumn: ""
                                                values:
                                                  $type: CompositorValueSetCollectionSet
                                                  set:
                                                  - $type: CompositorValueSet
                                          - $type: ElementValue
                                            replacedColumn: ""
                                            values:
                                            - $type: ComplexValue
                                              replacedColumn: ""
                                              allowArrayExclude: true
                                              attributes:
                                              - replacedColumn: ""
                                                value:
                                                  $type: StringValue
                                                  replacedColumn: ""
                                                  value: object
                                                  xmlEncoding: 2
                                                useValue: true
                                              compositorValue: true
                                              compositorValueObj:
                                                replacedColumn: ""
                                                values:
                                                  $type: CompositorValueSetCollectionSet
                                                  set:
                                                  - $type: CompositorValueSet
                                                    values:
                                                    - $type: ElementValue
                                                      replacedColumn: ""
                                                    - $type: ElementValue
                                                      replacedColumn: ""
                                                    - $type: ElementValue
                                                      replacedColumn: ""
                                                      values:
                                                      - $type: ComplexValue
                                                        replacedColumn: ""
                                                        allowArrayExclude: true
                                                        attributes:
                                                        - replacedColumn: ""
                                                          value:
                                                            $type: StringValue
                                                            replacedColumn: ""
                                                            value: object
                                                            xmlEncoding: 2
                                                          useValue: true
                                                        compositorValue: true
                                                        compositorValueObj:
                                                          replacedColumn: ""
                                                          values:
                                                            $type: CompositorValueSetCollectionSet
                                                            set:
                                                            - $type: CompositorValueSet
                                                              values:
                                                              - $type: ElementValue
                                                                replacedColumn: ""
                                                                values:
                                                                - $type: ComplexValue
                                                                  replacedColumn: ""
                                                                  allowArrayExclude: true
                                                                  attributes:
                                                                  - replacedColumn: ""
                                                                    value:
                                                                      $type: StringValue
                                                                      replacedColumn: ""
                                                                      value: enum
                                                                      xmlEncoding: 2
                                                                    useValue: true
                                                                  contentValue: true
                                                                  contentValueObj:
                                                                    $type: EnumValue
                                                                    replacedColumn: ""
                                                                  compositorValue: true
                                                                  compositorValueObj:
                                                                    replacedColumn: ""
                                                                    values:
                                                                      $type: CompositorValueSetCollectionSet
                                                                      set:
                                                                      - $type: CompositorValueSet
                                                              - $type: ElementValue
                                                                replacedColumn: ""
                                                              - $type: ElementValue
                                                                replacedColumn: ""
                                                                values:
                                                                - $type: ComplexValue
                                                                  replacedColumn: ""
                                                                  allowArrayExclude: true
                                                                  attributes:
                                                                  - replacedColumn: ""
                                                                    value:
                                                                      $type: StringValue
                                                                      replacedColumn: ""
                                                                      value: string
                                                                      xmlEncoding: 2
                                                                    useValue: true
                                                                  contentValue: true
                                                                  contentValueObj:
                                                                    $type: StringValue
                                                                    hasMethod: true
                                                                    method:
                                                                      hasCode: true
                                                                      code:
                                                                        $type: ScriptCode
                                                                        input:
                                                                          useText: true
                                                                          textInput:
                                                                            $type: ScriptingTextInput
                                                                            text: "import\
                                                                              \ com.parasoft.api.*;\r\
                                                                              \n\r\
                                                                              \npublic\
                                                                              \ String\
                                                                              \ headers(ScriptingContext\
                                                                              \ context)\r\
                                                                              \n{\r\
                                                                              \n\t\
                                                                              String\
                                                                              \ headers\
                                                                              \ =\
                                                                              \ context.getValue(\"\
                                                                              header\"\
                                                                              )\r\n\
                                                                              \tif(context.getValue(\"\
                                                                              TestCases\"\
                                                                              ,\"\
                                                                              Auth_Type\"\
                                                                              ).equals(\"\
                                                                              bearer\"\
                                                                              ))\r\
                                                                              \n\t\
                                                                              {\r\n\
                                                                              \t\t\
                                                                              headers\
                                                                              \ +=\
                                                                              \ \"\
                                                                              \\nAuthorization:\
                                                                              \ Bearer\
                                                                              \ \"\
                                                                              \ +\
                                                                              \ context.getValue(\"\
                                                                              Generated\
                                                                              \ Data\
                                                                              \ Source\"\
                                                                              ,\"\
                                                                              TokenName\"\
                                                                              );\r\
                                                                              \n\t\
                                                                              }\r\n\
                                                                              \t\r\
                                                                              \n\t\
                                                                              return\
                                                                              \ headers;\r\
                                                                              \n}"
                                                                      hasMethodId: true
                                                                      methodId:
                                                                        $type: ScriptMethodIdentifier
                                                                        functionName: headers
                                                                        arguments:
                                                                        - com.parasoft.api.ScriptingContext
                                                                    replacedColumn: ""
                                                                    mode: 2
                                                                    columnName: header
                                                                    value: |
                                                                      Content-Type:application/json
                                                                    xmlEncoding: 2
                                                                  compositorValue: true
                                                                  compositorValueObj:
                                                                    replacedColumn: ""
                                                                    values:
                                                                      $type: CompositorValueSetCollectionSet
                                                                      set:
                                                                      - $type: CompositorValueSet
                                                    - $type: ElementValue
                                                      replacedColumn: ""
                                                      values:
                                                      - $type: ComplexValue
                                                        replacedColumn: ""
                                                        allowArrayExclude: true
                                                        attributes:
                                                        - replacedColumn: ""
                                                          value:
                                                            $type: StringValue
                                                            replacedColumn: ""
                                                            value: object
                                                            xmlEncoding: 2
                                                          useValue: true
                                                        compositorValue: true
                                                        compositorValueObj:
                                                          replacedColumn: ""
                                                          values:
                                                            $type: CompositorValueSetCollectionSet
                                                            set:
                                                            - $type: CompositorValueSet
                                                              values:
                                                              - $type: ElementValue
                                                                replacedColumn: ""
                                                                values:
                                                                - $type: ComplexValue
                                                                  replacedColumn: ""
                                                                  allowArrayExclude: true
                                                                  attributes:
                                                                  - replacedColumn: ""
                                                                    value:
                                                                      $type: StringValue
                                                                      replacedColumn: ""
                                                                      value: object
                                                                      xmlEncoding: 2
                                                                    useValue: true
                                                                  compositorValue: true
                                                                  compositorValueObj:
                                                                    replacedColumn: ""
                                                                    values:
                                                                      $type: CompositorValueSetCollectionSet
                                                                      set:
                                                                      - $type: CompositorValueSet
                                                                        values:
                                                                        - $type: ElementValue
                                                                          replacedColumn: ""
                                                                          values:
                                                                          - $type: ComplexValue
                                                                            replacedColumn: ""
                                                                            allowArrayExclude: true
                                                                            attributes:
                                                                            - replacedColumn: ""
                                                                              value:
                                                                                $type: StringValue
                                                                                replacedColumn: ""
                                                                                value: object
                                                                                xmlEncoding: 2
                                                                              useValue: true
                                                                            compositorValue: true
                                                                            compositorValueObj:
                                                                              replacedColumn: ""
                                                                              values:
                                                                                $type: CompositorValueSetCollectionSet
                                                                                set:
                                                                                - $type: CompositorValueSet
                                                                                  values:
                                                                                  - $type: ElementValue
                                                                                    replacedColumn: ""
                                                                                    values:
                                                                                    - $type: ComplexValue
                                                                                      replacedColumn: ""
                                                                                      allowArrayExclude: true
                                                                                      attributes:
                                                                                      - replacedColumn: ""
                                                                                        value:
                                                                                          $type: StringValue
                                                                                          replacedColumn: ""
                                                                                          value: boolean
                                                                                          xmlEncoding: 2
                                                                                        useValue: true
                                                                                      contentValue: true
                                                                                      contentValueObj:
                                                                                        $type: BooleanValue
                                                                                        replacedColumn: ""
                                                                                        mode: 3
                                                                                        columnName: Auth_Enabled
                                                                                        value: "false"
                                                                                      compositorValue: true
                                                                                      compositorValueObj:
                                                                                        replacedColumn: ""
                                                                                        values:
                                                                                          $type: CompositorValueSetCollectionSet
                                                                                          set:
                                                                                          - $type: CompositorValueSet
                                                                                  - $type: ElementValue
                                                                                    replacedColumn: ""
                                                                                    values:
                                                                                    - $type: ComplexValue
                                                                                      replacedColumn: ""
                                                                                      allowArrayExclude: true
                                                                                      attributes:
                                                                                      - replacedColumn: ""
                                                                                        value:
                                                                                          $type: StringValue
                                                                                          replacedColumn: ""
                                                                                          value: object
                                                                                          xmlEncoding: 2
                                                                                        useValue: true
                                                                                      compositorValue: true
                                                                                      compositorValueObj:
                                                                                        replacedColumn: ""
                                                                                        values:
                                                                                          $type: CompositorValueSetCollectionSet
                                                                                          set:
                                                                                          - $type: CompositorValueSet
                                                                                            values:
                                                                                            - $type: ElementValue
                                                                                              replacedColumn: ""
                                                                                              values:
                                                                                              - $type: ComplexValue
                                                                                                replacedColumn: ""
                                                                                                allowArrayExclude: true
                                                                                                attributes:
                                                                                                - replacedColumn: ""
                                                                                                  value:
                                                                                                    $type: StringValue
                                                                                                    replacedColumn: ""
                                                                                                    value: object
                                                                                                    xmlEncoding: 2
                                                                                                  useValue: true
                                                                                                compositorValue: true
                                                                                                compositorValueObj:
                                                                                                  replacedColumn: ""
                                                                                                  values:
                                                                                                    $type: CompositorValueSetCollectionSet
                                                                                                    set:
                                                                                                    - $type: CompositorValueSet
                                                                                                      values:
                                                                                                      - $type: ElementValue
                                                                                                        replacedColumn: ""
                                                                                                        values:
                                                                                                        - $type: ComplexValue
                                                                                                          replacedColumn: ""
                                                                                                          allowArrayExclude: true
                                                                                                          attributes:
                                                                                                          - replacedColumn: ""
                                                                                                            value:
                                                                                                              $type: StringValue
                                                                                                              replacedColumn: ""
                                                                                                              value: enum
                                                                                                              xmlEncoding: 2
                                                                                                            useValue: true
                                                                                                          contentValue: true
                                                                                                          contentValueObj:
                                                                                                            $type: EnumValue
                                                                                                            hasMethod: true
                                                                                                            method:
                                                                                                              hasCode: true
                                                                                                              code:
                                                                                                                $type: ScriptCode
                                                                                                                input:
                                                                                                                  useText: true
                                                                                                                  textInput:
                                                                                                                    $type: ScriptingTextInput
                                                                                                                    text: "import\
                                                                                                                      \ com.parasoft.api.*;\r\
                                                                                                                      \n\
                                                                                                                      \r\
                                                                                                                      \n\
                                                                                                                      \
                                                                                                                      public\
                                                                                                                      \ String\
                                                                                                                      \ authType(ScriptingContext\
                                                                                                                      \ context)\r\
                                                                                                                      \n\
                                                                                                                      \
                                                                                                                      {\r\
                                                                                                                      \n\
                                                                                                                      \t\
                                                                                                                      \
                                                                                                                      if(context.getValue(\"\
                                                                                                                      \
                                                                                                                      TestCases\"\
                                                                                                                      \
                                                                                                                      ,\"\
                                                                                                                      \
                                                                                                                      Auth_Type\"\
                                                                                                                      \
                                                                                                                      ).equals(\"\
                                                                                                                      \
                                                                                                                      digest\"\
                                                                                                                      \
                                                                                                                      ))\r\
                                                                                                                      \n\
                                                                                                                      \t\
                                                                                                                      \t\
                                                                                                                      \
                                                                                                                      return\
                                                                                                                      \ \"\
                                                                                                                      \
                                                                                                                      digest\"\
                                                                                                                      \
                                                                                                                      ;\r\
                                                                                                                      \n\
                                                                                                                      \t\
                                                                                                                      \
                                                                                                                      else\r\
                                                                                                                      \n\
                                                                                                                      \t\
                                                                                                                      \t\
                                                                                                                      \
                                                                                                                      return\
                                                                                                                      \ \"\
                                                                                                                      \
                                                                                                                      basic\"\
                                                                                                                      \
                                                                                                                      ;\r\
                                                                                                                      \n\
                                                                                                                      }"
                                                                                                              hasMethodId: true
                                                                                                              methodId:
                                                                                                                $type: ScriptMethodIdentifier
                                                                                                                functionName: authType
                                                                                                                arguments:
                                                                                                                - com.parasoft.api.ScriptingContext
                                                                                                            replacedColumn: ""
                                                                                                            mode: 2
                                                                                                            columnName: Auth_Type
                                                                                                            selectedIdx: -1
                                                                                                          compositorValue: true
                                                                                                          compositorValueObj:
                                                                                                            replacedColumn: ""
                                                                                                            values:
                                                                                                              $type: CompositorValueSetCollectionSet
                                                                                                              set:
                                                                                                              - $type: CompositorValueSet
                                                                                                      - $type: ElementValue
                                                                                                        replacedColumn: ""
                                                                                                        values:
                                                                                                        - $type: ComplexValue
                                                                                                          replacedColumn: ""
                                                                                                          allowArrayExclude: true
                                                                                                          attributes:
                                                                                                          - replacedColumn: ""
                                                                                                            value:
                                                                                                              $type: StringValue
                                                                                                              replacedColumn: ""
                                                                                                              value: object
                                                                                                              xmlEncoding: 2
                                                                                                            useValue: true
                                                                                                          compositorValue: true
                                                                                                          compositorValueObj:
                                                                                                            replacedColumn: ""
                                                                                                            values:
                                                                                                              $type: CompositorValueSetCollectionSet
                                                                                                              set:
                                                                                                              - $type: CompositorValueSet
                                                                                                                values:
                                                                                                                - $type: ElementValue
                                                                                                                  replacedColumn: ""
                                                                                                                  values:
                                                                                                                  - $type: ComplexValue
                                                                                                                    replacedColumn: ""
                                                                                                                    allowArrayExclude: true
                                                                                                                    attributes:
                                                                                                                    - replacedColumn: ""
                                                                                                                      value:
                                                                                                                        $type: StringValue
                                                                                                                        replacedColumn: ""
                                                                                                                        value: object
                                                                                                                        xmlEncoding: 2
                                                                                                                      useValue: true
                                                                                                                    compositorValue: true
                                                                                                                    compositorValueObj:
                                                                                                                      replacedColumn: ""
                                                                                                                      values:
                                                                                                                        $type: CompositorValueSetCollectionSet
                                                                                                                        set:
                                                                                                                        - $type: CompositorValueSet
                                                                                                                          values:
                                                                                                                          - $type: ElementValue
                                                                                                                            replacedColumn: ""
                                                                                                                            values:
                                                                                                                            - $type: ComplexValue
                                                                                                                              replacedColumn: ""
                                                                                                                              allowArrayExclude: true
                                                                                                                              attributes:
                                                                                                                              - replacedColumn: ""
                                                                                                                                value:
                                                                                                                                  $type: StringValue
                                                                                                                                  replacedColumn: ""
                                                                                                                                  value: enum
                                                                                                                                  xmlEncoding: 2
                                                                                                                                useValue: true
                                                                                                                              contentValue: true
                                                                                                                              contentValueObj:
                                                                                                                                $type: EnumValue
                                                                                                                                replacedColumn: ""
                                                                                                                              compositorValue: true
                                                                                                                              compositorValueObj:
                                                                                                                                replacedColumn: ""
                                                                                                                                values:
                                                                                                                                  $type: CompositorValueSetCollectionSet
                                                                                                                                  set:
                                                                                                                                  - $type: CompositorValueSet
                                                                                                                          - $type: ElementValue
                                                                                                                            replacedColumn: ""
                                                                                                                            values:
                                                                                                                            - $type: ComplexValue
                                                                                                                              replacedColumn: ""
                                                                                                                              allowArrayExclude: true
                                                                                                                              attributes:
                                                                                                                              - replacedColumn: ""
                                                                                                                                value:
                                                                                                                                  $type: StringValue
                                                                                                                                  replacedColumn: ""
                                                                                                                                  value: string
                                                                                                                                  xmlEncoding: 2
                                                                                                                                useValue: true
                                                                                                                              contentValue: true
                                                                                                                              contentValueObj:
                                                                                                                                $type: StringValue
                                                                                                                                replacedColumn: ""
                                                                                                                                mode: 3
                                                                                                                                columnName: Basic_Pass
                                                                                                                                value: ""
                                                                                                                                xmlEncoding: 2
                                                                                                                              compositorValue: true
                                                                                                                              compositorValueObj:
                                                                                                                                replacedColumn: ""
                                                                                                                                values:
                                                                                                                                  $type: CompositorValueSetCollectionSet
                                                                                                                                  set:
                                                                                                                                  - $type: CompositorValueSet
                                                                                                                          - $type: ElementValue
                                                                                                                            replacedColumn: ""
                                                                                                                - $type: ElementValue
                                                                                                                  replacedColumn: ""
                                                                                                                  values:
                                                                                                                  - $type: ComplexValue
                                                                                                                    replacedColumn: ""
                                                                                                                    allowArrayExclude: true
                                                                                                                    attributes:
                                                                                                                    - replacedColumn: ""
                                                                                                                      value:
                                                                                                                        $type: StringValue
                                                                                                                        replacedColumn: ""
                                                                                                                        value: object
                                                                                                                        xmlEncoding: 2
                                                                                                                      useValue: true
                                                                                                                    compositorValue: true
                                                                                                                    compositorValueObj:
                                                                                                                      replacedColumn: ""
                                                                                                                      values:
                                                                                                                        $type: CompositorValueSetCollectionSet
                                                                                                                        set:
                                                                                                                        - $type: CompositorValueSet
                                                                                                                          values:
                                                                                                                          - $type: ElementValue
                                                                                                                            replacedColumn: ""
                                                                                                                            values:
                                                                                                                            - $type: ComplexValue
                                                                                                                              replacedColumn: ""
                                                                                                                              allowArrayExclude: true
                                                                                                                              attributes:
                                                                                                                              - replacedColumn: ""
                                                                                                                                value:
                                                                                                                                  $type: StringValue
                                                                                                                                  replacedColumn: ""
                                                                                                                                  value: enum
                                                                                                                                  xmlEncoding: 2
                                                                                                                                useValue: true
                                                                                                                              contentValue: true
                                                                                                                              contentValueObj:
                                                                                                                                $type: EnumValue
                                                                                                                                replacedColumn: ""
                                                                                                                              compositorValue: true
                                                                                                                              compositorValueObj:
                                                                                                                                replacedColumn: ""
                                                                                                                                values:
                                                                                                                                  $type: CompositorValueSetCollectionSet
                                                                                                                                  set:
                                                                                                                                  - $type: CompositorValueSet
                                                                                                                          - $type: ElementValue
                                                                                                                            replacedColumn: ""
                                                                                                                            values:
                                                                                                                            - $type: ComplexValue
                                                                                                                              replacedColumn: ""
                                                                                                                              allowArrayExclude: true
                                                                                                                              attributes:
                                                                                                                              - replacedColumn: ""
                                                                                                                                value:
                                                                                                                                  $type: StringValue
                                                                                                                                  replacedColumn: ""
                                                                                                                                  value: string
                                                                                                                                  xmlEncoding: 2
                                                                                                                                useValue: true
                                                                                                                              contentValue: true
                                                                                                                              contentValueObj:
                                                                                                                                $type: StringValue
                                                                                                                                replacedColumn: ""
                                                                                                                                mode: 3
                                                                                                                                columnName: Basic_User
                                                                                                                                value: ""
                                                                                                                                xmlEncoding: 2
                                                                                                                              compositorValue: true
                                                                                                                              compositorValueObj:
                                                                                                                                replacedColumn: ""
                                                                                                                                values:
                                                                                                                                  $type: CompositorValueSetCollectionSet
                                                                                                                                  set:
                                                                                                                                  - $type: CompositorValueSet
                                                                                                                          - $type: ElementValue
                                                                                                                            replacedColumn: ""
                                                                                            - $type: ElementValue
                                                                                              replacedColumn: ""
                                          - $type: ElementValue
                                            replacedColumn: ""
                      - $type: ElementValue
                        replacedColumn: ""
                      - $type: ElementValue
                        replacedColumn: ""
                        values:
                        - $type: ComplexValue
                          replacedColumn: ""
                          allowArrayExclude: true
                          attributes:
                          - replacedColumn: ""
                            value:
                              $type: StringValue
                              replacedColumn: ""
                              value: string
                              xmlEncoding: 2
                            useValue: true
                          contentValue: true
                          contentValueObj:
                            $type: StringValue
                            replacedColumn: ""
                            mode: 3
                            columnName: "TestCases: Name"
                            value: Local payment test
                            xmlEncoding: 2
                          compositorValue: true
                          compositorValueObj:
                            replacedColumn: ""
                            values:
                              $type: CompositorValueSetCollectionSet
                              set:
                              - $type: CompositorValueSet
                      - $type: ElementValue
                        replacedColumn: ""
                        values:
                        - $type: ComplexValue
                          replacedColumn: ""
                          attributes:
                          - replacedColumn: ""
                            value:
                              $type: StringValue
                              replacedColumn: ""
                              value: object
                              xmlEncoding: 2
                            useValue: true
                          compositorValue: true
                          compositorValueObj:
                            replacedColumn: ""
                            values:
                              $type: CompositorValueSetCollectionSet
                              set:
                              - $type: CompositorValueSet
                                values:
                                - $type: ElementValue
                                  replacedColumn: ""
                                  values:
                                  - $type: ComplexValue
                                    replacedColumn: ""
                                    allowArrayExclude: true
                                    attributes:
                                    - replacedColumn: ""
                                      value:
                                        $type: StringValue
                                        replacedColumn: ""
                                        value: string
                                        xmlEncoding: 2
                                      useValue: true
                                    contentValue: true
                                    contentValueObj:
                                      $type: StringValue
                                      replacedColumn: ""
                                      mode: 3
                                      columnName: TopTestSuiteID
                                      value: /TestAssets/Vendor APIs.tst/Test Suite
                                      xmlEncoding: 2
                                    compositorValue: true
                                    compositorValueObj:
                                      replacedColumn: ""
                                      values:
                                        $type: CompositorValueSetCollectionSet
                                        set:
                                        - $type: CompositorValueSet
                      - $type: ElementValue
                        replacedColumn: ""
                        values:
                        - $type: ComplexValue
                          replacedColumn: ""
                          allowArrayExclude: true
                          attributes:
                          - replacedColumn: ""
                            value:
                              $type: StringValue
                              replacedColumn: ""
                              value: object
                              xmlEncoding: 2
                            useValue: true
                          compositorValue: true
                          compositorValueObj:
                            replacedColumn: ""
                            values:
                              $type: CompositorValueSetCollectionSet
                              set:
                              - $type: CompositorValueSet
                                values:
                                - $type: ElementValue
                                  replacedColumn: ""
                                  values:
                                  - $type: ComplexValue
                                    replacedColumn: ""
                                    allowArrayExclude: true
                                    attributes:
                                    - replacedColumn: ""
                                      value:
                                        $type: StringValue
                                        replacedColumn: ""
                                        value: string
                                        xmlEncoding: 2
                                      useValue: true
                                    contentValue: true
                                    contentValueObj:
                                      $type: StringValue
                                      hasMethod: true
                                      method:
                                        hasCode: true
                                        code:
                                          $type: ScriptCode
                                          input:
                                            useText: true
                                            textInput:
                                              $type: ScriptingTextInput
                                              text: "import com.parasoft.api.*;\r\n\
                                                \r\npublic String contentType(ScriptingContext\
                                                \ context)\r\n{\r\n\tif(context.getValue(\"\
                                                TestCases\",\"Body\").equals(\"urlencoded\"\
                                                ))\r\n\t\treturn \"application/x-www-form-urlencoded\"\
                                                \r\n\telse\r\n\t\treturn \"text/plain\"\
                                                \r\n}"
                                        hasMethodId: true
                                        methodId:
                                          $type: ScriptMethodIdentifier
                                          functionName: contentType
                                          arguments:
                                          - com.parasoft.api.ScriptingContext
                                      replacedColumn: ""
                                      mode: 2
                                      value: ""
                                      xmlEncoding: 2
                                    compositorValue: true
                                    compositorValueObj:
                                      replacedColumn: ""
                                      values:
                                        $type: CompositorValueSetCollectionSet
                                        set:
                                        - $type: CompositorValueSet
                                - $type: ElementValue
                                  replacedColumn: ""
                                  values:
                                  - $type: ComplexValue
                                    replacedColumn: ""
                                    allowArrayExclude: true
                                    attributes:
                                    - replacedColumn: ""
                                      value:
                                        $type: StringValue
                                        replacedColumn: ""
                                        value: object
                                        xmlEncoding: 2
                                      useValue: true
                                    compositorValue: true
                                    compositorValueObj:
                                      replacedColumn: ""
                                      values:
                                        $type: CompositorValueSetCollectionSet
                                        set:
                                        - $type: CompositorValueSet
                                          values:
                                          - $type: ElementValue
                                            replacedColumn: ""
                                            values:
                                            - $type: ComplexValue
                                              replacedColumn: ""
                                              allowArrayExclude: true
                                              attributes:
                                              - replacedColumn: ""
                                                value:
                                                  $type: StringValue
                                                  replacedColumn: ""
                                                  value: object
                                                  xmlEncoding: 2
                                                useValue: true
                                              compositorValue: true
                                              compositorValueObj:
                                                replacedColumn: ""
                                                values:
                                                  $type: CompositorValueSetCollectionSet
                                                  set:
                                                  - $type: CompositorValueSet
                                                    values:
                                                    - $type: ElementValue
                                                      replacedColumn: ""
                                                      values:
                                                      - $type: ComplexValue
                                                        replacedColumn: ""
                                                        allowArrayExclude: true
                                                        attributes:
                                                        - replacedColumn: ""
                                                          value:
                                                            $type: StringValue
                                                            replacedColumn: ""
                                                            value: string
                                                            xmlEncoding: 2
                                                          useValue: true
                                                        contentValue: true
                                                        contentValueObj:
                                                          $type: StringValue
                                                          replacedColumn: ""
                                                          mode: 3
                                                          columnName: body
                                                          value: "{\"AccountID\":{{colAccountID}},\r\
                                                            \n\"DateScheduled\":\"\
                                                            2020-07-20T08:34:00.000\"\
                                                            ,\r\n\"Amount\":33.32,\r\
                                                            \n\"BankInformation\"\
                                                            :{\r\n    \"BankAccountNumber\"\
                                                            :123456,\r\n    \"RoutingNumber\"\
                                                            :\"011000028\"\r\n},\r\
                                                            \n\"CommandType\":1\r\n\
                                                            }\r\n"
                                                          xmlEncoding: 2
                                                        compositorValue: true
                                                        compositorValueObj:
                                                          replacedColumn: ""
                                                          values:
                                                            $type: CompositorValueSetCollectionSet
                                                            set:
                                                            - $type: CompositorValueSet
                                - $type: ElementValue
                                  replacedColumn: ""
                                  values:
                                  - $type: ComplexValue
                                    replacedColumn: ""
                                    allowArrayExclude: true
                                    attributes:
                                    - replacedColumn: ""
                                      value:
                                        $type: StringValue
                                        replacedColumn: ""
                                        value: enum
                                        xmlEncoding: 2
                                      useValue: true
                                    contentValue: true
                                    contentValueObj:
                                      $type: EnumValue
                                      replacedColumn: ""
                                      selectedIdx: 4
                                    compositorValue: true
                                    compositorValueObj:
                                      replacedColumn: ""
                                      values:
                                        $type: CompositorValueSetCollectionSet
                                        set:
                                        - $type: CompositorValueSet
                      - $type: ElementValue
                        replacedColumn: ""
                        values:
                        - $type: ComplexValue
                          replacedColumn: ""
                          allowArrayExclude: true
                          attributes:
                          - replacedColumn: ""
                            value:
                              $type: StringValue
                              replacedColumn: ""
                              value: object
                              xmlEncoding: 2
                            useValue: true
                          compositorValue: true
                          compositorValueObj:
                            replacedColumn: ""
                            values:
                              $type: CompositorValueSetCollectionSet
                              set:
                              - $type: CompositorValueSet
                                values:
                                - $type: ElementValue
                                  replacedColumn: ""
                                  values:
                                  - $type: ComplexValue
                                    replacedColumn: ""
                                    allowArrayExclude: true
                                    attributes:
                                    - replacedColumn: ""
                                      value:
                                        $type: StringValue
                                        replacedColumn: ""
                                        value: enum
                                        xmlEncoding: 2
                                      useValue: true
                                    contentValue: true
                                    contentValueObj:
                                      $type: EnumValue
                                      replacedColumn: ""
                                    compositorValue: true
                                    compositorValueObj:
                                      replacedColumn: ""
                                      values:
                                        $type: CompositorValueSetCollectionSet
                                        set:
                                        - $type: CompositorValueSet
                                - $type: ElementValue
                                  replacedColumn: ""
                                  values:
                                  - $type: ComplexValue
                                    replacedColumn: ""
                                    allowArrayExclude: true
                                    attributes:
                                    - replacedColumn: ""
                                      value:
                                        $type: StringValue
                                        replacedColumn: ""
                                        value: object
                                        xmlEncoding: 2
                                      useValue: true
                                    compositorValue: true
                                    compositorValueObj:
                                      replacedColumn: ""
                                      values:
                                        $type: CompositorValueSetCollectionSet
                                        set:
                                        - $type: CompositorValueSet
                                          values:
                                          - $type: ElementValue
                                            replacedColumn: ""
                                            values:
                                            - $type: ComplexValue
                                              replacedColumn: ""
                                              allowArrayExclude: true
                                              attributes:
                                              - replacedColumn: ""
                                                value:
                                                  $type: StringValue
                                                  replacedColumn: ""
                                                  value: string
                                                  xmlEncoding: 2
                                                useValue: true
                                              contentValue: true
                                              contentValueObj:
                                                $type: StringValue
                                                replacedColumn: ""
                                                mode: 3
                                                columnName: "TestCases: Endpoint"
                                                value: "{{apiuri}}/api/vendor-services/payments/payment"
                                                xmlEncoding: 2
                                              compositorValue: true
                                              compositorValueObj:
                                                replacedColumn: ""
                                                values:
                                                  $type: CompositorValueSetCollectionSet
                                                  set:
                                                  - $type: CompositorValueSet
            elementTypeName: root
          hasServiceInfo: true
          serviceInfo:
            serviceDescriptor:
              $type: StandardServiceDescriptor
              location: http://ulvbdparas01.rei.com:9080/soavirt/api/v6
          jsonBuilder:
            hasValue: true
            value:
              $type: JSONObjectValue
              nameIsNull: true
          schemaURL:
            MessagingClient_SchemaLocation: "${HOST}:${PORT}/soavirt/api/v6"
          formInput:
            value:
              $type: ElementValue
              writeType: true
              hasReference: true
              qnameAsString: ":"
              replacedColumn: ""
              values:
              - $type: ComplexValue
                replacedColumn: ""
                compositorValue: true
                compositorValueObj:
                  replacedColumn: ""
                  values:
                    $type: CompositorValueSetCollectionSet
                    set:
                    - $type: CompositorValueSet
          jmsMessageOutputProvider:
            $type: JMSMessageOutputProvider
            jmsOutputProviderRequest:
              $type: JMSOutputProvider
              name: Request Object
              menuName: Object
            jmsOutputProviderResponse:
              $type: JMSOutputProvider
              name: Response Message Object
              menuName: Message Object
          router:
            values:
            - $type: ScriptedValue
            fixedValue:
              $type: StringTestValue
              HTTPClient_Endpoint: http://localhost:9080/soa
          transportProperties:
            manager:
              properties:
              - $type: HTTPClientHTTPProperties
                followRedirects:
                  bool: true
                common:
                  auth:
                    useDefault: false
                    authName: Basic
                  method:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: HTTPMethodTestValue
                      method: GET
                  httpHeaders:
                    mode: 1
                keepAlive1_1:
                  bool: true
              - $type: HTTPClientHTTPProperties
                followRedirects:
                  bool: true
                common:
                  auth:
                    useDefault: false
                    authName: Basic
                  method:
                    values:
                    - $type: ScriptedValue
                    fixedValue:
                      $type: HTTPMethodTestValue
                      method: GET
                  httpHeaders:
                    mode: 1
                protocol: 1
                keepAlive1_1:
                  bool: true
              - $type: NoneTransportProperties
            messageExchangePattern:
              inverted: true
          outputProviders:
            requestHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Request Transport Header
            responseHeader:
              $type: HTTPNamedToolOutputProvider
              menuName: Transport Header
              name: Response Transport Header
            xmlRequestOutput:
              $type: NamedXMLToolOutputProvider
              outputTools:
              - $type: MethodTool
                dataSourceNames:
                - Postman Collection
                iconName: Method
                name: Extension Tool
                method:
                  hasCode: true
                  code:
                    $type: ScriptCode
                    input:
                      useText: true
                      textInput:
                        $type: ScriptingTextInput
                        text: "import com.parasoft.api.*;\r\nimport java.util.regex.*;\r\
                          \n\r\npublic String replaceVariables(Object input, ExtensionToolContext\
                          \ context)\r\n{\r\n\tString start = input.toString();\r\n\
                          \tPattern pattern = Pattern.compile(\"(\\\\{\\\\{)(.*?)(\\\
                          \\}\\\\})\");\r\n\tMatcher matcher = pattern.matcher(start);\r\
                          \n\t\r\n\tList<String> listMatches = new ArrayList<String>();\r\
                          \n\t\r\n\twhile(matcher.find())\r\n    {\r\n       listMatches.add(matcher.group(2));\r\
                          \n    }\r\n\r\n    for(String s : listMatches)\r\n    {\r\
                          \n    \tstart = start.replaceFirst(pattern,\"\\\\\\${\"\
                          +s+\"}\")\r\n    \tcontext.setValue(\"variablesToAdd\",\
                          \ (context.getValue(\"variablesToAdd\") + \",\" + s))\r\n\
                          \    }\r\n    return start;\r\n}"
                  hasMethodId: true
                  methodId:
                    $type: ScriptMethodIdentifier
                    functionName: replaceVariables
                    arguments:
                    - java.lang.Object
                    - com.parasoft.api.ExtensionToolContext
              menuName: Traffic
              name: Request Traffic
            trafficOutput:
              m_name: Traffic Stream
            objectOutput:
              $type: ObjectOutputProvider
              outputTools:
              - $type: TrafficViewer
                iconName: TrafficViewer
                name: Traffic Viewer
                showRequestHeaders: true
                showResponseHeaders: true
              name: Traffic Object
          literal:
            use: 1
            text:
              MessagingClient_LiteralMessage: "{\"resource\":{\"type\":\"literalText\"\
                ,\"literalText\":{\"fixed\":\"${TestCases: Endpoint}\"}},\"header\"\
                :{\"method\":{\"value\":\"${TestCases: Method}\",\"methodType\":\"\
                CUSTOM\"}},\"httpOptions\":{\"transport\":{\"type\":\"http10\",\"\
                http10\":{\"general\":{\"endpoint\":{\"value\":{\"type\":\"fixed\"\
                ,\"fixed\":\"${TestCases: Endpoint}\"},\"endpointType\":\"custom\"\
                }},\"security\":{\"httpAuthentication\":{\"performAuthentication\"\
                :{\"value\":{\"authenticationType\":{\"type\":\"basic\",\"basic\"\
                :{\"username\":{\"type\":\"fixed\",\"fixed\":\"${Basic_User}\"},\"\
                password\":{\"type\":\"masked\",\"masked\":\"${Basic_Pass}\"}}}},\"\
                enabled\":${boolean:Auth_Enabled}}}},\"httpHeaders\":{\"type\":\"\
                literal\",\"literal\":\"${header}\"}}}},\"parent\":{\"id\":\"${TestSuiteName}\"\
                },\"name\":\"${TestCases: Name}\",\"payload\":{\"inputMode\":\"literal\"\
                ,\"input\":{\"literal\":{\"text\":\"${TestCases: Body}\"}}}}"
              type: application/json
            dataSource:
              columnName: File Contents
          mode: Form JSON
          literalQuery:
            isPropertiesRef: true
          literalPath:
            pathElements:
            - values:
              - $type: ScriptedValue
              fixedValue:
                $type: StringTestValue
                value: soa
          resourceMethod:
            resourceId: /v6/tools/restClients
            httpMethod: POST
          resourceMode: 3
          baseUrl:
            values:
            - $type: ScriptedValue
            - $type: WadlTestValue
              value: http://ulvbdparas01.rei.com:9080/soavirt/api
            fixedValue:
              $type: StringTestValue
            selectedIndex: 1
      - $type: ToolTest
        name: Extension Tool 2
        testFlowLogic:
          dependencyLogic:
            success: 0
        testID: 101
        tool:
          $type: MethodTool
          dataSourceNames:
          - Postman Collection
          iconName: Method
          name: Extension Tool 2
          method:
            hasCode: true
            code:
              $type: ScriptCode
              input:
                useText: true
                textInput:
                  $type: ScriptingTextInput
                  text: "import com.parasoft.api.*;\r\n\r\npublic void incX(Object\
                    \ input, ExtensionToolContext context)\r\n{\r\n\tcontext.setValue(\"\
                    x\",(Integer.parseInt(context.getValue(\"x\"))+1).toString());\r\
                    \n}"
            hasMethodId: true
            methodId:
              $type: ScriptMethodIdentifier
              functionName: incX
              arguments:
              - java.lang.Object
              - com.parasoft.api.ExtensionToolContext
        writeInput: true
        inputType: InputUsable
        input:
          use: 1
          text:
            text: ""
            type: text/plain
          dataSource:
            columnName: File Contents
    - $type: ToolTest
      name: Extension Tool 2
      testID: 102
      tool:
        $type: MethodTool
        dataSourceNames:
        - Postman Collection
        iconName: Method
        name: Extension Tool 2
        method:
          hasCode: true
          code:
            $type: ScriptCode
            input:
              useText: true
              textInput:
                $type: ScriptingTextInput
                text: "import com.parasoft.api.*;\r\n\r\npublic void stopExec(Object\
                  \ input, ExtensionToolContext context)\r\n{\r\n\tcontext.setValue(\"\
                  x\",\"1\");\r\n\tcontext.setValue(\"y\",(Integer.parseInt(context.getValue(\"\
                  y\"))+1).toString());\r\n}"
          hasMethodId: true
          methodId:
            $type: ScriptMethodIdentifier
            functionName: stopExec
            arguments:
            - java.lang.Object
            - com.parasoft.api.ExtensionToolContext
      writeInput: true
      inputType: InputUsable
      input:
        use: 1
        text:
          text: ""
          type: text/plain
        dataSource:
          columnName: File Contents
  - $type: TestSuite
    name: Add Variables
    testID: 153
    tests:
    - $type: RESTClientToolTest
      name: REST Client 2
      testID: 158
      tool:
        $type: RESTClient
        dataSourceNames:
        - Postman Collection
        iconName: RESTClient
        name: REST Client 2
        formJson:
          builtFromSchema: true
          value:
            $type: ElementValue
            writeType: true
            type:
              $type: ElementType
              localName: root
              bodyType:
                $type: ComplexType
                attributes:
                - ns: ""
                  name: type
                  defaultValue: object
                  fixed: object
                  contentType:
                    $type: StringType
                    _id: 1
                  required: true
                name: /components/schemas/testSuitesPUTRequest
                compositor: true
                compositorObj:
                  $type: AllCompositor
                  types:
                  - $type: ElementType
                    minOccurs: 0
                    localName: name
                    bodyType:
                      $type: ComplexType
                      _id: 2
                      attributes:
                      - ns: ""
                        name: type
                        defaultValue: string
                        fixed: string
                        contentType:
                          $type: StringType
                          _ref: 1
                        required: true
                      content: true
                      contentObj:
                        $type: StringType
                        _ref: 1
                      namespace: urn:parasoft:json
                      name: string
                      compositor: true
                      compositorObj:
                        $type: SequenceCompositor
                  - $type: ElementType
                    minOccurs: 0
                    localName: disabled
                    bodyType:
                      $type: ComplexType
                      _id: 3
                      attributes:
                      - ns: ""
                        name: type
                        defaultValue: boolean
                        fixed: boolean
                        contentType:
                          $type: StringType
                          _ref: 1
                        required: true
                      content: true
                      contentObj:
                        $type: BooleanType
                      namespace: urn:parasoft:json
                      name: boolean
                      compositor: true
                      compositorObj:
                        $type: SequenceCompositor
                  - $type: ElementType
                    minOccurs: 0
                    localName: requirementsAndNotes
                    bodyType:
                      $type: ComplexType
                      attributes:
                      - ns: ""
                        name: type
                        defaultValue: object
                        fixed: object
                        contentType:
                          $type: StringType
                          _ref: 1
                        required: true
                      name: /components/schemas/testSuiteRequirementsAndNotes
                      compositor: true
                      compositorObj:
                        $type: AllCompositor
                        types:
                        - $type: ElementType
                          minOccurs: 0
                          localName: notes
                          bodyType:
                            $type: ComplexType
                            _ref: 2
                        - $type: ElementType
                          minOccurs: 0
                          localName: requirementsAndTracking
                          bodyType:
                            $type: ComplexType
                            attributes:
                            - ns: ""
                              name: type
                              defaultValue: array
                              fixed: array
                              contentType:
                                $type: StringType
                                _ref: 1
                              required: true
                            name: /components/schemas/testSuiteRequirementsAndNotes/properties/requirementsAndTracking
                            compositor: true
                            compositorObj:
                              $type: SequenceCompositor
                              types:
                              - $type: ElementType
                                minOccurs: 0
                                maxOccurs: -1
                                localName: item
                                bodyType:
                                  $type: ComplexType
                                  attributes:
                                  - ns: ""
                                    name: type
                                    defaultValue: object
                                    fixed: object
                                    contentType:
                                      $type: StringType
                                      _ref: 1
                                    required: true
                                  name: /components/schemas/requirementsAndTrackingElement
                                  compositor: true
                                  compositorObj:
                                    $type: AllCompositor
                                    types:
                                    - $type: ElementType
                                      localName: id
                                      bodyType:
                                        $type: ComplexType
                                        _ref: 2
                                    - $type: ElementType
                                      minOccurs: 0
                                      localName: comment
                                      bodyType:
                                        $type: ComplexType
                                        _ref: 2
                                    - $type: ElementType
                                      minOccurs: 0
                                      localName: requirements
                                      bodyType:
                                        $type: ComplexType
                                        attributes:
                                        - ns: ""
                                          name: type
                                          defaultValue: array
                                          fixed: array
                                          contentType:
                                            $type: StringType
                                            _ref: 1
                                          required: true
                                        name: /components/schemas/requirementsAndTrackingElement/properties/requirements
                                        compositor: true
                                        compositorObj:
                                          $type: SequenceCompositor
                                          types:
                                          - $type: ElementType
                                            minOccurs: 0
                                            maxOccurs: -1
                                            localName: item
                                            bodyType:
                                              $type: ComplexType
                                              attributes:
                                              - ns: ""
                                                name: type
                                                defaultValue: object
                                                fixed: object
                                                contentType:
                                                  $type: StringType
                                                  _ref: 1
                                                required: true
                                              name: /components/schemas/requirementsElement
                                              compositor: true
                                              compositorObj:
                                                $type: AllCompositor
                                                types:
                                                - $type: ElementType
                                                  localName: type
                                                  bodyType:
                                                    $type: ComplexType
                                                    _ref: 2
                                                - $type: ElementType
                                                  localName: id
                                                  bodyType:
                                                    $type: ComplexType
                                                    _ref: 2
                                                - $type: ElementType
                                                  minOccurs: 0
                                                  localName: url
                                                  bodyType:
                                                    $type: ComplexType
                                                    _ref: 2
                  - $type: ElementType
                    minOccurs: 0
                    localName: variables
                    bodyType:
                      $type: ComplexType
                      attributes:
                      - ns: ""
                        name: type
                        defaultValue: array
                        fixed: array
                        contentType:
                          $type: StringType
                          _ref: 1
                        required: true
                      name: /components/schemas/testSuitesPUTRequest/properties/variables
                      compositor: true
                      compositorObj:
                        $type: SequenceCompositor
                        types:
                        - $type: ElementType
                          minOccurs: 0
                          maxOccurs: -1
                          localName: item
                          bodyType:
                            $type: ComplexType
                            attributes:
                            - ns: ""
                              name: type
                              defaultValue: object
                              fixed: object
                              contentType:
                                $type: StringType
                                _ref: 1
                              required: true
                            name: /components/schemas/testSuiteVariable
                            compositor: true
                            compositorObj:
                              $type: AllCompositor
                              types:
                              - $type: ElementType
                                localName: name
                                bodyType:
                                  $type: ComplexType
                                  _ref: 2
                              - $type: ElementType
                                minOccurs: 0
                                localName: type
                                bodyType:
                                  $type: ComplexType
                                  attributes:
                                  - ns: ""
                                    name: type
                                    defaultValue: enum
                                    fixed: enum
                                    contentType:
                                      $type: StringType
                                      _ref: 1
                                    required: true
                                  content: true
                                  contentObj:
                                    $type: EnumType
                                    values:
                                    - '"BOOLEAN"'
                                    - '"INTEGER"'
                                    - '"STRING"'
                                    - '"DATA_SOURCE"'
                                    baseType: anonymous
                                  name: /components/schemas/variableType
                                  compositor: true
                                  compositorObj:
                                    $type: SequenceCompositor
                              - $type: ElementType
                                localName: useValueFromParentSuite
                                bodyType:
                                  $type: ComplexType
                                  _ref: 3
                              - $type: ElementType
                                minOccurs: 0
                                localName: booleanValue
                                bodyType:
                                  $type: ComplexType
                                  _ref: 3
                              - $type: ElementType
                                minOccurs: 0
                                localName: integerValue
                                bodyType:
                                  $type: ComplexType
                                  _id: 4
                                  attributes:
                                  - ns: ""
                                    name: type
                                    defaultValue: number
                                    fixed: number
                                    contentType:
                                      $type: StringType
                                      _ref: 1
                                    required: true
                                  content: true
                                  contentObj:
                                    $type: BigIntegerType
                                  namespace: urn:parasoft:json
                                  name: number
                                  compositor: true
                                  compositorObj:
                                    $type: SequenceCompositor
                              - $type: ElementType
                                minOccurs: 0
                                localName: stringValue
                                bodyType:
                                  $type: ComplexType
                                  _ref: 2
                              - $type: ElementType
                                minOccurs: 0
                                localName: dataSourceValue
                                bodyType:
                                  $type: ComplexType
                                  attributes:
                                  - ns: ""
                                    name: type
                                    defaultValue: object
                                    fixed: object
                                    contentType:
                                      $type: StringType
                                      _ref: 1
                                    required: true
                                  name: /components/schemas/dataSourceType
                                  compositor: true
                                  compositorObj:
                                    $type: AllCompositor
                                    types:
                                    - $type: ElementType
                                      minOccurs: 0
                                      localName: dataSourceName
                                      bodyType:
                                        $type: ComplexType
                                        _ref: 2
                                    - $type: ElementType
                                      minOccurs: 0
                                      localName: columnName
                                      bodyType:
                                        $type: ComplexType
                                        _ref: 2
                                    - $type: ElementType
                                      minOccurs: 0
                                      localName: value
                                      bodyType:
                                        $type: ComplexType
                                        _ref: 2
                  - $type: ElementType
                    minOccurs: 0
                    localName: executionOptions
                    bodyType:
                      $type: ComplexType
                      attributes:
                      - ns: ""
                        name: type
                        defaultValue: object
                        fixed: object
                        contentType:
                          $type: StringType
                          _ref: 1
                        required: true
                      name: /components/schemas/executionOptions
                      compositor: true
                      compositorObj:
                        $type: AllCompositor
                        types:
                        - $type: ElementType
                          minOccurs: 0
                          localName: flowLogic
                          bodyType:
                            $type: ComplexType
                            attributes:
                            - ns: ""
                              name: type
                              defaultValue: object
                              fixed: object
                              contentType:
                                $type: StringType
                                _ref: 1
                              required: true
                            name: /components/schemas/flowLogic
                            compositor: true
                            compositorObj:
                              $type: AllCompositor
                              types:
                              - $type: ElementType
                                minOccurs: 0
                                localName: testSuiteFlowLogic
                                bodyType:
                                  $type: ComplexType
                                  attributes:
                                  - ns: ""
                                    name: type
                                    defaultValue: object
                                    fixed: object
                                    contentType:
                                      $type: StringType
                                      _ref: 1
                                    required: true
                                  name: /components/schemas/testSuiteFlowLogic
                                  compositor: true
                                  compositorObj:
                                    $type: AllCompositor
                                    types:
                                    - $type: ElementType
                                      minOccurs: 0
                                      localName: whileVariable
                                      bodyType:
                                        $type: ComplexType
                                        attributes:
                                        - ns: ""
                                          name: type
                                          defaultValue: object
                                          fixed: object
                                          contentType:
                                            $type: StringType
                                            _ref: 1
                                          required: true
                                        name: /components/schemas/whileVariable
                                        compositor: true
                                        compositorObj:
                                          $type: AllCompositor
                                          types:
                                          - $type: ElementType
                                            defaultValue: 1
                                            localName: maximumNumberOfLoops
                                            bodyType:
                                              $type: ComplexType
                                              _ref: 4
                                          - $type: ElementType
                                            minOccurs: 0
                                            localName: while
                                            bodyType:
                                              $type: ComplexType
                                              attributes:
                                              - ns: ""
                                                name: type
                                                defaultValue: object
                                                fixed: object
                                                contentType:
                                                  $type: StringType
                                                  _ref: 1
                                                required: true
                                              name: /components/schemas/whileConfiguration
                                              compositor: true
                                              compositorObj:
                                                $type: AllCompositor
                                                types:
                                                - $type: ElementType
                                                  minOccurs: 0
                                                  localName: condition
                                                  bodyType:
                                                    $type: ComplexType
                                                    _id: 5
                                                    attributes:
                                                    - ns: ""
                                                      name: type
                                                      defaultValue: object
                                                      fixed: object
                                                      contentType:
                                                        $type: StringType
                                                        _ref: 1
                                                      required: true
                                                    name: /components/schemas/variableCondition
                                                    compositor: true
                                                    compositorObj:
                                                      $type: AllCompositor
                                                      types:
                                                      - $type: ElementType
                                                        localName: variable
                                                        bodyType:
                                                          $type: ComplexType
                                                          attributes:
                                                          - ns: ""
                                                            name: type
                                                            defaultValue: object
                                                            fixed: object
                                                            contentType:
                                                              $type: StringType
                                                              _ref: 1
                                                            required: true
                                                          name: /components/schemas/variableReference
                                                          compositor: true
                                                          compositorObj:
                                                            $type: AllCompositor
                                                            types:
                                                            - $type: ElementType
                                                              localName: name
                                                              bodyType:
                                                                $type: ComplexType
                                                                _ref: 2
                                                      - $type: ElementType
                                                        localName: condition
                                                        bodyType:
                                                          $type: ComplexType
                                                          attributes:
                                                          - ns: ""
                                                            name: type
                                                            defaultValue: object
                                                            fixed: object
                                                            contentType:
                                                              $type: StringType
                                                              _ref: 1
                                                            required: true
                                                          name: /components/schemas/testSuiteCondition
                                                          compositor: true
                                                          compositorObj:
                                                            $type: AllCompositor
                                                            types:
                                                            - $type: ElementType
                                                              minOccurs: 0
                                                              localName: booleanCondition
                                                              bodyType:
                                                                $type: ComplexType
                                                                attributes:
                                                                - ns: ""
                                                                  name: type
                                                                  defaultValue: object
                                                                  fixed: object
                                                                  contentType:
                                                                    $type: StringType
                                                                    _ref: 1
                                                                  required: true
                                                                name: /components/schemas/booleanCondition
                                                                compositor: true
                                                                compositorObj:
                                                                  $type: AllCompositor
                                                                  types:
                                                                  - $type: ElementType
                                                                    localName: value
                                                                    bodyType:
                                                                      $type: ComplexType
                                                                      _ref: 3
                                                            - $type: ElementType
                                                              minOccurs: 0
                                                              localName: dataSourceCondition
                                                              bodyType:
                                                                $type: ComplexType
                                                                attributes:
                                                                - ns: ""
                                                                  name: type
                                                                  defaultValue: object
                                                                  fixed: object
                                                                  contentType:
                                                                    $type: StringType
                                                                    _ref: 1
                                                                  required: true
                                                                name: /components/schemas/dataSourceCondition
                                                                compositor: true
                                                                compositorObj:
                                                                  $type: AllCompositor
                                                                  types:
                                                                  - $type: ElementType
                                                                    minOccurs: 0
                                                                    localName: operator
                                                                    bodyType:
                                                                      $type: ComplexType
                                                                      _id: 6
                                                                      attributes:
                                                                      - ns: ""
                                                                        name: type
                                                                        defaultValue: enum
                                                                        fixed: enum
                                                                        contentType:
                                                                          $type: StringType
                                                                          _ref: 1
                                                                        required: true
                                                                      content: true
                                                                      contentObj:
                                                                        $type: EnumType
                                                                        values:
                                                                        - '"=="'
                                                                        - '"!="'
                                                                        baseType: anonymous
                                                                      name: /components/schemas/dualStateOperator
                                                                      compositor: true
                                                                      compositorObj:
                                                                        $type: SequenceCompositor
                                                                  - $type: ElementType
                                                                    localName: value
                                                                    bodyType:
                                                                      $type: ComplexType
                                                                      _ref: 2
                                                            - $type: ElementType
                                                              minOccurs: 0
                                                              localName: integerCondition
                                                              bodyType:
                                                                $type: ComplexType
                                                                attributes:
                                                                - ns: ""
                                                                  name: type
                                                                  defaultValue: object
                                                                  fixed: object
                                                                  contentType:
                                                                    $type: StringType
                                                                    _ref: 1
                                                                  required: true
                                                                name: /components/schemas/integerCondition
                                                                compositor: true
                                                                compositorObj:
                                                                  $type: AllCompositor
                                                                  types:
                                                                  - $type: ElementType
                                                                    minOccurs: 0
                                                                    localName: operator
                                                                    bodyType:
                                                                      $type: ComplexType
                                                                      attributes:
                                                                      - ns: ""
                                                                        name: type
                                                                        defaultValue: enum
                                                                        fixed: enum
                                                                        contentType:
                                                                          $type: StringType
                                                                          _ref: 1
                                                                        required: true
                                                                      content: true
                                                                      contentObj:
                                                                        $type: EnumType
                                                                        values:
                                                                        - '"<"'
                                                                        - '"<="'
                                                                        - '"=="'
                                                                        - '">"'
                                                                        - '">="'
                                                                        - '"!="'
                                                                        baseType: anonymous
                                                                      name: /components/schemas/operator
                                                                      compositor: true
                                                                      compositorObj:
                                                                        $type: SequenceCompositor
                                                                  - $type: ElementType
                                                                    localName: value
                                                                    bodyType:
                                                                      $type: ComplexType
                                                                      _ref: 4
                                                            - $type: ElementType
                                                              minOccurs: 0
                                                              localName: stringCondition
                                                              bodyType:
                                                                $type: ComplexType
                                                                attributes:
                                                                - ns: ""
                                                                  name: type
                                                                  defaultValue: object
                                                                  fixed: object
                                                                  contentType:
                                                                    $type: StringType
                                                                    _ref: 1
                                                                  required: true
                                                                name: /components/schemas/stringCondition
                                                                compositor: true
                                                                compositorObj:
                                                                  $type: AllCompositor
                                                                  types:
                                                                  - $type: ElementType
                                                                    minOccurs: 0
                                                                    localName: operator
                                                                    bodyType:
                                                                      $type: ComplexType
                                                                      _ref: 6
                                                                  - $type: ElementType
                                                                    localName: value
                                                                    bodyType:
                                                                      $type: ComplexType
                                                                      _ref: 2
                                                - $type: ElementType
                                                  minOccurs: 0
                                                  localName: doInstructions
                                                  bodyType:
                                                    $type: ComplexType
                                                    attributes:
                                                    - ns: ""
                                                      name: type
                                                      defaultValue: enum
                                                      fixed: enum
                                                      contentType:
                                                        $type: StringType
                                                        _ref: 1
                                                      required: true
                                                    content: true
                                                    contentObj:
                                                      $type: EnumType
                                                      values:
                                                      - '"NOTHING"'
                                                      - '"INCREMENT"'
                                                      - '"DECREMENT"'
                                                      - '"CLEAR"'
                                                      - '"NEGATE"'
                                                      baseType: anonymous
                                                    name: /components/schemas/doInstructions
                                                    compositor: true
                                                    compositorObj:
                                                      $type: SequenceCompositor
                                    - $type: ElementType
                                      minOccurs: 0
                                      localName: whilePassFail
                                      bodyType:
                                        $type: ComplexType
                                        attributes:
                                        - ns: ""
                                          name: type
                                          defaultValue: object
                                          fixed: object
                                          contentType:
                                            $type: StringType
                                            _ref: 1
                                          required: true
                                        name: /components/schemas/whilePassFail
                                        compositor: true
                                        compositorObj:
                                          $type: AllCompositor
                                          types:
                                          - $type: ElementType
                                            defaultValue: 1
                                            localName: maximumNumberOfLoops
                                            bodyType:
                                              $type: ComplexType
                                              _ref: 4
                                          - $type: ElementType
                                            minOccurs: 0
                                            localName: loopUntil
                                            bodyType:
                                              $type: ComplexType
                                              attributes:
                                              - ns: ""
                                                name: type
                                                defaultValue: object
                                                fixed: object
                                                contentType:
                                                  $type: StringType
                                                  _ref: 1
                                                required: true
                                              name: /components/schemas/loopUntil
                                              compositor: true
                                              compositorObj:
                                                $type: AllCompositor
                                                types:
                                                - $type: ElementType
                                                  minOccurs: 0
                                                  localName: occurenceCondition
                                                  bodyType:
                                                    $type: ComplexType
                                                    attributes:
                                                    - ns: ""
                                                      name: type
                                                      defaultValue: enum
                                                      fixed: enum
                                                      contentType:
                                                        $type: StringType
                                                        _ref: 1
                                                      required: true
                                                    content: true
                                                    contentObj:
                                                      $type: EnumType
                                                      values:
                                                      - '"EVERY_TEST"'
                                                      - '"ONE_TEST"'
                                                      baseType: anonymous
                                                    name: /components/schemas/occurenceCondition
                                                    compositor: true
                                                    compositorObj:
                                                      $type: SequenceCompositor
                                                - $type: ElementType
                                                  minOccurs: 0
                                                  localName: statusCondition
                                                  bodyType:
                                                    $type: ComplexType
                                                    attributes:
                                                    - ns: ""
                                                      name: type
                                                      defaultValue: enum
                                                      fixed: enum
                                                      contentType:
                                                        $type: StringType
                                                        _ref: 1
                                                      required: true
                                                    content: true
                                                    contentObj:
                                                      $type: EnumType
                                                      values:
                                                      - '"SUCCEEDS"'
                                                      - '"FAILS"'
                                                      baseType: anonymous
                                                    name: /components/schemas/statusCondition
                                                    compositor: true
                                                    compositorObj:
                                                      $type: SequenceCompositor
                              - $type: ElementType
                                minOccurs: 0
                                localName: testsFlowLogic
                                bodyType:
                                  $type: ComplexType
                                  attributes:
                                  - ns: ""
                                    name: type
                                    defaultValue: array
                                    fixed: array
                                    contentType:
                                      $type: StringType
                                      _ref: 1
                                    required: true
                                  name: /components/schemas/flowLogic/properties/testsFlowLogic
                                  compositor: true
                                  compositorObj:
                                    $type: SequenceCompositor
                                    types:
                                    - $type: ElementType
                                      minOccurs: 0
                                      maxOccurs: -1
                                      localName: item
                                      bodyType:
                                        $type: ComplexType
                                        attributes:
                                        - ns: ""
                                          name: type
                                          defaultValue: object
                                          fixed: object
                                          contentType:
                                            $type: StringType
                                            _ref: 1
                                          required: true
                                        name: /components/schemas/testFlowLogic
                                        compositor: true
                                        compositorObj:
                                          $type: AllCompositor
                                          types:
                                          - $type: ElementType
                                            localName: configuration
                                            bodyType:
                                              $type: ComplexType
                                              attributes:
                                              - ns: ""
                                                name: type
                                                defaultValue: object
                                                fixed: object
                                                contentType:
                                                  $type: StringType
                                                  _ref: 1
                                                required: true
                                              name: /components/schemas/testFlowLogicConfiguration
                                              compositor: true
                                              compositorObj:
                                                $type: AllCompositor
                                                types:
                                                - $type: ElementType
                                                  minOccurs: 0
                                                  localName: testResultDependency
                                                  bodyType:
                                                    $type: ComplexType
                                                    attributes:
                                                    - ns: ""
                                                      name: type
                                                      defaultValue: object
                                                      fixed: object
                                                      contentType:
                                                        $type: StringType
                                                        _ref: 1
                                                      required: true
                                                    name: /components/schemas/testResultDependency
                                                    compositor: true
                                                    compositorObj:
                                                      $type: AllCompositor
                                                      types:
                                                      - $type: ElementType
                                                        minOccurs: 0
                                                        localName: id
                                                        bodyType:
                                                          $type: ComplexType
                                                          _ref: 2
                                                      - $type: ElementType
                                                        minOccurs: 0
                                                        localName: result
                                                        bodyType:
                                                          $type: ComplexType
                                                          attributes:
                                                          - ns: ""
                                                            name: type
                                                            defaultValue: enum
                                                            fixed: enum
                                                            contentType:
                                                              $type: StringType
                                                              _ref: 1
                                                            required: true
                                                          content: true
                                                          contentObj:
                                                            $type: EnumType
                                                            values:
                                                            - '"FAILURE"'
                                                            - '"SKIPPED"'
                                                            - '"SUCCESS"'
                                                            baseType: anonymous
                                                          name: /components/schemas/testResultStatus
                                                          compositor: true
                                                          compositorObj:
                                                            $type: SequenceCompositor
                                                - $type: ElementType
                                                  minOccurs: 0
                                                  localName: variableCondition
                                                  bodyType:
                                                    $type: ComplexType
                                                    _ref: 5
                                                - $type: ElementType
                                                  minOccurs: 0
                                                  localName: delayInMilliseconds
                                                  bodyType:
                                                    $type: ComplexType
                                                    attributes:
                                                    - ns: ""
                                                      name: type
                                                      defaultValue: object
                                                      fixed: object
                                                      contentType:
                                                        $type: StringType
                                                        _ref: 1
                                                      required: true
                                                    name: /components/schemas/delayInMilliseconds
                                                    compositor: true
                                                    compositorObj:
                                                      $type: AllCompositor
                                                      types:
                                                      - $type: ElementType
                                                        minOccurs: 0
                                                        localName: afterTestExecution
                                                        bodyType:
                                                          $type: ComplexType
                                                          _id: 7
                                                          attributes:
                                                          - ns: ""
                                                            name: type
                                                            defaultValue: object
                                                            fixed: object
                                                            contentType:
                                                              $type: StringType
                                                              _ref: 1
                                                            required: true
                                                          name: /components/schemas/testExecutionDelay
                                                          compositor: true
                                                          compositorObj:
                                                            $type: AllCompositor
                                                            types:
                                                            - $type: ElementType
                                                              minOccurs: 0
                                                              localName: onlyApplyForScenarios
                                                              bodyType:
                                                                $type: ComplexType
                                                                _ref: 3
                                                            - $type: ElementType
                                                              minOccurs: 0
                                                              localName: value
                                                              bodyType:
                                                                $type: ComplexType
                                                                _ref: 4
                                                      - $type: ElementType
                                                        minOccurs: 0
                                                        localName: beforeTestExecution
                                                        bodyType:
                                                          $type: ComplexType
                                                          _ref: 7
                                          - $type: ElementType
                                            localName: id
                                            bodyType:
                                              $type: ComplexType
                                              _ref: 2
                        - $type: ElementType
                          minOccurs: 0
                          localName: testExecution
                          bodyType:
                            $type: ComplexType
                            attributes:
                            - ns: ""
                              name: type
                              defaultValue: object
                              fixed: object
                              contentType:
                                $type: StringType
                                _ref: 1
                              required: true
                            name: /components/schemas/testExecution
                            compositor: true
                            compositorObj:
                              $type: AllCompositor
                              types:
                              - $type: ElementType
                                minOccurs: 0
                                localName: executionMode
                                bodyType:
                                  $type: ComplexType
                                  attributes:
                                  - ns: ""
                                    name: type
                                    defaultValue: enum
                                    fixed: enum
                                    contentType:
                                      $type: StringType
                                      _ref: 1
                                    required: true
                                  content: true
                                  contentObj:
                                    $type: EnumType
                                    values:
                                    - '"TESTS_RUN_SEQUENTIALLY"'
                                    - '"TESTS_RUN_CONCURRENTLY"'
                                    baseType: anonymous
                                  name: /components/schemas/executionMode
                                  compositor: true
                                  compositorObj:
                                    $type: SequenceCompositor
                  - $type: ElementType
                    minOccurs: 0
                    localName: referenced
                    bodyType:
                      $type: ComplexType
                      _ref: 3
                  - $type: ElementType
                    minOccurs: 0
                    localName: referenceLocation
                    bodyType:
                      $type: ComplexType
                      attributes:
                      - ns: ""
                        name: type
                        defaultValue: object
                        fixed: object
                        contentType:
                          $type: StringType
                          _ref: 1
                        required: true
                      name: /components/schemas/fileLocation
                      compositor: true
                      compositorObj:
                        $type: AllCompositor
                        types:
                        - $type: ElementType
                          minOccurs: 0
                          localName: external
                          bodyType:
                            $type: ComplexType
                            _ref: 2
                        - $type: ElementType
                          minOccurs: 0
                          localName: id
                          bodyType:
                            $type: ComplexType
                            _ref: 2
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              attributes:
              - replacedColumn: ""
                value:
                  $type: StringValue
                  replacedColumn: ""
                  value: object
                  xmlEncoding: 2
                useValue: true
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
                    values:
                    - $type: ElementValue
                      replacedColumn: ""
                    - $type: ElementValue
                      replacedColumn: ""
                    - $type: ElementValue
                      replacedColumn: ""
                    - $type: ElementValue
                      replacedColumn: ""
                      values:
                      - $type: ComplexValue
                        replacedColumn: ""
                        allowArrayExclude: true
                        attributes:
                        - replacedColumn: ""
                          value:
                            $type: StringValue
                            replacedColumn: ""
                            value: array
                            xmlEncoding: 2
                          useValue: true
                        compositorValue: true
                        compositorValueObj:
                          replacedColumn: ""
                          values:
                            $type: CompositorValueSetCollectionSet
                            set:
                            - $type: CompositorValueSet
                              values:
                              - $type: ElementValue
                                replacedColumn: ""
                                values:
                                - $type: ComplexValue
                                  replacedColumn: ""
                                  allowArrayExclude: true
                                  attributes:
                                  - replacedColumn: ""
                                    value:
                                      $type: StringValue
                                      replacedColumn: ""
                                      value: object
                                      xmlEncoding: 2
                                    useValue: true
                                  compositorValue: true
                                  compositorValueObj:
                                    replacedColumn: ""
                                    values:
                                      $type: CompositorValueSetCollectionSet
                                      set:
                                      - $type: CompositorValueSet
                                        values:
                                        - $type: ElementValue
                                          replacedColumn: ""
                                          values:
                                          - $type: ComplexValue
                                            replacedColumn: ""
                                            attributes:
                                            - replacedColumn: ""
                                              value:
                                                $type: StringValue
                                                replacedColumn: ""
                                                value: string
                                                xmlEncoding: 2
                                              useValue: true
                                            contentValue: true
                                            contentValueObj:
                                              $type: StringValue
                                              replacedColumn: ""
                                              value: ""
                                              xmlEncoding: 2
                                            compositorValue: true
                                            compositorValueObj:
                                              replacedColumn: ""
                                              values:
                                                $type: CompositorValueSetCollectionSet
                                                set:
                                                - $type: CompositorValueSet
                                        - $type: ElementValue
                                          replacedColumn: ""
                                        - $type: ElementValue
                                          replacedColumn: ""
                                          values:
                                          - $type: ComplexValue
                                            replacedColumn: ""
                                            attributes:
                                            - replacedColumn: ""
                                              value:
                                                $type: StringValue
                                                replacedColumn: ""
                                                value: boolean
                                                xmlEncoding: 2
                                              useValue: true
                                            contentValue: true
                                            contentValueObj:
                                              $type: BooleanValue
                                              replacedColumn: ""
                                              value: "true"
                                            compositorValue: true
                                            compositorValueObj:
                                              replacedColumn: ""
                                              values:
                                                $type: CompositorValueSetCollectionSet
                                                set:
                                                - $type: CompositorValueSet
                                        - $type: ElementValue
                                          replacedColumn: ""
                                        - $type: ElementValue
                                          replacedColumn: ""
                                        - $type: ElementValue
                                          replacedColumn: ""
                                        - $type: ElementValue
                                          replacedColumn: ""
                    - $type: ElementValue
                      replacedColumn: ""
                    - $type: ElementValue
                      replacedColumn: ""
                    - $type: ElementValue
                      replacedColumn: ""
          elementTypeName: root
        hasServiceInfo: true
        serviceInfo:
          serviceDescriptor:
            $type: StandardServiceDescriptor
            location: http://ulvbdparas01.rei.com:9080/soavirt/api/v6
        jsonBuilder:
          hasValue: true
          value:
            $type: JSONObjectValue
            nameIsNull: true
        schemaURL:
          MessagingClient_SchemaLocation: "${HOST}:${PORT}/soavirt/api/v6"
        formInput:
          value:
            $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: ":"
            replacedColumn: ""
            values:
            - $type: ComplexValue
              replacedColumn: ""
              compositorValue: true
              compositorValueObj:
                replacedColumn: ""
                values:
                  $type: CompositorValueSetCollectionSet
                  set:
                  - $type: CompositorValueSet
        jmsMessageOutputProvider:
          $type: JMSMessageOutputProvider
          jmsOutputProviderRequest:
            $type: JMSOutputProvider
            name: Request Object
            menuName: Object
          jmsOutputProviderResponse:
            $type: JMSOutputProvider
            name: Response Message Object
            menuName: Message Object
        transportProperties:
          manager:
            protocol: 1
            properties:
            - $type: HTTPClientHTTPProperties
              followRedirects:
                bool: true
              common:
                auth:
                  useDefault: false
                  authName: Basic
                method:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: GET
              protocol: 1
              keepAlive1_1:
                bool: true
            - $type: HTTPClientHTTPProperties
              followRedirects:
                bool: true
              common:
                auth:
                  useDefault: false
                  authName: Basic
                method:
                  values:
                  - $type: ScriptedValue
                  fixedValue:
                    $type: HTTPMethodTestValue
                    method: GET
              keepAlive1_1:
                bool: true
            - $type: NoneTransportProperties
          messageExchangePattern:
            inverted: true
        outputProviders:
          requestHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Request Transport Header
          responseHeader:
            $type: HTTPNamedToolOutputProvider
            menuName: Transport Header
            name: Response Transport Header
          xmlRequestOutput:
            $type: NamedXMLToolOutputProvider
            menuName: Traffic
            name: Request Traffic
          trafficOutput:
            m_name: Traffic Stream
          objectOutput:
            $type: ObjectOutputProvider
            outputTools:
            - $type: TrafficViewer
              iconName: TrafficViewer
              name: Traffic Viewer
              showRequestHeaders: true
              showResponseHeaders: true
            name: Traffic Object
        method:
          hasCode: true
          code:
            $type: ScriptCode
            input:
              useText: true
              textInput:
                $type: ScriptingTextInput
                text: "import com.parasoft.api.*;\r\n\r\npublic String newVars(ScriptingContext\
                  \ context)\r\n{\r\n\t\r\n\tString requestStart = \"{\\\"variables\\\
                  \":[\";\r\n\tString requestEnd = \"]}\";\r\n\tString[] vars = context.getValue(\"\
                  variablesToAdd\").split(\",\");\r\n\tArrayList<String> varList =\
                  \ new ArrayList<String>();\r\n\tfor(String var : vars)\r\n\t{\r\n\
                  \t\tif(!var.equals(\"\") && !varList.contains(var))\r\n\t\t{\r\n\
                  \t\t\tvarList.add(var);\r\n\t\t}\r\n\t}\r\n\t\r\n\tvarList.trimToSize();\r\
                  \n\tString requestBody = \"\";\r\n\tfor(int i=0; i < varList.size();\
                  \ i++)\r\n\t{\r\n\t\tif(i > 0)\r\n\t\t\trequestBody += \",\";\r\n\
                  \t\trequestBody += \"{\\\"name\\\":\\\"\" + varList.get(i) + \"\\\
                  \",\\\"type\\\":\\\"STRING\\\",\\\"useValueFromParentSuite\\\":false}\"\
                  ;\r\n\t}\r\n\t\r\n\treturn requestStart + requestBody + requestEnd;\r\
                  \n}\r\n"
          hasMethodId: true
          methodId:
            $type: ScriptMethodIdentifier
            functionName: newVars
            arguments:
            - com.parasoft.api.ScriptingContext
        literal:
          use: 1
          text:
            MessagingClient_LiteralMessage: "{\"variables\":[{\"name\":\"\",\"useValueFromParentSuite\"\
              :true}]}"
            type: application/json
          dataSource:
            columnName: File Contents
        mode: Scripted
        literalQuery:
          isPropertiesRef: true
        constrainedQuery:
          parameters:
          - $type: ElementValue
            writeType: true
            hasReference: true
            qnameAsString: :id
            replacedColumn: ""
            values:
            - $type: StringValue
              replacedColumn: ""
              mode: 3
              columnName: TopTestSuiteID
              value: ""
              xmlEncoding: 2
        resourceMethod:
          resourceId: /v6/suites/testSuites
          httpMethod: PUT
        resourceMode: 3
        baseUrl:
          values:
          - $type: ScriptedValue
          - $type: WadlTestValue
            value: http://localhost:9080/soavirt/api
          fixedValue:
            $type: StringTestValue
          selectedIndex: 1
