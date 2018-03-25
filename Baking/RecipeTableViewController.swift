//
//  RecipeTableViewController.swift
//  Baking
//
//  Created by Peter Pomlett on 25/03/2018.
//  Copyright © 2018 Peter Pomlett. All rights reserved.
//

import UIKit
import ObjectMapper

class RecipeTableViewController: UITableViewController {
    
    var recipeArray = [Recipe]()

    override func viewDidLoad() {
        super.viewDidLoad()
        getJsonFromUrl()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RecipeCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RecipeCell
        let recipe =  recipeArray[indexPath.row]
        let serves = recipe.servings!
        let servesString = String(describing: serves)
        cell.servesLabel.text = "Serves \(servesString)"
        cell.NameLabel.text = recipe.name
        return cell
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showDetail" {
//            if let indexPath = tableView.indexPathForSelectedRow {
//                let object = recipeArray[indexPath.row]
//                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
//                controller.detailItem = object
//                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
//                controller.navigationItem.leftItemsSupplementBackButton = true
//            }
//        }
//    }

    
    
    let URL_RECIPES = "https://d17h27t6h515a5.cloudfront.net/topher/2017/May/59121517_baking/baking.json"

    func getJsonFromUrl(){
        var recipes: Array<Recipe> = Array()
        let url = NSURL(string: URL_RECIPES)
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSArray {
                print(jsonObj?.object(at: 1) ?? 1)
                recipes = Mapper<Recipe>().mapArray(JSONObject: jsonObj)!
                OperationQueue.main.addOperation({
                    self.recipeArray = recipes
                    self.tableView.reloadData()
                })
            }
        }).resume()
        
    }
    
    
    
    


}
