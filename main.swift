//
//  main.swift
//  Connection
//
//  Created by Kevin Musselman on 2/2/16.
//  Copyright © 2016 Pilot Foundation. All rights reserved.
//

import Foundation
import Connection

print("Starting Server")

do {
    let server = try Server(port:8080)
    //    try! server.start(8080)
    print("Server started on port 8080...")
    try! server.serve({ (connection) in
        print("INSIDE HERE")
        let message         = "Hello World"
        let contentLength   = message.utf8.count
        
        connection.write("HTTP/1.1 200 OK\n")
        connection.write("Server: Pilot 0.0.0\n")
        connection.write("Content-length: \(contentLength)\n")
        connection.write("Content-type: text-plain\n")
        connection.write("\r\n")
        
        connection.write(message)
        connection.close()
    })    
}
catch {
    print("Fail boat")
}