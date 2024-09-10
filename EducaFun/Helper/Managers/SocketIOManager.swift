//
//  SocketIOManager.swift
//  EducaFun
//
//  Created by Vikash on 10/09/24.
//

import Foundation
import SocketIO

class SocketIOManager {
    private var manager: SocketManager!
    private var socket: SocketIOClient!
    
    @Published var message: String = "Waiting for messages..."
    
    init() {
        let url = URL(string: "http://127.0.0.1:5000")!
        manager = SocketManager(socketURL: url, config: [.log(true), .compress])
        socket = manager.defaultSocket
        
        socket.on(clientEvent: .connect) { [weak self] _, _ in
            DispatchQueue.main.async {
                print("Connected to server")
                self?.message = "Connected to server"
            }
        }
        
        socket.on("message") { [weak self] data, _ in
            if let message = data[0] as? String {
                DispatchQueue.main.async {
                    print("Received message: \(message)")
                    self?.message = message
                }
            }
        }
        
        socket.on("match_making") { [weak self] data, _ in
            if let data = data[0] as? [String: Any] {
                DispatchQueue.main.async {
                    self?.message = data["player1"] as? String ?? "No data"
                }
            }
        }
        
        socket.connect()
    }
    
    func sendMessage(_ message: String) {
        socket.emit("message", message)
    }
    
    func matchMaking(data: [String: Any]) {
        socket.emit("match_making", data)
    }
}
