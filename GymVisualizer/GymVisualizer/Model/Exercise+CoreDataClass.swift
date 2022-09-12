import Foundation
import CoreData
import UIKit

@objc(Exercise)
public class Exercise: NSManagedObject {
    let exerciseContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
}
