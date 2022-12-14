$TP = Get-MpComputerStatus
$RTP = Get-MpComputerStatus
$EDR = Get-MpComputerStatus

$hash = @{ TamperProtection = $TP.IsTamperProtected; RealtimeProtection = $RTP.RealTimeProtectionEnabled; EDRinBlockMode = $EDR.AMRunningMode}

return $hash | ConvertTo-Json -Compress