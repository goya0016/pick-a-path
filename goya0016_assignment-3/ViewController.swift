//
//  ViewController.swift
//  goya0016_assignment-3
//
//  Created by Nipun Goyal on 2020-11-17.
//

import UIKit

class ViewController: UIViewController {
   
    //navigation bar connected to the code
    @IBOutlet weak var myNavItem1: UINavigationItem!
    
    //intializing the 8 variables for page and navigation
    var page1:Page? = Page()
    var page2:Page? = Page()
    var page3:Page? = Page()
    var page4:Page? = Page()
    var page5:Page? = Page()
    var page6:Page? = Page()
    var page7:Page? = Page()
    var currentPage:Page? = Page()
    
    //created a variable to store the string from pageChoiceA and pageChoiceB variable
    //because it showed on screen as optional("1")
    
    var pageNumberInt:String?
    
    var buttonaInt:String?
    var buttonbInt:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set the current page variable to page 1
        currentPage = page1
        
       //set the page number for every page to crete chaining
        page1?.pageNumber = 1
        page2?.pageNumber = 2
        page3?.pageNumber = 3
        page4?.pageNumber = 4
        page5?.pageNumber = 5
        page6?.pageNumber = 6
        page7?.pageNumber = 7
        
        //created the page chain to intialize the flow
        page1?.pageChoiceA = page2
        page1?.pageChoiceB = page3
        page2?.pageChoiceA = page4
        page2?.pageChoiceB = page5
        page3?.pageChoiceA = page6
        page3?.pageChoiceB = page7

        // set the text of the all 7 pages
        page1?.pageText = "Your phone buzzes relentlessly with Twitter and Facebook feed updates – zombies are flooding the streets of Ottawa!  You grab your backpack.  Is the first thing you look for: \n (A) a weapon to defend yourself?  \n (B) food and supplies?  Who knows when you'll be able to have another good meal? "

        page2?.pageText = "You rush to the basement and find a baseball bat, a chainsaw, and a paintball gun.  You grab the bat, a few snacks, and consider your options.  Do you:\n (A) board up the house and try wait out the invasion? \n (B) run to the mall?  It kind-of worked in that movie."
        page3?.pageText = "You pack a few sets of clothes, and as much food as your bag can hold.  Looking cautiously outside the window, the streets seem empty.  Do you: \n (A)make a run for the car?  If you make it out of town, you may be able to buy yourself some time. \n (B) call your buddies and set up a rendezvous?  You'll be safer in numbers. "
        page4?.pageText = "You tear apart your furniture and board up all of the windows and doors.  Sitting at the top of the stairs, you wait for the inevitable.  Several hours later the doorbell rings.  You cautiously peer outside, and see your friends waiting at the door.  They laugh hysterically as you rip down the barricade.  “Don't you know what day it is?” one asks you.  April 1st. Ah well - at least you're prepared."
        page5?.pageText = "You grab your bag, lock up the house, and run down the street towards the mall.  Off in the distance, you see some lumbering silhouettes.  As you reach the doors, you notice that a few others seem to have had the same idea.  Once inside, the doors are locked, and you claim one of the big showroom beds and a 60” LED TV as your own.  Who knows how long you'll have to wait?"
        page6?.pageText = "Your bags are packed, and you get the keys to the car.  You're glad you filled up the tank on your way home from work last night.  After making sure the coast is clear, you lock the door and dash to the car.  Your parents are out of the country – thankfully – which means that the boat should be locked up along the river.  You'll be safe there; everyone knows that zombies can't swim... right?"
        page7?.pageText = "You set your Facebook status to “meet up at 45.216867, -75.962180 ”, stopping only briefly to grab a towel, and your toothbrush.  Dashing to the car, you set your GPS to the meeting point.  Several messages come in from your friends: “on the way”, “c u there”, and “brains! lol”. In 20 minutes you'll be out of the city and with your friends... but then what?"
        
        //updating the page number in title and both the buttons
        pageNumberInt = currentPage?.pageNumber?.description
        buttonaInt = currentPage?.pageChoiceA?.pageNumber?.description
        buttonbInt = currentPage?.pageChoiceB?.pageNumber?.description
        
        //setting page title to current page number
        myNavItem1.title = "Page " + pageNumberInt!
        //setting the text view's text to current page's text
        viewAText.text = currentPage?.pageText?.description
        
        myNavItem1.leftBarButtonItem!.title = "Page " + buttonaInt!
        myNavItem1.rightBarButtonItem!.title = "Page " + buttonbInt!
        // Do any additional setup after loading the view.
    }
    //connected the text view to the code
    @IBOutlet weak var viewAText: UITextView!
    
    //added the prepeare for segue function
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //checking the identifier of the segue
        if(segue.identifier == "ShowPageB"){
            //checking the sender of the segue to manipulate data accordingly
        if (sender as! String == "buttonA"){

            //getting a copy of the next view controller
            let destinationController = segue.destination as? SecondPageViewController
            //setting the next page's currentPage variable according to the user's choice and using it later to manipulate data
            destinationController?.currentPage = self.currentPage?.pageChoiceA
            //print(currentPage?.pageChoiceA! as Any)
        }
       else if(sender as! String == "buttonB"){
            
        //getting a copy of the next view controller
            let destinationController = segue.destination as? SecondPageViewController
        //setting the next page's currentPage variable according to the user's choice and using it later to manipulate data
            destinationController?.currentPage = self.currentPage?.pageChoiceB
        }
    }
        
    }
    
    //connected the button as action
    @IBAction func pageButtonA(_ sender: Any) {
        //running the perform segue function with specific sender
        performSegue(withIdentifier: "ShowPageB", sender: "buttonA")
        dismiss(animated: true, completion: nil)
//        self.title = "\(currentPage?.pageChoiceA?.pageNumber)" ?? "Choice A"
        }
    
    //connected the button as action
    @IBAction func pageButtonB(_ sender: Any) {
        //running the perform segue function with specific sender
        performSegue(withIdentifier: "ShowPageB", sender: "buttonB")
        
        dismiss(animated: true, completion: nil)
        
    }
}

