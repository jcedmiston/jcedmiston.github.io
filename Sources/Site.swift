import Foundation
import Ignite

@main
struct IgniteWebsite {
    static func main() async {
        var site = ExampleSite()

        do {
            try await site.publish()
        } catch {
            print(error.localizedDescription)
        }
    }
}

// Base protocol with shared theme values
protocol BaseTheme: Theme {}

// Default implementation for shared values
extension BaseTheme {
    var accent: Color { Color(hex: "#FF0000") }
    var secondaryAccent: Color { Color(hex: "#00FF00") }
}

// Light theme implementation
struct LightTheme: BaseTheme {
    var colorScheme: ColorScheme = .light
    // Uses shared accent/secondaryAccent colors
    // Other values default to stock light theme colors
}

// Dark theme implementation
struct DarkTheme: BaseTheme {
    var colorScheme: ColorScheme = .dark
    // Uses shared accent/secondaryAccent colors
    // Other values default to stock dark theme colors
}

struct ExampleSite: Site {
    var lightTheme: (any Theme)? = LightTheme()
    var darkTheme: (any Theme)? = DarkTheme()
    var name = "Hello World"
    var titleSuffix = " – My Awesome Site"
    var url = URL(static: "https://jcedmiston.github.io")
    var builtInIconsEnabled = true

    var author = "Joseph Edmiston"

    var homePage = Home()
    var layout = MainLayout()
}
