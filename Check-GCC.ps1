$tenantId = Read-Host -Prompt "Tenant ID"
$requestUrl = "https://login.microsoftonline.com/$tenantId/v2.0/.well-known/openid-configuration"

try {
    $response = Invoke-WebRequest -Uri $requestUrl;
}
catch {
    Write-Host -ForegroundColor Red "Error finding tenant: "
    Write-Host -ForegroundColor Red $_.Exception

    Exit
}

$metadata = ConvertFrom-Json $response.content

Write-Host "tenant_region_scope: $($metadata.tenant_region_scope)"
Write-Host "tenant_region_sub_scope: $($metadata.tenant_region_sub_scope)"

if($metadata.tenant_region_sub_scope -like "*GCC*") {
    Write-Host -ForegroundColor Red "Tenant is GCC"
}
else {
    Write-Host -ForegroundColor Green "Tenant is not GCC"
}