# Script de nettoyage des images - XXL Fourniture
# Supprime les fichiers non importants pour optimiser l'hebergement

Write-Host "Nettoyage des images non importantes..." -ForegroundColor Green

# Liste des fichiers a supprimer
$filesToDelete = @(
    # Fichiers temporaires
    "f4b25b05-638a-4181-802f-4748da150cab.tmp",
    
    # Images generiques "download"
    "download.jpg",
    "download (1).jpg",
    "download (2).jpg", 
    "download (3).jpg",
    "download (4).jpg",
    "download.jpeg",
    "download (1).jpeg",
    "download (2).jpeg",
    "download (18).jpeg",
    "download (19).jpeg",
    
    # Images promotionnelles et publicitaires
    "https___www_amazon.com_dp_B07VFGQ7BC_raf=noim_tag=koficomshopid-20",
    "Holiday Gaming Wonderland_ Christmas 2024.jpg",
    "5 Best Silent Gaming Mouse In 2025_ Buyer's Guide Included.jpg",
    "tests et avis sur la High Tech - crazy-geek_fr.jpg",
    
    # Images redondantes ou de faible qualite
    "Pink LED, white keycaps ^__^.jpg",
    "Mine h.jpg",
    "1dbc3e756e581580590525dacecf25ee.jpg",
    
    # Images de marques specifiques non utilisees
    "Batman Mouse.jpg",
    "Black Panther's Mouse.jpg",
    "_Elite Precision_ Ultra Custom Wireless Mouse_.jpg"
)

$deletedCount = 0
$totalSize = 0

foreach ($file in $filesToDelete) {
    $filePath = "image\$file"
    if (Test-Path $filePath) {
        $fileSize = (Get-Item $filePath).Length
        $totalSize += $fileSize
        Remove-Item $filePath -Force
        Write-Host "Supprime: $file ($([math]::Round($fileSize/1KB, 1)) KB)" -ForegroundColor Red
        $deletedCount++
    } else {
        Write-Host "Fichier non trouve: $file" -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host "Resume du nettoyage:" -ForegroundColor Cyan
Write-Host "   Fichiers supprimes: $deletedCount" -ForegroundColor White
Write-Host "   Espace libere: $([math]::Round($totalSize/1MB, 2)) MB" -ForegroundColor White
Write-Host "   Fichiers traites: $($filesToDelete.Count)" -ForegroundColor White

Write-Host ""
Write-Host "Nettoyage termine!" -ForegroundColor Green
Write-Host "Votre site est maintenant optimise pour l'hebergement." -ForegroundColor Green 