import PackageDescription

let package = Package(
    name: "KeepAlive",
    dependencies:[
      //.Package(url:"https://github.com/iachievedit/MQTT", majorVersion:0),
      .Package(url:"../../MQTT", majorVersion:0),
      .Package(url:"https://github.com/iachievedit/swiftlog", majorVersion:1)
    ]
)
