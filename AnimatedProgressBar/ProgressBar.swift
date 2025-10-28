

import SwiftUI

struct ProgressBar: View {
    var progress: Double          // Value from 0.0 to 1.0
    var barHeight: CGFloat = 20
    var cornerRadius: CGFloat = 10
    var gradientColors: [Color] = [.blue, .purple]
    var backgroundColor: Color = Color.gray.opacity(0.3)
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                // Background
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(backgroundColor)
                
                // Foreground (Gradient with animation)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(
                        LinearGradient(
                            colors: gradientColors,
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(width: geometry.size.width * CGFloat(progress))
                    .animation(.easeInOut(duration: 0.8), value: progress)
                
                // Progress percentage label
                Text("\(Int(progress * 100))%")
                    .bold()
                    .foregroundColor(.black)
                    .padding(.leading, 10)
            }
        }
        .frame(height: barHeight)
    }
}

#Preview("Enhanced ProgressBar") {
    VStack(spacing: 30) {
        ProgressBar(progress: 0.0)
            .frame(height: 20)
            .padding(.horizontal)
        
        ProgressBar(progress: 0.5, barHeight: 25, gradientColors: [.orange, .red])
            .frame(height: 25)
            .padding(.horizontal)
        
        ProgressBar(progress: 0.8, barHeight: 30, gradientColors: [.green, .mint])
            .frame(height: 30)
            .padding(.horizontal)
        
        ProgressBar(progress: 1.0, barHeight: 25, gradientColors: [.pink, .purple])
            .frame(height: 25)
            .padding(.horizontal)
    }
    .padding()
}


