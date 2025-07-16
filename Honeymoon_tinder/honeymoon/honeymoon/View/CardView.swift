import SwiftUI

struct CardView: View, Identifiable {
    // MARK: - PROPERTIES

    let id = UUID()
    var honeymoon: Destination

    var body: some View {
        Image(honeymoon.image)
            .resizable()
            .cornerRadius(24)
            .scaledToFit()
            .frame(minWidth: 0, maxWidth: .infinity)
            .overlay(
                VStack(alignment: .center, spacing: 12) {
                    destintyTitle(honeymoon: honeymoon)
                    destinationSubtitle(honeymoon: honeymoon)
                }
                .frame(minWidth: 280)
                .padding(.bottom, 50)
                .background(
                    Color.white.opacity(0.05)
                        .background(.ultraThinMaterial)
                          .clipShape(RoundedRectangle(cornerRadius: 16))
                          .padding(.bottom, 20)

                ),    alignment: .bottom
                
            )
    }

    @ViewBuilder
    func destintyTitle(honeymoon: Destination) -> some View {
        Text(honeymoon.place.uppercased())
            .foregroundColor(Color.white)
            .font(.largeTitle)
            .fontWeight(.bold)
            .shadow(radius: 1)
            .padding(.horizontal, 18)
            .padding(.vertical, 4)
            .overlay(
                Rectangle()
                    .fill(Color.white)
                    .frame(height: 2),
                alignment: .bottom
            )
    }
    
    @ViewBuilder
    func destinationSubtitle(honeymoon: Destination) -> some View {
        Text(honeymoon.country.uppercased())
            .foregroundColor(Color.black)
            .font(.footnote)
            .fontWeight(.bold)
            .frame(minWidth: 85)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(
                Capsule().fill(Color.white)
            )
    }

}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(honeymoon: honeymoonData[0])
            .previewLayout(.fixed(width: 375, height: 600))
    }
}
