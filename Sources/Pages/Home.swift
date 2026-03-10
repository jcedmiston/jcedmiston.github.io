import Foundation
import Ignite

struct Home: StaticPage {
    var title = "Home"

    var body: some HTML {
        NavigationBar(logo: "Joseph Edmiston") {
            Link("Resume", target: "#")
            Link("Contact", target: "#")
        }
        .width(.viewport)
        .position(.fixedTop)
        ZStack {
            VStack {
                Image("/images/bike.svg", description: "A bike")
                    .frame(width: 800)
                    .opacity(0.4)
                Image("/images/ped.svg", description: "A pedestrian")
                    .frame(height: 600)
                    .opacity(0.4)
            }
            Text("Hello world!")
                .font(.title1)
        }
        .margin(60)
    }
}
