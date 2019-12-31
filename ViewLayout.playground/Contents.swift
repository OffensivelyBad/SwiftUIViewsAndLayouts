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

PlaygroundPage.current.setLiveView(ContentView3())
