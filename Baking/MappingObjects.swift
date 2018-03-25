//
//  MappingObjects.swift
//  Baking
//
//  Created by Peter Pomlett on 25/03/2018.
//  Copyright © 2018 Peter Pomlett. All rights reserved.
//
import ObjectMapper
import Foundation



class Recipes: Mappable {
    
  //  var JSON: [Recipe]?
    var JSON: Array<Recipe>?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        JSON <- map["JSON"]
        
    }
}








//RECIPE CLASS
class Recipe: Mappable {
    var id: Int?
    var servings: Int?
    var name: String?
    var image: String?
    var ingredients: Array<Ingredient>?
    var steps: Array<Step>?
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        id          <- map["id"]
        servings    <- map["servings"]
        name        <- map["name"]
        image       <- map["image"]
        ingredients <- map["ingredients"]
        steps       <- map["steps"]
    }
}

//INGREDIENT CLASS
class Ingredient: Mappable {
    var quantity: Float?
    var measure: String?
    var ingredient: String?
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        quantity   <- map["quantity"]
        measure    <- map["measure"]
        ingredient <- map["ingredient"]
    }
}

//STEP CLASS
class Step: Mappable {
    var id: Int?
    var shortDescription: String?
    var description: String?
    var videoURL: String?
    var thumbnailURL: String?
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        id          <- map["id"]
        shortDescription    <- map["shortDescription"]
        description        <- map["description"]
        videoURL       <- map["videoURL"]
        thumbnailURL <- map["thumbnailURL"]
    }
}
