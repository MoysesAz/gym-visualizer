import Foundation
import CoreData


extension Exercise {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Exercise> {
        return NSFetchRequest<Exercise>(entityName: "Exercise")
    }

    @NSManaged public var descriptions: String?
    @NSManaged public var name: String?
    @NSManaged public var reps: Int16
    @NSManaged public var sets: Int16
    @NSManaged public var routine: NSSet?

}

// MARK: Generated accessors for routine
extension Exercise {

    @objc(addRoutineObject:)
    @NSManaged public func addToRoutine(_ value: Routine)

    @objc(removeRoutineObject:)
    @NSManaged public func removeFromRoutine(_ value: Routine)

    @objc(addRoutine:)
    @NSManaged public func addToRoutine(_ values: NSSet)

    @objc(removeRoutine:)
    @NSManaged public func removeFromRoutine(_ values: NSSet)

}

extension Exercise : Identifiable {
    func getExercises() {
        do {
            let _ = try exerciseContext.fetch(Exercise.fetchRequest())
        } catch {
            print(error)
        }
    }

    func createExercise(_ exercise: Exercise) {
        let _ = Exercise(context: exerciseContext)
        _ = exercise

        do {
            try exerciseContext.save()
        } catch {
            print(error)
        }
    }

    func deleteExercise(_ exercise: Exercise) {
        exerciseContext.delete(exercise)
        do {
            try exerciseContext.save()
        } catch {
            print(error)
        }
    }

    func updateExercise(_ exercise: Exercise, _ newExercise: Exercise) {
        exercise.name = newExercise.name
        exercise.descriptions = newExercise.descriptions
        exercise.reps = newExercise.reps
        exercise.sets = newExercise.sets
        // talvez tenha um catch pra inverso de routine...
        do {
            try exerciseContext.save()
        } catch {
            print(error)
        }
    }
}
