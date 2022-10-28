# =============================================================================================================================================================== #
#                                                               MDE-Active Protection Configuration Script                                                        #
# =============================================================================================================================================================== #
#                                               By Eric Mannon (https://github.com/msdirtbag/) (linkedin.com/in/emannon)

#Core Settings
Set-MpPreference -DisableBehaviorMonitoring $False
Set-MpPreference -MAPSReporting Advanced
Set-MpPreference -SubmitSamplesConsent SendAllSamples
Set-MpPreference -DisableIntrusionPreventionSystem $False
Set-MpPreference -DisableRealtimeMonitoring $False
Set-MpPreference -CloudBlockLevel HighPlus
Set-MpPreference -AllowDatagramProcessingOnWinServer 1

#EDR Service
Set-Service diagtrack -startuptype automatic

#Network Protection
Set-MpPreference -EnableNetworkProtection Enabled
Set-MpPreference -AllowNetworkProtectionOnWinServer 1
Set-MpPreference -AllowNetworkProtectionDownLevel 1
Set-MpPreference -DisableTlsParsing $False
Set-MpPreference -AllowSwitchToAsyncInspection $true

#Windows Firewall
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True
Auditpol /set /category:”System” /SubCategory:”Filtering Platform Packet Drop” /success:enable /failure:enable
Auditpol /set /category:”System” /SubCategory:”Filtering Platform Connection” /success:enable /failure:enable

#Advanced Settings
Set-MpPreference -DisableRemovableDriveScanning $False
Set-MpPreference -DisableScriptScanning $False
Set-MpPreference -DisableIOAVProtection $False
Set-MpPreference -DisableBlockAtFirstSeen $False
Set-MpPreference -EnableDnsSinkhole $true 
Set-MpPreference -EnableFileHashComputation $true
Set-MpPreference -RealTimeScanDirection 0
Set-MpPreference -UnknownThreatDefaultAction Quarantine
Set-ItemProperty -Path “HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System” -Name “ConsentPromptBehaviorAdmin” -Value 1 -Force
Set-ItemProperty -Path “HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender” -Name “DisableLocalAdminMerge” -Value 0 -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" -Name "EnableScriptBlockLogging" -Value 1 -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Advanced Threat Protection" -Name "latency" -Value expedite -Force
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -Name "RunAsPPL" -Value 1 -Force

#Signature Update Settings
Set-MpPreference -SignatureScheduleDay Everyday
Set-MpPreference -CheckForSignaturesBeforeRunningScan $True
Set-MpPreference -RandomizeScheduleTaskTime $True

#PUA Detection
Set-MpPreference -PUAProtection AuditMode


#AV Exclusions

#Path
# Set-MpPreference -ExclusionPath "C:\somepath\Archives\Data"

#Extension
# Set-MpPreference -ExclusionExtension ".pdf"

#Process
# Set-MpPreference -ExclusionProcess "c:\internal\test.exe"



# ============================================================================================================================================================= #
#                                                                  Attack Surface Reduction Rules                                                               #
# ============================================================================================================================================================= #

Set-MpPreference -AttackSurfaceReductionRules_Ids 75668C1F-73B5-4CF0-BB93-3ECF5CB7CC84 -AttackSurfaceReductionRules_Actions Enabled
Set-MpPreference -AttackSurfaceReductionRules_Ids 3B576869-A4EC-4529-8536-B80A7769E899 -AttackSurfaceReductionRules_Actions Enabled
Set-MpPreference -AttackSurfaceReductionRules_Ids D4F940AB-401B-4EfC-AADC-AD5F3C50688A -AttackSurfaceReductionRules_Actions Enabled
Set-MpPreference -AttackSurfaceReductionRules_Ids D3E037E1-3EB8-44C8-A917-57927947596D -AttackSurfaceReductionRules_Actions Enabled
Set-MpPreference -AttackSurfaceReductionRules_Ids 5BEB7EFE-FD9A-4556-801D-275E5FFC04CC -AttackSurfaceReductionRules_Actions Enabled
Set-MpPreference -AttackSurfaceReductionRules_Ids BE9BA2D9-53EA-4CDC-84E5-9B1EEEE46550 -AttackSurfaceReductionRules_Actions Enabled
Set-MpPreference -AttackSurfaceReductionRules_Ids 92E97FA1-2EDF-4476-BDD6-9DD0B4DDDC7B -AttackSurfaceReductionRules_Actions Enabled
Set-MpPreference -AttackSurfaceReductionRules_Ids D1E49AAC-8F56-4280-B9BA-993A6D77406C -AttackSurfaceReductionRules_Actions Enabled
Set-MpPreference -AttackSurfaceReductionRules_Ids B2B3F03D-6A65-4F7B-A9C7-1C7EF74A9BA4 -AttackSurfaceReductionRules_Actions Enabled
Set-MpPreference -AttackSurfaceReductionRules_Ids C1DB55AB-C21A-4637-BB3F-A12568109D35 -AttackSurfaceReductionRules_Actions Enabled
Set-MpPreference -AttackSurfaceReductionRules_Ids 01443614-CD74-433A-B99E-2ECDC07BFC25 -AttackSurfaceReductionRules_Actions Enabled
Set-MpPreference -AttackSurfaceReductionRules_Ids 56a863a9-875e-4185-98a7-b882c64b5ce5 -AttackSurfaceReductionRules_Actions Enabled
Set-MpPreference -AttackSurfaceReductionRules_Ids 7674ba52-37eb-4a4f-a9a1-f0f9a1619a2c -AttackSurfaceReductionRules_Actions Enabled
Set-MpPreference -AttackSurfaceReductionRules_Ids 9e6c4e1f-7d60-472f-ba1a-a39ef669e4b2 -AttackSurfaceReductionRules_Actions Enabled
Set-MpPreference -AttackSurfaceReductionRules_Ids 26190899-1602-49e8-8b27-eb1d0a1ce869 -AttackSurfaceReductionRules_Actions Enabled
Set-MpPreference -AttackSurfaceReductionRules_Ids e6db77e5-3df2-4cf1-b95a-636979351e5b -AttackSurfaceReductionRules_Actions Enabled
Set-MpPreference -AttackSurfaceReductionRules_Ids d1e49aac-8f56-4280-b9ba-993a6d77406c -AttackSurfaceReductionRules_Actions AuditMode
Set-MpPreference -AttackSurfaceReductionRules_Ids c1db55ab-c21a-4637-bb3f-a12568109d35 -AttackSurfaceReductionRules_Actions AuditMode


#ASR Exclusions

#  Specifies the files and paths to exclude from Attack Surface Reduction (ASR) rules. 
#  Specify the folders or files and resources that should be excluded from ASR rules. 
#  Enter a folder path or a fully qualified resource name. 
#  For example, ""C:\Windows"" will exclude all files in that directory. 
#  ""C:\Windows\App.exe"" will exclude only that specific file in that specific folder.

# You can only use a maximum of six wildcards per entry
# An asterisk * in a folder exclusion stands in place for a single folder. Use multiple instances of \*\ to indicate multiple nested folders.

#Example

# <Set-MpPreference -AttackSurfaceReductionOnlyExclusions "C:\IIS\Data">


# =========================================================================================================== #
#                                               MDE Device Tag                                                #
# =========================================================================================================== #

$registryPath = "HKLM:SOFTWARE\Policies\Microsoft\Windows Advanced Threat Protection\DeviceTagging"
$Name = "Group"
$value = "MDE-Active"

IF(!(Test-Path $registryPath))
  {
    New-Item -Path $registryPath -Force | Out-Null
    New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType String -Force | Out-Null}
 ELSE {
    New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType string -Force | Out-Null}