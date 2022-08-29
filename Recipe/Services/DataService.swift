//
//  DataService.swift
//  Recipe
//
//  Created by Tobiloba on 25/08/2022.
//

import Foundation

class DataService {
    
   static func getLocalData() -> [Recipe] {
        
//        parse local json file
        
//        get a url path to json file
        
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
//         check if pathstring is not nil, otherwise
        guard pathString != nil else {
            return [Recipe]()
        }
        
        //create a url object
        
        let url = URL(fileURLWithPath: pathString!)

        do {
            //create data object
            let data = try Data(contentsOf: url)
            
            //decode the data with json decoder
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                //add the uniques ids
                for r in recipeData {
                    r.id = UUID()
                }
                
                //return recipe data
                return recipeData
            
            }
            catch {
                print()
            }
            }
        catch {
            print (error)
        }
      return [Recipe]()
        
    }
}
