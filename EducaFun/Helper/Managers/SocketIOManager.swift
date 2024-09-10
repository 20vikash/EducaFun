//
//  SocketIOManager.swift
//  EducaFun
//
//  Created by Vikash on 10/09/24.
//

import Foundation
import SocketIO

class SocketIOManager: ObservableObject {
    private var manager: SocketManager!
    private var socket: SocketIOClient!
    
    @Published var isLoading: Bool = false
    
    init() {
        let url = URL(string: "http://127.0.0.1:5000")!
        manager = SocketManager(socketURL: url, config: [.log(true), .compress])
        socket = manager.defaultSocket
        
        socket.on(clientEvent: .connect) { _, _ in
            DispatchQueue.main.async {
                print("Connected to server")
            }
        }
        
        socket.on("message") { data, _ in
            if let message = data[0] as? String {
                DispatchQueue.main.async {
                    print("Received message: \(message)")
                }
            }
        }
        
        socket.on("match_making") { [weak self] data, _ in
            if let data = data[0] as? [String: Any] {
                let player1 = data["player1"] as? String
                let player2 = data["player2"] as? String
                let userUID = TokenManager.getUID()
                
                print("player1 \(player1 ?? "no1")")
                print("player2 \(player2 ?? "no2")")
                
                if (player1 == userUID || player2 == userUID) {
                    DispatchQueue.main.async {
                        self?.isLoading = false
                        print("Match found")
                    }
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
