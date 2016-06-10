//
// Copyright 2016 iAchieved.it LLC
//
// MIT License (https://opensource.org/licenses/MIT)
//

import swiftlog
import Glibc
import Foundation

slogLevel = .Info // Change to .Verbose to get real chatty

let client = Client(clientId:"my-client-id")
client.host = "broker.hivemq.com"
client.port = 1883
client.keepAlive = 10 // Send keepalive heartbeat every n seconds

guard client.connect() else {
  SLogError("Unable to connect to broker.hivemq.com")
  exit(-1)
}

let reportInterval    = 30
let reportTemperature = NSTimer.scheduledTimer(NSTimeInterval(reportInterval), repeats:true){_ in
  SLogInfo("Updating temperature")
  let _ = client.publish(topic:"/dallas/temperature/value", withString:"100")
}
reportTemperature.fire()
NSRunLoop.currentRunLoop().addTimer(reportTemperature, forMode:NSDefaultRunLoopMode)
NSRunLoop.currentRunLoop().run()
