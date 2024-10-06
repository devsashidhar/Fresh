import SwiftUI

struct ContentView: View {
    @State private var isLoginMode = true
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var leafOffsetY: CGFloat = -200 // Initial vertical position of the leaf
    @State private var leafOpacity: Double = 1.0 // Initial opacity of the leaf

    var body: some View {
        ZStack {
            // Background Gradient
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()

            VStack {
                Spacer()

                // Title with Falling Leaf Animation
                ZStack {
                    Text("Wander")
                        .font(.custom("Noteworthy", size: 50))
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.3), radius: 5, x: 2, y: 2)

                    // Falling leaf animation
                    Image(systemName: "leaf.fill")
                        .foregroundColor(.green)
                        .font(.system(size: 40))
                        .offset(x: 0, y: leafOffsetY)
                        .opacity(leafOpacity)
                        .onAppear {
                            withAnimation(
                                Animation.easeInOut(duration: 3.0)
                                    .repeatCount(1, autoreverses: false)
                            ) {
                                leafOffsetY = 600 // Drop the leaf straight down onto the button
                                leafOpacity = 0 // Fade out the leaf as it falls
                            }
                        }
                }
                .padding(.bottom, 20)

                VStack(spacing: 20) {
                    Picker("Login or Signup", selection: $isLoginMode) {
                        Text("Login").tag(true)
                        Text("Signup").tag(false)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.horizontal, 16)

                    VStack(spacing: 16) {
                        // Email Field
                        TextField("Email", text: $email)
                            .padding()
                            .background(Color.white.opacity(0.2))
                            .cornerRadius(8)
                            .padding(.horizontal, 16)
                            .disableAutocorrection(true)

                        // Password Field
                        SecureField("Password", text: $password)
                            .padding()
                            .background(Color.white.opacity(0.2))
                            .cornerRadius(8)
                            .padding(.horizontal, 16)

                        // Confirm Password Field (only in Signup mode)
                        if !isLoginMode {
                            SecureField("Confirm Password", text: $confirmPassword)
                                .padding()
                                .background(Color.white.opacity(0.2))
                                .cornerRadius(8)
                                .padding(.horizontal, 16)
                        }

                        // Button for Sign In / Sign Up
                        Button(action: handleAction) {
                            Text(isLoginMode ? "Sign In" : "Sign Up")
                                .frame(width: 200) // Set a fixed width for the button
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(20) // Make the button rounded
                                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
                        }
                        .padding(.top, 16) // Add some spacing from the fields
                    }
                }
                .frame(maxWidth: 350) // Constrain the width of the form
                .padding(.vertical, 20)

                Spacer()
            }
        }
        .navigationTitle(isLoginMode ? "Login" : "Signup")
    }

    func handleAction() {
        if isLoginMode {
            // Handle login logic here
            print("Logging in with \(email) and password")
        } else {
            // Handle signup logic here
            print("Signing up with \(email), password and confirm password")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
