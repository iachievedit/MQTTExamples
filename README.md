# MQTTExamples
Example MQTT Clients

Note: These examples are on the bleeding edge of Swift 3.0 on Linux.  To get started with Swift 3.0 you can either
pull down the latest DEVELOPMENT-SNAPSHOT from [Apple] (https://swift.org/download/#snapshots), or obtain Swift 3.0 from
the [iAchieved.it Ubuntu repository](http://dev.iachieved.it/iachievedit/introducing-swift-3-0/).

## KeepAlive
```
# git clone https://github.com/iachievedit/MQTTExamples
# cd MQTTExample/KeepAlive
# swift build
# .build/debug/KeepAlive
```

The MQTT client will `CONNECT` to the test broker at http://www.mqtt-dashboard.com and `PUBLISH` a message to the topic
`/dallas/temperature/value`.  It will repeat publishing a value to this path every 30 seconds.  In addition, every 10 seconds
it will send a `PING` message to the broker and expect to receive a `PONG`.

### About
These clients make use of a [Swift port of MQTT](https://github.com/iachievedit/MQTT).
All examples should be considered experimental as both they and the MQTT library are based upon Swift 3.0.

### Twitter
@iachievedit
