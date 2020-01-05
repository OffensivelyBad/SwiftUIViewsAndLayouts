import SwiftUI
import PlaygroundSupport

//test
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

// spacers

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

// explicit spacer
struct ContentView2: View {
    var body: some View {
        VStack {
            Text("hello warld")
            Spacer()
                .frame(minHeight: 50, maxHeight: 100)
        }
    }
}

// zstack
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

// conditional views 1
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

// conditional views 2

struct ContentView5: View {
    var body: some View {
        if Bool.random() {
            return AnyView(Image(systemName: "cloud.fill"))
        } else {
            return AnyView(Text("no luck"))
        }
    }
}

//for each - explicit
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

// for each
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


//for each, identifiable
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

// size class / device orientation
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

// custom frames
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


// geometry reader - split views in half
struct ContentView11: View {
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: geometry.size.width / 2, height: 100)
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: geometry.size.width / 2, height: 100)
            }
        }
    }
}


// fill view
struct ContentView12: View {
    
    var body: some View {
        Text("hallo warld")
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.blue)
            .edgesIgnoringSafeArea(.all)
    }
}


// scroll view
struct ContentView13: View {
    
    var body: some View {
        ScrollView([.horizontal, .vertical], showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(0..<10) {
                    Text("Text \($0)")
                        .font(.largeTitle)
                        .frame(width: 200, height: 100)
                        .foregroundColor(.white)
                        .background(Color.red)
                }
            }
        }
    }
}


// animated scrolling
struct ContentView14: View {
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(1..<10) { num in
                    VStack {
                        GeometryReader { geo in
                            Text("Number \(num)")
                                .font(.largeTitle)
                                .padding()
                                .background(Color.red)
                                .rotation3DEffect(.degrees(10), axis: (x: 0, y: 1, z: 0))
//                                .rotation3DEffect(.degrees(-Double(geo.frame(in: .global).minX) / 8), axis: (x: 0, y: 1, z: 0)) // this do
                        }
                    }
                    .frame(width: 180)
                }
            }
            .padding()
        }
    }
}

// animation with drag gesture
struct ContentView15: View {
    @State var dragAmount = CGSize.zero
    
    var body: some View {
        VStack {
            GeometryReader { geo in
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 300, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .rotation3DEffect(.degrees(-Double(self.dragAmount.width) / 20), axis: (x: 0, y: 1, z: 1))
                    .rotation3DEffect(.degrees(Double(self.dragAmount.height) / 20), axis: (x: 1, y: 0, z: 0))
                    .offset(self.dragAmount)
                .gesture (
                    DragGesture()
                        .onChanged {
                            self.dragAmount = $0.translation
                        }
                    .onEnded { _ in
                        withAnimation(.spring()) {
                            self.dragAmount = .zero
                        }
                    }
                )
            }
        }
    }
}

// grid layout
struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0 ..< rows) { row in
                HStack {
                    ForEach(0 ..< self.columns) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
    
    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
}

struct ContentView16: View {
    var body: some View {
        GridStack(rows: 4, columns: 4) { row, col in
            Image(systemName: "\(row * 4 + col).circle")
            Text("R\(row) C\(col)")
        }
    }
}

PlaygroundPage.current.setLiveView(ContentView16())
