import UIKit

/*
 Overview
 
 ColorPickerViewController has one job: to let you select a color. It doesn't how/when to get on the screen, when/how to get off the screen, or what to do with a color you've selected. The ONLY responsibility it has is allowing you to select a color.
 
 But how is it going to communicate that color to the rest of the application? It's going to delegate that responsibility out to it's delegate!
*/

// MARK: - ColorPickerViewControllerDelegate

/*
 Define a Protocol which describes the properties and/or functions an object must have in order to serve as ColorPickerViewController's delegate. In this case just a single function which let's the delegate know which color was selected.
 
 Don't worry about the `AnyObject` requirement right now unless you're already familiar with "reference counting", "memory management", and "strong retain cycles". Just know for now that delegate properties like the one below on `ColorPickerViewController` almost always need to be `weak` so as to avoid "retain cycles".
 */
protocol ColorPickerViewControllerDelegate: AnyObject {
    func didPickColor(color: UIColor?)
}

// MARK: - ColorPickerViewController

class ColorPickerViewController: UIViewController  {
    
    // MARK: - Outlets
    
    @IBOutlet var blueContainer: UIView!
    @IBOutlet var greenContainer: UIView!
    @IBOutlet var orangeContainer: UIView!
    
    // MARK: - Stored Properties
   
    // Here is that `weak` delegate property mentioned above. It needs to be declared as `weak` and `Optional` because we won't know who the delegate is on initialization. Some other object may or may not be assigned to this property at a later time. This is what's happening when you set `self.tableView.delegate = self` from inside a UIViewController subclass; the UITableView has a property just like this.
    weak var delegate: ColorPickerViewControllerDelegate?
    
    // MARK: - Actions
    
    @IBAction func blueTapped(_ sender: Any) {
        // When the user selected a color, ColorPickerViewController tells it's delegate via the function defined in the protocol above. This is where ColorPickerViewController's responsibilities end. It's done it's job.
        delegate?.didPickColor(color: blueContainer.backgroundColor)
    }
    
    @IBAction func greenTapped(_ sender: Any) {
        // See above comment.
        delegate?.didPickColor(color: greenContainer.backgroundColor)
    }
    
    @IBAction func orangeTapped(_ sender: Any) {
        // See above comment.
        delegate?.didPickColor(color: orangeContainer.backgroundColor)
    }
}
