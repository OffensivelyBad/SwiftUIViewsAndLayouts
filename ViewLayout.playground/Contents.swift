import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0) {
            Text("hello warld")
            Divider()
            Text("you mean world")
            HStack {
                Text("hello warld1")
                    .frame(width: 50, height: 100)
                Text("you mean world1")
            }
            VStack(alignment: .leading, spacing: 20) {
                Text("hello warld2")
                    .padding(.bottom, 100)
                Text("you mean world2")
            }
            VStack(alignment: .leading, spacing: 20) {
                Text("hello warld3")
                Spacer()
                Text("you mean world3")
            }
        }
    }
}

struct ContentView1: View {
    var body: some View {
        VStack {
            VStack() {
                Spacer()
                Text("hello warld")
                Spacer()
                Spacer()
                Spacer()
            }
            VStack() {
                Text("hello warld1")
                Spacer()
                    .frame(height: 50)
                Text("you mean world1")
            }
        }
    }
}

struct ContentView2: View {
    var body: some View {
        VStack {
            Text("hello warld")
            Spacer()
                .frame(minHeight: 50, maxHeight: 100)
        }
    }
}

struct ContentView3: View {
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                Image(systemName: "cloud.heavyrain.fill")
                    .foregroundColor(.red)
                    .font(.largeTitle)
                Text("hello warld")
                    .font(.largeTitle)
                    .foregroundColor(.yellow)
            }
            ZStack {
                Rectangle()
                    .fill(Color.green)
                    .frame(width: 50, height: 50)
                    .zIndex(1)
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 100, height: 100)
            }
        }
    }
}

struct ContentView4: View {
    var body: some View {
        Group {
            if Bool.random() {
                Image(systemName: "cloud.fill")
            } else {
                Text("no luck")
            }
        }
    }
}

struct ContentView5: View {
    var body: some View {
        if Bool.random() {
            return AnyView(Image(systemName: "cloud.fill"))
        } else {
            return AnyView(Text("no luck"))
        }
    }
}

struct ContentView6: View {
    let colors: [Color] = [.red, .green, .blue]
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach((1...10).reversed(), id: \.self) {
                Text("\($0)")
            }
            Text("Here we go!")
            Spacer()
            ForEach(colors, id: \.self) { color in
                Text(color.description.capitalized)
                    .padding()
                    .background(color)
            }
        }
    }
}

struct Result {
    var id = UUID()
    var score: Int
}

struct ContentView7: View {
    let results = [Result(score: 8), Result(score: 1), Result(score: 10)]
    
    var body: some View {
        VStack {
            ForEach(results, id: \.id) { result in
                Text("Result: \(result.score)")
            }
        }
    }
}

struct IDResult: Identifiable {
    var id = UUID()
    var score: Int
}

struct ContentView8: View {
    let results = [IDResult(score: 8), IDResult(score: 1), IDResult(score: 10)]
    
    var body: some View {
        VStack {
            ForEach(results) { result in
                Text("Result: \(result.score)")
            }
        }
    }
}

struct ContentView9: View {
    @Environment(\.horizontalSizeClass)
    var horizontalSizeClass: UserInterfaceSizeClass?
    
    var body: some View {
        if horizontalSizeClass == .compact {
            return Text("compact")
        } else {
            return Text("regular")
        }
    }
}

struct ContentView10: View {
    
    var body: some View {
        ZStack {
            Button(action: {
                print("button tapped")
            }) {
                Text("Welcome")
                    .frame(minWidth: 0, maxWidth: 200, minHeight: 0, maxHeight: 200)
                    .font(.largeTitle)
            }
            
            Text("Please login")
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .foregroundColor(.white)
                .background(Color.red)
                .edgesIgnoringSafeArea(.all)
        }
    }
}


PlaygroundPage.current.setLiveView(ContentView10())
