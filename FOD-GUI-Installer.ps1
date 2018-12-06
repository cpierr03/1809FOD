if ($MyInvocation.MyCommand.CommandType -eq "ExternalScript")
{ $ScriptPath = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition }
else
{ $ScriptPath = Split-Path -Parent -Path ([Environment]::GetCommandLineArgs()[0]) 
    if (!$ScriptPath){ $ScriptPath = "." } }
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()
$FeaturesHash = [ordered]@{
'Accessibility - Braille Support'='Accessibility.Braille~~~~0.0.1.0'
'Windows Mixed Reality'='Analog.Holographic.Desktop~~~~0.0.1.0'
'Microsoft Quick Assist'='App.Support.QuickAssist~~~~0.0.1.0'
'Internet Explorer 11'='Browser.InternetExplorer~~~~0.0.11.0'
'Hello Face'='Hello.Face.17658~~~~0.0.1.0'
'Hello Face Migration'='Hello.Face.Migration.17658~~~~0.0.1.0'
'Math Recognizer'='MathRecognizer~~~~0.0.1.0'
'Windows Media Player'='Media.WindowsMediaPlayer~~~~0.0.12.0'
'Windows OneCore Storage Management'='Microsoft.Onecore.StorageManagement~~~~0.0.1.0'
'Windows Storage Management'='Microsoft.Windows.StorageManagement~~~~0.0.1.0'
'MSIX Packaging Tool Driver'='Msix.PackagingTool.Driver~~~~0.0.1.0'
'Microsoft WebDriver'='Microsoft.WebDriver~~~~0.0.1.0'
'.NET Framework 3.0/3.5'='NetFX3~~~~'
'OneSync'='OneCoreUAP.OneSync~~~~0.0.1.0'
'OpenSSH Client'='OpenSSH.Client~~~~0.0.1.0'
'OpenSSH Server'='OpenSSH.Server~~~~0.0.1.0'
'RAS Connection Manager Administration Kit (CMAK)'='RasCMAK.Client~~~~0.0.1.0'
'RIP Listener'='RIP.Listener~~~~0.0.1.0'
'RSAT Active Directory Domain Services and Lightweight Directory Services Tools'='Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0'
'RSAT BitLocker Drive Encryption Administration Utilities'='Rsat.BitLocker.Recovery.Tools~~~~0.0.1.0'
'RSAT Active Directory Certificate Services Tools'='Rsat.CertificateServices.Tools~~~~0.0.1.0'
'RSAT DHCP Server Tools'='Rsat.DHCP.Tools~~~~0.0.1.0'
'RSAT DNS Server Tools'='Rsat.Dns.Tools~~~~0.0.1.0'
'RSAT Failover Clustering Tools'='Rsat.FailoverCluster.Management.Tools~~~~0.0.1.0'
'RSAT File Services Tools'='Rsat.FileServices.Tools~~~~0.0.1.0'
'RSAT Group Policy Management Tools'='Rsat.GroupPolicy.Management.Tools~~~~0.0.1.0'
'RSAT IP Address Management (IPAM) Client'='Rsat.IPAM.Client.Tools~~~~0.0.1.0'
'RSAT Data Center Bridging LLDP Tools'='Rsat.LLDP.Tools~~~~0.0.1.0'
'RSAT Network Controller Management Tools'='Rsat.NetworkController.Tools~~~~0.0.1.0'
'RSAT Network Load Balancing Tools'='Rsat.NetworkLoadBalancing.Tools~~~~0.0.1.0'
'RSAT Remote Access Management Tools'='Rsat.RemoteAccess.Management.Tools~~~~0.0.1.0'
'RSAT Remote Desktop Services Tools'='Rsat.RemoteDesktop.Services.Tools~~~~0.0.1.0'
'RSAT Server Manager'='Rsat.ServerManager.Tools~~~~0.0.1.0'
'RSAT Shielded VM Tools'='Rsat.Shielded.VM.Tools~~~~0.0.1.0'
'RSAT Storage Migration Service Management Tools'='Rsat.StorageMigrationService.Management.Tools~~~~0.0.1.0'
'RSAT Storage Replica Module for Windows PowerShell'='Rsat.StorageReplica.Tools~~~~0.0.1.0'
'RSAT Systems Insights Module for Windows PowerShell'='Rsat.SystemInsights.Management.Tools~~~~0.0.1.0'
'RSAT Volume Activation Tools'='Rsat.VolumeActivation.Tools~~~~0.0.1.0'
'RSAT Windows Server Update Services Tools'='Rsat.WSUS.Tools~~~~0.0.1.0'
'Simple Network Management Protocol (SNMP)'='SNMP.Client~~~~0.0.1.0'
'Windows Developer Mode'='Tools.DeveloperMode.Core~~~~0.0.1.0'
'DTrace Platform'='Tools.DTrace.Platform~~~~0.0.1.0'
'DirectX Graphics Tools'='Tools.Graphics.DirectX~~~~0.0.1.0'
'SNMP WMI Provider'='WMI-SNMP-Provider.Client~~~~0.0.1.0'
'XPS Viewer'='XPS.Viewer~~~~0.0.1.0'
}
#region begin GUI{ 

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = '600,700'
$Form.text                       = "Windows Features on Demand Installer 1809"
$Form.TopMost                    = $false

$ListBox1                        = New-Object system.Windows.Forms.ListBox
$ListBox1.text                   = "listBox"
$ListBox1.width                  = 400
$ListBox1.height                 = 600
$ListBox1.location               = New-Object System.Drawing.Point(100,50)
$ListBox1.Items.AddRange($FeaturesHash.Keys)
$ListBox1.SelectionMode = 'MultiExtended'

$Button2                         = New-Object system.Windows.Forms.Button
$Button2.text                    = "Remove Selected"
$Button2.width                   = 147
$Button2.height                  = 30
$Button2.location                = New-Object System.Drawing.Point(300,650)
$Button2.Font                    = 'Microsoft Sans Serif,10'

$Button3                         = New-Object system.Windows.Forms.Button
$Button3.text                    = "Add Selected"
$Button3.width                   = 147
$Button3.height                  = 30
$Button3.location                = New-Object System.Drawing.Point(136,650)
$Button3.Font                    = 'Microsoft Sans Serif,10'

$Label1                          = New-Object system.Windows.Forms.Label
$Label1.text                     = "Select features to add or remove:"
$Label1.AutoSize                 = $true
$Label1.width                    = 25
$Label1.height                   = 10
$Label1.location                 = New-Object System.Drawing.Point(200,30)
$Label1.Font                     = 'Microsoft Sans Serif,10'

$Label2                          = New-Object system.Windows.Forms.Label
$Label2.text                     = "Provided by /r/sysadmin"
$Label2.AutoSize                 = $true
$Label2.width                    = 25
$Label2.height                   = 10
$Label2.location                 = New-Object System.Drawing.Point(170,0)
$Label2.Font                     = 'Microsoft Sans Serif,10'

$Form.controls.AddRange(@($ListBox1,$Button2,$Button3,$Label1,$Label2))

#region gui events {
$Button2.Add_Click({ RemoveFeature })
$Button3.Add_Click({ AddFeature})
#endregion events }

#endregion GUI }

#Here comes the code....

$dir=$ScriptPath
function AddFeature{
foreach ($Feature in $ListBox1.SelectedItems) {
Add-WindowsCapability -Name $FeaturesHash[$Feature] -Online -LimitAccess -Source $dir\sources
}
}
function RemoveFeature{
$dir=$ScriptPath
foreach ($Feature in $ListBox1.SelectedItems) {
Remove-WindowsCapability -Name $FeaturesHash[$Feature] -Online 
}
}

[void]$Form.ShowDialog()
