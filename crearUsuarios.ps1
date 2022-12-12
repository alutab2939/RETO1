$fichero_csv=Read-Host "Introduce el fichero csv de los usuarios:"
                $fichero_csv_importado = import-csv -Path $fichero_csv -Delimiter : 			     
                foreach($line in $fichero_csv_importado)
{
  	          $passAccount=ConvertTo-SecureString $line.NIF -AsPlainText -force
	            $name=$line.Nombre
	            $nameShort=$line.Nombre
	            $Surnames=$line.Apellido1
	            $nameLarge=$line.Nombre+'.'+$line.Apellido1+'.'+$line.Apellido2
	            $email=$line.email
	  
	            if (Get-ADUser -filter { name -eq $nameShort })
                {
                        $nameShort=$line.Apellido1
                }
	
	            [boolean]$Habilitado=$true
  	            If($line.Hability -Match 'false') {$Habilitado=$false}
  	            $ExpirationAccount = $line.DaysAccountExpire
 	            $timeExp = (get-date).AddDays($ExpirationAccount)
	
	            New-ADUser `
    		        -SamAccountName $nameShort `
   	 	            -UserPrincipalName $nameShort `
    		        -Name $nameShort `
		            -Surname $Surnames `
    		        -DisplayName $nameShort `
    		        -GivenName $line.Name `
		            -Description "Cuenta de $nameLarge" `
    		        -EmailAddress $email `
		            -AccountPassword $passAccount `
    		        -Enabled $Habilitado `
		            -CannotChangePassword $false `
    		        -ChangePasswordAtLogon $true `
		            -PasswordNotRequired $false `
    		        -AccountExpirationDate $timeExp
}
