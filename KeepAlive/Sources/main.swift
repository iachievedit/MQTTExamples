//
// Copyright 2016 iAchieved.it LLC
//
// MIT License (https://opensource.org/licenses/MIT)
//

import swiftlog
import Glibc
import Foundation

slogLevel = .Verbose

SLogVerbose("Sending test message")

let client = Client(clientId:"temperature") // generate a random string
client.host = "broker.hivemq.com"
client.port = 1883
client.keepAlive = 10 // Send keepalive heartbeat every n seconds

guard client.connect() else {
  SLogError("Unable to connect to broker.hivemq.com")
  exit(-1)
}

let reportTemperature = NSTimer.scheduledTimer(NSTimeInterval(30), repeats:true){_ in
  SLogVerbose("Updating temperature")
  let _ = client.publish(topic:"/dallas/temperature/value", withString:"100")
}
NSRunLoop.currentRunLoop().addTimer(reportTemperature, forMode:NSDefaultRunLoopMode)
NSRunLoop.currentRunLoop().run()

//select(0, nil, nil, nil, nil)
