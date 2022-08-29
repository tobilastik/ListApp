//
//  ContentView.swift
//  Recipe
//
//  Created by Tobiloba on 25/08/2022.
//

import SwiftUI

struct RecipeListView: View {
    
    //reference the view model
    @ObservedObject var model = RecipeModel()
    
    var body: some View {

        List(model.recipes) { r in
            HStack{
                Image(r.image).resizable().scaledToFill().frame(width: 50, height: 50, alignment: .center).clipped().cornerRadius(5)
                VStack {
                    Text(r.name)
                        .font(.headline)
                        .fontWeight(.black)
                    Text(r.description)
                }
            }
            
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
