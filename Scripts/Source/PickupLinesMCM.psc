Scriptname PickupLinesMCM extends SKI_ConfigBase Hidden 
{Mod configuration menu for PickupLines}

GlobalVariable property PickupLinesEnable Auto

Event OnConfigInit()
    ModName = "$ModName"
    Pages = New String[1]
    Pages[0] = "$Settings"
EndEvent

Event OnPageReset(String page)
    If page == ""
        LoadCustomContent("PickupLines/MCM-Logo.dds") ; Relative to interface/
    Else
        UnloadCustomContent()
    EndIf

    If page == "$Settings"
        AddToggleOptionST("ToogleEnabled", "$Enabled", isModEnabled())
    EndIf
EndEvent

State ToogleEnabled
	Event OnSelectST()
        If IsModEnabled()
            DisableMod()
        Else
            EnableMod()
        EndIf
		SetToggleOptionValueST(isModEnabled())
    EndEvent

	Event OnDefaultST()
		SetToggleOptionValueST(isModEnabled())
    EndEvent

	Event OnHighlightST()
		SetInfoText("$EnablePickupLines")
    EndEvent
EndState

Bool Function IsModEnabled()
    return PickupLinesEnable.GetValueInt() > 0
EndFunction

Function DisableMod()
    PickupLinesEnable.SetValueInt(0)
EndFunction

Function EnableMod()
    PickupLinesEnable.SetValueInt(1)
EndFunction
