Scriptname PickupLinesEffectScript extends ActiveMagicEffect  


Event OnEffectStart(Actor target, Actor caster)
    GotoState("WatchingItemsBeingPickedUp")
EndEvent

Event OnEffectFinish(Actor target, Actor caster)
    GotoState("")
EndEvent

State WatchingItemsBeingPickedUp
    Event OnItemAdded(Form item, Int count, ObjectReference itemRef, ObjectReference container)
        Debug.MessageBox("You Picked  Up " + count + " x " + item.GetName())
    EndEvent
EndState

