import SwiftUI

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
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
                
                // Password
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
                
                // Login Button
                Button(action: {
                    // Простая логика для примера
                    if !email.isEmpty && !password.isEmpty {
                        isLoggedIn = true
                    }
                }) {
                    Text("Login")
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
                }
                .scaleEffect(isLoggedIn ? 0.95 : 1.0) // лёгкая анимация при нажатии
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value: isLoggedIn)

                
                Spacer()
            }
            .padding()
            .fullScreenCover(isPresented: $isLoggedIn) {
                // Экран после логина
                VStack {
                    Text("Hello, \(email)!")
                        .font(.title)
                        .padding()
                    Button("Logout") {
                        isLoggedIn = false
                        email = ""
                        password = ""
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
