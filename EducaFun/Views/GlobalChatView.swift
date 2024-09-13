import SwiftUI

// Model to represent messages
struct Message: Identifiable {
    let id = UUID()
    let text: String
    let isCurrentUser: Bool // Determines if the message is from the current user
}

struct GlobalChatView: View {
    @State var message: String = ""
    @State var messages: [Message] = []  // Array to hold messages
    
    var body: some View {
        ZStack {
            // Background RadialGradient
            RadialGradient(stops: [
                .init(color: Color(red: 0.9, green: 0.8, blue: 0.7), location: 0.01),
                .init(color: Color(red: 0.6, green: 0.3, blue: 0.1), location: 0.3),
            ], center: .center, startRadius: 100, endRadius: 1000)
            .ignoresSafeArea()
            Rectangle()
                .fill(Color.white.opacity(0.4))
                .frame(width:370, height: 750)
                .cornerRadius(30)
                .padding(.horizontal, 5)
            VStack(spacing: 15) {
                // Title
                VStack(spacing: -20){
                    ZStack{
                        Image("sword")
                            .resizable()
                            .frame(width: 150, height: 150)
                        Text("Clan Chat")
                            .bold()
                            .font(.system(size: 40))
                    }
                    // Subtitle
                    Text("Form Strategies to Win!")
                        .bold()
                        .font(.system(size: 13))
                        .padding(.top, 12)
                        
                }
                // Message List
                ScrollView {
                    VStack {
                        ForEach(messages) { message in
                            HStack {
                                if message.isCurrentUser {
                                    Spacer()
                                    // User's message on the right
                                    HStack {
                                        Text(message.text)
                                            .padding()
                                            .background(Color.blue.opacity(0.3))
                                            .cornerRadius(15)
                                        // User's profile pic
                                        Image(systemName: "person.circle.fill")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                    }
                                } else {
                                    // Other user's message on the left
                                    HStack {
                                        // Other user's profile pic
                                        Image(systemName: "person.circle.fill")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                        Text(message.text)
                                            .padding()
                                            .background(Color.gray.opacity(0.3))
                                            .cornerRadius(15)
                                    }
                                    Spacer()
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                .frame(height: 500)  // Adjust the height for the message list
                
                // Input Field and Send Button
                ZStack {
                    HStack {
                        // TextEditor for typing a message
                        TextEditor(text: $message)
                            .frame(height: 40)  // Restrict height of the editor
                            .padding()
                            .background(Color.white)
                            .cornerRadius(100)
                        
                        // Send Button
                        Button(action: {
                            sendMessage()
                        }) {
                            Text("Send")
                                .padding()
                                .foregroundColor(.blue)
                                .cornerRadius(15)
                        }
                    }
                    .padding()
                    .chatpadded()
                    .padding(.bottom, 10)
                    
                }
            }
            .padding(.top, -10)
        }
    }
    
    // Function to handle sending a message
    func sendMessage() {
        guard !message.isEmpty else { return }
        // Add the user's message to the messages array
        messages.append(Message(text: message, isCurrentUser: true))
        message = ""  // Clear the input field
    }
}

#Preview {
    GlobalChatView()
}

struct chatpad: ViewModifier{
   func body (content: Content) -> some View{
       content
           .font(.system(size: 15))
           .frame(width:330, height:60)
           .background(Color.white)
           .clipShape(.rect(cornerRadius: 65))
           .shadow(radius: 0.5)
           
       }
}

extension View{
  func chatpadded() -> some View{
      self.modifier(chatpad())
  }
}
