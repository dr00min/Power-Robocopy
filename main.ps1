########################################################
######## Only change the next 3 variables ##############
########################################################
$foldername		=	'Applications'
$svrname		=	'File-Server-01'
$targetname		=	'Backup-Server-01'

############ STATIC VARIABLES ##########################

$targetpath 	= 	'c:\Robocopy\' + $svrname + '-to-'+ $targetname +'-'+  $foldername + '.bat'
$rsltpath 		= 	Get-Content -raw -Path \\Result-Server-01\d$\IT\Robocopy\Robocopy-Reporting\robovar1.txt
$fullname		=	$svrname + '-to-'+ $targetname +'-'+  $foldername
$dateformat		=	'dd/MM/yyyy_HH:mm'
$passtext		=	'Robocopy succeeded with exit code:' 
$failtext		=	'Robocopy failed with exit code:'
$csvpath		=	Get-Content -raw -Path \\Result-Server-01\d$\IT\Robocopy\Robocopy-Reporting\robovar2.txt
$info			=	"" | Select Robotask,Timestamp,Result
$info.Robotask	= 	$svrname + $targetname + $foldername
$info.Timestamp	= 	$(Get-Date -Format $dateformat)

##################### BEGIN BACKUP ######################

#run batch file
start-process $targetpath

############## POST-BACKUP TASKS ########################

#checks exit/return code and decides if SUCCESS or FAILURE
if ($lastexitcode -le 3)
	{
		#add a SUCCESS line to the results log
			Add-Content -path $rsltpath   -Value "$fullname		-  $(Get-Date -Format $dateformat)  -  Robocopy succeeded with exit code: $lastexitcode"
		#add a SUCCESS line to results csv
			$info.Result = $passtext + $lastexitcode
			$info | Export-CSV -Append -NoTypeInformation -Path $csvpath
	}
 
	else

	{
		#add a FAILURE line to the results log
			Add-Content -path $rsltpath   -Value  "$fullname		-  $(Get-Date -Format $dateformat)  -  Robocopy failed with exit code: $lastexitcode"
		#add a FAILURE line to results csv
			$info.Result = $failtext + $lastexitcode
			$info | Export-CSV -Append -NoTypeInformation -Path $csvpath
	}

################ END OF ALL #############################
