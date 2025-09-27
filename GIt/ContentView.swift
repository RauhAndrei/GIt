import SwiftUI

// MARK: - ViewModifiers
struct InputFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10)
    }
}

struct LoginButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]),
                               startPoint: .leading,
                               endPoint: .trailing)
            )
            .cornerRadius(12)
            .shadow(color: Color.purple.opacity(0.4), radius: 8, x: 0, y: 4)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value: configuration.isPressed)
    }
}

// MARK: - ContentView
struct ContentView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Welcome Back")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Please log in to continue")
                    .foregroundColor(.gray)
                
                // Email
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .modifier(InputFieldModifier())
                
                // Password
                SecureField("Password", text: $password)
                    .modifier(InputFieldModifier())
                
                // Login Button
                Button(action: {
                    if !email.isEmpty && !password.isEmpty {
                        isLoggedIn = true
                    }
                }) {
                    Text("Login")
                }
                .buttonStyle(LoginButtonStyle())
                
                Spacer()
            }
            .padding()
            .fullScreenCover(isPresented: $isLoggedIn) {
                VStack(spacing: 20) {
                    Text("Hello, \(email)!")
                        .font(.title)
                        .padding()
                    Button("Logout") {
                        isLoggedIn = false
                        email = ""
                        password = ""
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
