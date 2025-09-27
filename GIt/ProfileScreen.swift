import SwiftUI

struct ProfileScreen: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Аватарка
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.blue)
                    .padding(.top, 40)
                
                // Имя и email
                Text("Andrei Rauh")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("andrei@example.com")
                    .foregroundColor(.gray)
                
                Divider().padding(.vertical, 20)
                
                // Дополнительные данные
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        Image(systemName: "phone.fill")
                            .foregroundColor(.green)
                        Text("+373 123 456 789")
                    }
                    
                    HStack {
                        Image(systemName: "location.fill")
                            .foregroundColor(.red)
                        Text("Chișinău, Moldova")
                    }
                    
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("Premium User")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 40)
                
                Spacer()
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileScreen()
}
