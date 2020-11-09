//
//  ChatController.swift
//  Swift Chat
//
//  Created by Alycia Saris on 11/9/20.
//  Copyright © 2020 Alycia Saris. All rights reserved.
//

import Combine
import SwiftUI

// chat controller needs to be an ObservableObject in order to be accessible by SwiftUI

class ChatController : ObservableObject {
    // didChange will let the SwiftUI know that some changes have happened in this object
    
    var didChange = PassthroughSubject<Void, Never>()
    
    //add messages
    @Published  var messages = [
           ChatMessage(message: "Hello World!", avatar: "🐶", color: .red),
           ChatMessage(message: "Hi.", avatar: "🐱", color: .blue)
       ]
       
    // this function will be accessible from SwiftUI main view
    // add code necessary ti send messages
    func sendMessage(_ chatMessage: ChatMessage) {
        // populate the messages array
        messages.append(chatMessage)
        // let SwiftUI know that we need to rebuild the views
        didChange.send(())
    }
}
