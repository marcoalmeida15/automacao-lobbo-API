*** Settings ***
Resource            ../Resources/MedicamentforPet.resource

*** Test Cases ***
Cenário 01 - Create Medicament 
    Criando medicamento

Cenário 02 - Get Medicament
    Buscando medicameto

Cenário 03 - Put Medicament
    Atualizando medicamento

Cenário 04 - Delete Medicament
    Deletando medicamento