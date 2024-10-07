import SwiftUI

struct FeedView: View {
    // Sample data for demonstration
    let posts = [
        (username: "user1", imageName: "image1"),
        (username: "user2", imageName: "image2"),
        (username: "user3", imageName: "image3"),
        (username: "user4", imageName: "image4"),
        (username: "user5", imageName: "image5")
    ]

    var body: some View {
        TabView {
            ForEach(posts, id: \.username) { post in
                ZStack {
                    // Background Color or Gradient
                    LinearGradient(gradient: Gradient(colors: [Color.black, Color.gray]), startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea()

                    VStack {
                        // Username at the top
                        Text(post.username)
                            .font(.headline)
                            .padding()
                            .background(Color.black.opacity(0.6))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.top, 40)

                        Spacer()

                        // Image
                        Image(post.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height / 2)
                            .cornerRadius(20)
                            .shadow(radius: 10)

                        Spacer()
                    }
                }
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Swipeable style without page dots
        .navigationTitle("Feed")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
