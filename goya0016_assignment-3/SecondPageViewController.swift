//
//  SecondPageViewController.swift
//  goya0016_assignment-3
//
//  Created by Nipun Goyal on 2020-11-17.
//

import UIKit

class SecondPageViewController: UIViewController {
    
   
   //created the current page variable to set the data
    var currentPage:Page? = Page()
    
    //created a variable to store the string from pageChoiceA and pageChoiceB variable
    //because it showed on screen as optional("1")
    var pageNumberInt:String?
    var buttonaInt:String?
    var buttonbInt:String?
    
    //connected text view to the code as outlet
    @IBOutlet weak var viewBText: UITextView!
    
    //navigation bar connected to the code
    @IBOutlet weak var myNavItem2: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //updating the page number in title and both the buttons
        pageNumberInt = currentPage?.pageNumber?.description
        buttonaInt = currentPage?.pageChoiceA?.pageNumber?.description
        buttonbInt = currentPage?.pageChoiceB?.pageNumber?.description
        
        
        //setting page title to current page number
        myNavItem2.title = "Page " + pageNumberInt!
        //setting the text view's text to current page's text
        viewBText.text = currentPage?.pageText?.description
        
        myNavItem2.leftBarButtonItem!.title = "Page " + buttonaInt!
        myNavItem2.rightBarButtonItem!.title = "Page " + buttonbInt!
        print("apppa")
        // Do any additional setup after loading the view.
    }
    
    //added the prepeare for segue function
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //checking the identifier of the segue
        if(segue.identifier == "ShowPageC"){
            print("appa")
            //checking the sender of the segue to manipulate data accordingly
        if (sender as! String == "buttonA"){
            //getting a copy of the next view controller
            let destinationController = segue.destination as? ThirdPageViewController
            //setting the next page's currentPage variable according to the user's choice and using it later to manipulate data
            destinationController?.currentPage = self.currentPage?.pageChoiceA
            print("aa")
        }
            //checking the sender of the segue to manipulate data accordingly
        else if(sender as! String == "buttonB"){
            //getting a copy of the next view controller
            let destinationController = segue.destination as? ThirdPageViewController
            //setting the next page's currentPage variable according to the user's choice and using it later to manipulate data
            destinationController?.currentPage = self.currentPage?.pageChoiceB
            //print(currentPage?.pageChoiceB)
            print("ab")
        }
    }
        
    }
    //connected the button as action
    @IBAction func page2ChoiceA(_ sender: Any) {
        //running the perform segue function with specific sender
        performSegue(withIdentifier: "ShowPageC", sender: "buttonA")
       dismiss(animated: true, completion: nil)
        print("apppva")
    }
    //connected the button as action
    @IBAction func page2ChoiceB(_ sender: Any) {
        //running the perform segue function with specific sender
        performSegue(withIdentifier: "ShowPageC", sender: "buttonB")
        dismiss(animated: true, completion: nil)
        print("apppb")
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
