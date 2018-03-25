//
//  RecipeCell.swift
//  Baking
//
//  Created by Peter Pomlett on 25/03/2018.
//  Copyright © 2018 Peter Pomlett. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {

    @IBOutlet weak var NameLabel: UILabel!
    
    
    @IBOutlet weak var servesLabel: UILabel!
    
    
    @IBOutlet weak var RecipeImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
