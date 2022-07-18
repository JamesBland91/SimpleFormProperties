Function Edit-Form {
    <#
.SYNOPSIS
    Edits the appearence of the form passed to the FormName variable.  
.DESCRIPTION
    Changes some of the appearence properties of the form object
    Including, Width, Height, Autosize and BackColor. 
    Allows the entry of this information into a single line. 
.NOTES
    The form object must be created before the 
    $main_form = New-Object System.Windows.Forms.Form
    Requires: 
    Add-Type -AssemblyName PresentationFramework
    Add-Type -assembly System.Windows.Forms
.LINK
    NA
.EXAMPLE
    $main_form = New-Object System.Windows.Forms.Form
    Edit-GUIForm -FormName $main_form -W 1000 -h 1000 -Autosize $true -BackColor "green"
    $Main_form.ShowDialog()
#>
    [CmdletBinding()]
    param (
        #Form variable name (with $)
        [Parameter(Mandatory = $true)]
        [System.Windows.Forms.ContainerControl] 
        $FormName,

        #Title of form
        [Parameter()]
        [String] 
        $Text = 'Powershell Form',

        # Width of Form
        [Parameter()]
        [Int32]
        $W = 600,

        # Height of Form
        [Parameter()]
        [Int32]
        $H = 400,

        # Autosize true or false
        [Parameter()]
        [bool]
        $Autosize = $true,

        # Set Color of background
        [Parameter()]
        [string]
        $BackColor = "White"
    
    )
    
    $FormName.Text = $Text
    $FormName.width = $W
    $FormName.Height = $H
    $FormName.AutoSize = $Autosize
    $FormName.BackColor = $BackColor
    


}

function Edit-FormOBj {
    <#
.SYNOPSIS
    Edits the properties of a GUI Windows Form object and adds it to the selected form. 
.DESCRIPTION
    Changes some of the appearence properties of the form object
    Including, Width, Height, Autosize and BackColor. 
    Allows the entry of this information into a single line. 
.NOTES

TODELETE: 
I can put all the paramters in an just only have them apply if the variable is of the type. E.g System.Windows.Forms.Form


.LINK
    Specify a URI to a help page, this will show when Get-Help -Online is used.
.EXAMPLE
    Test-MyTestFunction -Verbose
    Explanation of the function or its result. You can include multiple examples with additional .EXAMPLE lines
#>
    [CmdletBinding()]
    param (
        #Object Variable name (with $)
        [Parameter(Mandatory = $true)]
        [Object] 
        $ObjectName,

        #Form variable name to add the object (with $)
        [Parameter(
            Mandatory = $true 
        )]
        [System.Windows.Forms.ContainerControl] 
        $FormName,


        #common parameters 

            
        #Object Text
        [Parameter()]
        [String] 
        $Text,

        # Location X value
        [Parameter()]
        [Int32]
        $LocX,

        # Location Y value
        [Parameter()]
        [Int32]
        $LocY,

        # SizeX value
        [Parameter()]
        [Int32]
        $SizeX,

        # SizeY value
        [Parameter()]
        [Int32]
        $SizeY,

        # Background Colour
        [Parameter()]
        [string]
        $BackColor,
        
        # Foreground Colour
        [Parameter()]
        [string]
        $ForeColor,

        #IsEnabled? 
        [Parameter()]
        [bool]
        $Enabled = $true,

        #TEXTBOX ONLY PARAMETERS

        #Makes textbox multi line
        [Parameter()]
        [bool]
        $Multiline,
        #Makes Textbox read only
        [Parameter()]
        [bool]
        $Readonly,
        
        #TEXTBOX OR COMBOBOX
        [Parameter()]
        [String]
        $AutoCompleteMode = "None",

        [Parameter()]
        [string]
        $AutoCompleteSource = "None",

        #CHECKBOX ONLY PARAMETERS
        # Autocheck
        [Parameter()]
        [bool]
        $Checked,

        #TEXTBOX,CHECKBOX,BUTTON and LABEL 
        #TEXTALIGN E.g topleft, bottomright etc. 
        [Parameter()]
        [String]
        $TextAlign = "TopLeft"

                
    )
    

   

    #common Properties
    $ObjectName.Location = New-Object System.Drawing.Size($LocX, $LocY)
    $ObjectName.Size = New-Object System.Drawing.Size($SizeX, $SizeY)
    $ObjectName.Text = $Text
    $ObjectName.BackColor = $BackColor
    $ObjectName.ForeColor = $ForeColor
    $ObjectName.Enabled = $Enabled

    
    if ($ObjectName.gettype().name -eq "TextBox") {
        $ObjectName.Multiline = $Multiline 
        $ObjectName.ReadOnly = $Readonly 
    }
    #Button Properties
    if ($ObjectName.gettype().name -eq "Button") {
        
    }
    #CheckBox Properties
    if ($ObjectName.gettype().name -eq "Checkbox" -or $ObjectName.gettype().name -eq "radiobutton") {
        $ObjectName.Checked = $Checked  
    }
    #Textbox OR Combobox
    if ($ObjectName.gettype().name -eq "Textbox" -or $ObjectName.gettype().name -eq "Combobox" ) {
        $ObjectName.AutoCompleteMode = $AutoCompleteMode
        $ObjectName.AutoCompleteSource = $AutoCompleteSource
    }
    
    if ($ObjectName.gettype().name -eq "Label") {
        $ObjectName.TextAlign = $TextAlign
    }
    
    $FormName.Controls.Add($ObjectName)
    #Textbox OR Checkbox OR Button OR Label
  

}



