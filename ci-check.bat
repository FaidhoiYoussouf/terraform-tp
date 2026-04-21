@echo off
echo ========================================
echo CI - Verification du code Terraform
echo ========================================
echo.

echo [1/4] terraform fmt - check formatage...
terraform fmt -check
if errorlevel 1 (
    echo ERREUR: Le formatage n'est pas correct.
    echo Lancez 'terraform fmt' pour corriger.
    exit /b 1
)
echo OK.
echo.

echo [2/4] terraform init - preparation...
terraform init -backend=false > nul
echo OK.
echo.

echo [3/4] terraform validate - verification syntaxe...
terraform validate
if errorlevel 1 (
    echo ERREUR: Syntaxe invalide.
    exit /b 1
)
echo OK.
echo.

echo [4/5] checkov - scan de securite...
checkov -f main.tf --quiet
if errorlevel 1 (
    echo ERREUR: Probleme de securite detecte.
    exit /b 1
)
echo OK.
echo.

echo [5/5] terraform plan - apercu des modifications...
terraform plan
if errorlevel 1 (
    echo ERREUR: Le plan a echoue.
    exit /b 1
)
echo OK.
echo.

echo ========================================
echo CI - TOUS LES CHECKS ONT REUSSI
echo ========================================