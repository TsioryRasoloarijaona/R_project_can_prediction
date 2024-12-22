View(resultat_can_2024)

#calculer le pourcentege de victore
resultat_can_2024$pourcentage_victoire <- (resultat_can_2024$WINS / resultat_can_2024$MATCHES) * 100

#mettre en ordre croissant suivant les points 
resultat_can_2024 <- resultat_can_2024 [order(-resultat_can_2024$POINTS),]

#supprimer la colonne team id 
resultat_can_2024$TeamID <- NULL 

#ajouter un rang a chaque equipe
resultat_can_2024$rang <- seq_along(resultat_can_2024$NAME)

#ajouter le classement fifa pour chaque pays du classement can 2024 
final_resultat_can_2024 <- merge(resultat_can_2024 , classement_fifa , by.x = "NAME" , by.y = "EQUIPE")

#renomer les colonnes 
colnames(final_resultat_can_2024)[colnames(final_resultat_can_2024) == "rang"] <- "rang_can_2024"
colnames(final_resultat_can_2024)[colnames(final_resultat_can_2024) == "RANG"] <- "classement_fifa_afrique"
colnames(final_resultat_can_2024)[colnames(final_resultat_can_2024) == "Classement mondiale"] <- "classement_mondiale"

#mettre en ordre croissant par classement mondial 
final_resultat_can_2024 <- final_resultat_can_2024 [order(final_resultat_can_2024$classement_mondiale , decreasing = FALSE)]



View(final_resultat_can_2024)
