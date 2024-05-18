
#George Koufie
# 0108265



Function Out-LogFiles {
	Param(
		[string]$requiredFilesPath = ".\Requirements1"
	)
	
	$logFiles = Get-ChildItem $requiredFilesPath | Where-Object name -like *.log
	" Log file created " + (Get-Date) | Out-File -Append -FilePath .\$PSScriptRoot\DailyLog.txt
	$logFiles | Out-File -Append .\Requirements1\DailyLog.txt
	
}

Function Output-DailyLog {

    Get-Content .\Requirements1\DailyLog.txt
}


Function List-AllFiles {
	Param(
		[string]$requiredFilesPath = ".\Requirements1"
	)
	
	$logFiles = Get-ChildItem $requiredFilesPath1 | Sort-Object Name -descending | Format-Table
	$logFiles | Out-File .\Requirements1\C916contents.txt	
	
}

    Try

{
	while ( $n -ne 5)
	{
		write-host -ForegroundColor DarkCyan '1. List log files within the Requirements1 folder.

2. List the files inside the Requirements1 folder.

3. List the current CPU %, Processor Time, and physical memory usage. 
	
4. Display running processes.
		
5. Exit the script execution.
'
		$n = Read-Host -Prompt '>> Select a Number'
		switch -Exact ($n)
		{
			1 {Out-LogFiles(".\Requirements1")}
			2 {List-AllFiles(".\Requirements1")}
			3 {Get-Counter -SampleInterval 5 -MaxSamples 4}
			4 {Get-Process | Select-Object Name, ID, TotalProcessorTime | Sort-Object TotalProcessorTime -Descending | Format-Table}
			5 {}
		}
	}
}
    Catch [System.OutOfMemoryException] 
{
	Write-Host -ForegroundColor $_.Exception.Message
}