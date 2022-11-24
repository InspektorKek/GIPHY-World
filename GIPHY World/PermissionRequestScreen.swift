//
//  PermissionRequestScreen.swift
//  GIPHY World
//
//  Created by Mikhail Borisov on 24/11/22.
//

import SwiftUI

struct PermissionRequestScreen: View {
    @State private var isARViewPresented = false
    
    @State private var opcityTitle: CGFloat = 0
    @State private var opcityDescription: CGFloat = 0
    @State private var opcitybutton: CGFloat = 0
    
    var body: some View {
        ZStack {
            AnimatedBackground()
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 40)
            
            VStack {
                Spacer()
                Text("OH YEAH,\nONE MORE\nTHING.")
                    .multilineTextAlignment(.center)
                    .font(.montserratExtraBold(size: 36))
                    .opacity(opcityTitle)
                    .onAppear {
                        let baseAnimation = Animation.easeInOut(duration: 3)
                        
                        withAnimation(baseAnimation) {
                            opcityTitle = 1
                        }
                    }
                Spacer()
                
                VStack(spacing: 50) {
                    Text("Let's build a memes story to learn basics of creating in Augmented Reality. To begin we need access to your camera.")
                        .multilineTextAlignment(.center)
                        .font(.montserratRegular(size: 17))
                        .padding(.horizontal, 24)
                        .opacity(opcityDescription)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                let baseAnimation = Animation.easeInOut(duration: 3)
                                
                                withAnimation(baseAnimation) {
                                    opcityDescription = 1
                                }
                            }
                        }
                    
                    Button {
                        isARViewPresented.toggle()
                    } label: {
                        Text("ASK ME ALREADY")
                            .multilineTextAlignment(.center)
                            .font(.montserratBold(size: 24))
                            .foregroundColor(.white)
                            .padding(.vertical, 36)
                            .padding(.horizontal, 26)
                            .border(.white, width: 6)
                    }
                    .opacity(opcitybutton)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
                            let baseAnimation = Animation.easeInOut(duration: 1)
                            
                            withAnimation(baseAnimation) {
                                opcitybutton = 1
                            }
                        }
                    }
                }
                .padding(.bottom, 90)
            }
        }
        .fullScreenCover(isPresented: $isARViewPresented, content: MainARView.init)
    }
}

#if DEBUG
struct PermissionRequestScreen_Previews : PreviewProvider {
    static var previews: some View {
        PermissionRequestScreen()
    }
}
#endif
