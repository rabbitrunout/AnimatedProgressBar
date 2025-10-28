import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ProgressViewModel()
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Firebase Progress Bar")
                .font(.title2.bold())
            
            ProgressBar(progress: viewModel.progress, barHeight: 25, gradientColors: [.green, .mint])
                .frame(height: 25)
                .padding(.horizontal)
            
            HStack(spacing: 20) {
                Button("Reset") {
                    withAnimation {
                        viewModel.progress = 0.0
                        viewModel.saveProgress()
                    }
                }
                .buttonStyle(.borderedProminent)
                
                Button("Increase") {
                    withAnimation {
                        viewModel.progress = min(viewModel.progress + 0.1, 1.0)
                        viewModel.saveProgress()
                    }
                }
                .buttonStyle(.borderedProminent)
                
                Button("Random") {
                    withAnimation {
                        viewModel.progress = Double.random(in: 0...1)
                        viewModel.saveProgress()
                    }
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
