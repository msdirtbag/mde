# =================================================================================================#
#                                 Enable MDE Network Detection on Windows                          #
# =================================================================================================#

Set-MpPreference -EnableNetworkProtection Enabled
Set-MpPreference -AllowNetworkProtectionOnWinServer 1
Set-MpPreference -AllowNetworkProtectionDownLevel 1
Set-MpPreference -AllowDatagramProcessingOnWinServer 1
Auditpol /set /category:”System” /SubCategory:”Filtering Platform Packet Drop” /success:enable /failure:enable
Auditpol /set /category:”System” /SubCategory:”Filtering Platform Connection” /success:enable /failure:enable
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True

exit