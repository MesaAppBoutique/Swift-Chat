//
//  ContentView.swift
//  Swift Chat
//
//  Created by Alycia Saris on 11/8/20.
//  Copyright © 2020 Alycia Saris. All rights reserved.
//

import SwiftUI

//create a structure that will reoresent each message in chat
struct ChatMessage : Hashable {
    var message: String
    var avatar: String
    var color: Color
    var isMe: Bool = false
}


struct ContentView: View {
    // dog and cat will exchange messages
    //dog sends Hello World with a red bubble color
    //cat sends Hi with a blue message color
    // @State needed to make composed message variable accessible from different views
    @State var composedMessage: String = ""
    @EnvironmentObject var chatController: ChatController
    
    var body: some View {
        // create a List in SwiftUI
        VStack {
            List {
                //we have several messages so we will use a for loop
                ForEach(chatController.messages, id: \.self) { msg in
                
                    ChatRow(chatMessage: msg)
                }
            }
        
        HStack {
            // textfield generates value for composedMessage @State var
            TextField("Message...", text: $composedMessage).frame(minHeight: CGFloat(30))
            // button triggers the sendMessage() func
            Button(action: sendMessage){
                Text("Send")
            }
            }.frame(minHeight:CGFloat(50)).padding()
        }
    }
    func sendMessage(){
        chatController.sendMessage(ChatMessage(message: composedMessage, avatar: "🐦", color: .green, isMe: true))
        composedMessage = ""
    }

}

struct ChatRow : View {
    
    // we will need to access and represent the chatmessages here
    
    var chatMessage: ChatMessage
   
    // body - is the body of the view
    
    var body: some View {
    // HStack - is a horizontal stack. place contents horzontally
        Group {
            if !chatMessage.isMe {
                
            HStack {
                Group {
                    Text(chatMessage.avatar)
                    Text(chatMessage.message)
                            .bold()
                            .padding(10)
                            .foregroundColor(Color.white)
                            .background(chatMessage.color)
                            .cornerRadius(10)
                }
                }
            } else {
                HStack {
                    Group {
                        Spacer()
                        Text(chatMessage.message)
                        .bold()
                        .foregroundColor(Color.white)
                        .padding(10)
                        .background(chatMessage.color)
                        .cornerRadius(10)
                        Text(chatMessage.avatar)
                    }
                }
            }
        }
    }
}






#if DEBUG

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .environmentObject(ChatController())
    }
}
#endif
