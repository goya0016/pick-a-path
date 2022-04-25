//
//  ThirdPageViewController.swift
//  goya0016_assignment-3
//
//  Created by Nipun Goyal on 2020-11-17.
//

import UIKit

class ThirdPageViewController: UIViewController {

    //created a variable to store the string from pageChoiceA and pageChoiceB variable
    //because it showed on screen as optional("1")
    
    var pageNumberInt:String?
    //navigation bar connected to the code
    @IBOutlet weak var myNavItem3: UINavigationItem!
    //connected the text view to the code
    @IBOutlet weak var viewCText: UITextView!
    //created the current page variable to set the data
    var currentPage:Page? = Page()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //updating the page number in title
        pageNumberInt = currentPage?.pageNumber?.description
        myNavItem3.title = "Page " + pageNumberInt!
        //setting the text view's text to current page's text
        viewCText.text = currentPage?.pageText?.description ?? ""
        //myNavItem3.title = "Page 3"
        // Do any additional setup after loading the view.
    }
    //connected the button as action
    @IBAction func restartButton(_ sender: Any) {
        //running the popToRootViewController function to take the app to it's starting point or initial page
        navigationController?.popToRootViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
