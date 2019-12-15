/// Copyright (c) 2019 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct SplashScreen: View {
  let fuberBlue = Color("Fuber blue")
  let uLineWidth: CGFloat = 5
  
  @State var percent = 0.0
  
  var body: some View {
    ZStack {
      Text("F           BER")
        .font(.largeTitle)
        .foregroundColor(.white)
        .offset(x: 20,
                y: 0)
      
      FuberU(percent: percent)
        .stroke(Color.white, lineWidth: uLineWidth)
        .onAppear() {
          self.handleAnimations()
      }
      .frame(width: 45, height: 45, alignment: .center)

      Spacer()
    }
    .frame(minWidth: 0, maxWidth: .infinity,
           minHeight: 0, maxHeight: .infinity)
      .background(fuberBlue)
      .edgesIgnoringSafeArea(.all)
  }
}

extension SplashScreen {
  var uAnimationDuration: Double { return 1.0 }
  
  func handleAnimations() {
    runAnimationPart1()
  }
  
  func runAnimationPart1() {
    withAnimation(.easeIn(duration: uAnimationDuration)) {
      percent = 1
    }
  }
}

struct FuberU: Shape {
  var percent: Double
  
  func path(in rect: CGRect) -> Path {
    let end = percent * 360
    var p = Path()
    
    p.addArc(center: CGPoint(x: rect.size.width/2, y: rect.size.width/2),
             radius: rect.size.width/2,
             startAngle: Angle(degrees: 0),
             endAngle: Angle(degrees: end),
             clockwise: false)
    return p
  }
  
  var animatableData: Double {
    get { return percent }
    set { percent = newValue }
  }
}

#if DEBUG
struct SplashScreen_Previews : PreviewProvider {
  static var previews: some View {
    SplashScreen()
  }
}
#endif