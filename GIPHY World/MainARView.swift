//
//  MainARView.swift
//  GIPHY World
//
//  Created by Mikhail Borisov on 24/11/22.
//

import SwiftUI
import RealityKit

struct MainARView : View {
    var body: some View {
        ZStack {
            ARViewContainer().edgesIgnoringSafeArea(.all)
            
            VStack {
                closeButton
                
                Spacer()
                
                VStack(spacing: 32) {
                    HStack(alignment: .center, spacing: 54) {
                        deleteButton
                        addButton
                        screenShotButton
                    }
                    
                    HStack(alignment: .center) {
                        tutorialStep
                    }
                }
                .padding(.bottom, 12)
            }
        }
    }
    
    var closeButton: some View {
        HStack{
            Button {
                
            } label: {
                Image(systemName: "xmark")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
            }
            .frame(width: 60, height: 45)
            .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 15))
            
            Spacer()
        }
        .padding(.horizontal, 24)
        .padding(.top, 24)
    }
    
    var addButton: some View {
        Button {
            
        } label: {
            Image(systemName: "plus")
                .font(.system(size: 34, weight: .regular))
                .foregroundColor(.black)
        }
        .frame(width: 72, height: 72)
        .background(.white)
        .clipShape(Circle())
    }
    
    var deleteButton: some View {
        Button {
            
        } label: {
            Image(systemName: "trash")
                .font(.system(size: 20, weight: .regular))
                .foregroundColor(.white)
        }
        .frame(width: 52, height: 52)
        .background(.regularMaterial)
        .clipShape(Circle())
    }
    
    var screenShotButton: some View {
        HStack {
            Button {
                
            } label: {
                Circle()
                    .foregroundColor(.white)
                    .frame(width: 40, height: 40)
                    .padding(4)
                    .overlay(
                        Circle()
                            .stroke(.white, lineWidth: 3)
                    )
            }
        }
    }
    
    var tutorialStep: some View {
        Text("1 of 5")
            .font(.montserratSemiBold(size: 20))
            .foregroundColor(.white)
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
            .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 15))
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        MainARView()
    }
}
#endif
