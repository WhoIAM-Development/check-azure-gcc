# Azure GCC Checker

Checks if an Azure tenant is Government Cloud (GCC) to help assist with solution architecture

## Requirements

Works on Powershell Core and PowerShell 5

## Usage

1. Run `./Check-GCC.ps1`
1. The script will prompt for a tenant ID.  You can use either the GUID or the domain itself (e.g. `yourtenant.onmicrosoft.com`)
1. If a tenant is found, the script will output the GCC status, along with the OpenID endpoint for additional information.