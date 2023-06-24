//
//  ContentView.swift
//  Hello World Vision
//
//  Created by Andrei Ramescu on 24/06/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct Item: Identifiable {
    var id = UUID()
    var title: String
    var modelName: String
    var description: String
}

struct ContentView: View {
    
    let list = [
        Item(
            title: "Sphere",
            modelName: "Untitled Scene 1",
            description: "This is a sphere"
        ),
        Item(
           title: "Pill",
            modelName: "Untitled Scene",
            description: "This is a pill"
        ),
        Item(
            title: "Cone",
            modelName: "Untitled Scene 2",
            description: "This is a cone"
        ),
        Item(
           title: "Cube",
            modelName: "Untitled Scene 3",
            description: "This is a cube"
        ),
        Item(
           title: "Cylinder",
            modelName: "Untitled Scene 4",
            description: "This is a cylinder"
        )
    ]
    @State private var selectedItem: Item?
    
    var body: some View {
        NavigationSplitView {
            List(list) { item in
                Button {
                    selectedItem = item
                } label: {
                    Text(item.title)
                }
            }.navigationTitle("List of items")
        } detail: {
            buildContent
        }
    }
    
    var buildContent: some View {
        VStack {
            Model3D(named: selectedItem?.modelName ?? "Placeholder", bundle: realityKitContentBundle)
                .padding(.bottom, 50)
            
            Text(selectedItem?.description ?? "Here will be diplayed the description").bold()
            
        }
        .navigationTitle(selectedItem?.title ?? "Item")
        .padding()
    }
}

#Preview {
    ContentView()
}
