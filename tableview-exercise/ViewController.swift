//
//  ViewController.swift
//  tableview-exercise
//
//  Created by Adam Goth on 6/30/16.
//  Copyright © 2016 Adam Goth. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var uglyThings = ["https://s-media-cache-ak0.pinimg.com/736x/f1/9a/51/f19a5199180cc1f5c82bb5367fca65b8.jpg","http://cdn0.lostateminor.com/wp-content/uploads/2009/02/richard-stipl-2.jpg","http://cdn1.thecomeback.com/crossoverchronicles/wp-content/uploads/sites/18/2011/10/ugly_dog.jpg","http://www.b3ta.com/images/challenge/makecuteugly_large.jpg","http://www.pxleyes.com/images/contests/ugly-nature-2/fullsize/Ugly-me--4d8f04151412b.jpg"]
    var uglyTitles = ["Man, this is ugly!", "Meh", "Woah!","Wouldn't go near this","No thank you"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("UglyCell") as? UglyCell {
            
            var img: UIImage!
            
            
            let url = NSURL(string: uglyThings[indexPath.row])!
            if let data = NSData.init(contentsOfURL: url) {
                img = UIImage(data: data)
            } else {
                img = UIImage(named: "dog")
            }
            
            cell.configureCell(img, text: uglyTitles[indexPath.row])
            
            return cell
        } else {
            return UglyCell()
        }

    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return uglyThings.count
    }

}

