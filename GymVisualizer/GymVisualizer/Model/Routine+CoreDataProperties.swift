import Foundation
import CoreData


extension Routine {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Routine> {
        return NSFetchRequest<Routine>(entityName: "Routine")
    }

    @NSManaged public var date: Date?
    @NSManaged public var exercices: [Exercise]?
    @NSManaged public var week: NSSet?

}

// MARK: Generated accessors for week
extension Routine {

    @objc(addWeekObject:)
    @NSManaged public func addToWeek(_ value: Week)

    @objc(removeWeekObject:)
    @NSManaged public func removeFromWeek(_ value: Week)

    @objc(addWeek:)
    @NSManaged public func addToWeek(_ values: NSSet)

    @objc(removeWeek:)
    @NSManaged public func removeFromWeek(_ values: NSSet)

}

extension Routine : Identifiable {
    func getRoutines() {
        do {
            let _ = try routineContext.fetch(Routine.fetchRequest())
        } catch {
            print(error)
        }
    }

    func createRoutine(_ routine: Routine) {
        let _ = Routine(context: routineContext)
        _ = routine

        do {
            try routineContext.save()
        } catch {
            print(error)
        }
    }

    func deleteRoutine(_ routine: Routine) {
        routineContext.delete(routine)
        do {
            try routineContext.save()
        } catch {
            print(error)
        }
    }

    func updateRoutine(_ routine: Routine, _ newRoutine: Routine) {
        routine.exercices = newRoutine.exercices
        routine.date = newRoutine.date
        // talvez tenha um catch pra inverso de week...
        do {
            try routineContext.save()
        } catch {
            print(error)
        }
    }
}
