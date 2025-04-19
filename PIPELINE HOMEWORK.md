# PIPELINE HOMEWORK 

**NOM / PRÉNOM :** Guessoum Mohamed Nizar.  
**Groupe :** 05.

----

**Objectifs :**
> - Comparer une exécution séquentielle et parallèle d’un programme.  
> - Découvrir les problèmes de l’architecture pipeline.  
> - Intégrer et étudier des solutions pour résoudre le problème des aléas dans l’architecture pipeline.  
> Outil : simulateur CPU-OS.

**Remarque :**  
> SF (Speed Factor) dans les statistiques représente l’accélération.

### QUESTIONS :
1. Ouvrir le simulateur CPU-OS, dans la partie COMPILER → PROGRAM SOURCE (INPUT), copier puis compiler le programme suivant :
```
program Pipeone  
for n = 0 to 10  
  p = p + 1  
next  
end
```
2. Sauvegarder et charger le programme dans la mémoire en activant "LOAD IN MEMORY".

3. Cliquer sur "SHOW PIPELINE" pour ouvrir la fenêtre du pipeline. Cliquer sur le checkbox "Stay on top", cocher le checkbox "No instruction pipeline" et fermer la fenêtre du pipeline.

4. Lancer l’exécution du programme avec "RUN" en veillant à ce que la vitesse d’exécution soit à son maximum (avec "FAST").

5. Ouvrir la fenêtre du pipeline en cliquant sur "SHOW PIPELINE". Comment s’est faite l’exécution du programme ? Quels sont les paramètres (dans "Statistics") qui confirment votre observation ?

> hello
>
> hello
> 

6. Dans la fenêtre du pipeline ("SHOW PIPELINE") ouverte auparavant, décocher le checkbox "No instruction pipeline", cliquer sur FLUSH et fermer la fenêtre du pipeline.

7. Sélectionner la première instruction du code et relancer l’exécution du programme avec "RUN" en veillant à ce que la vitesse d’exécution soit à son maximum (avec "FAST").

8. Ouvrir la fenêtre du pipeline en cliquant sur "SHOW PIPELINE". Comment s’est déroulée l’exécution du programme ? Quels sont les paramètres (dans "Statistics") qui confirment votre observation ?

> hello
>
> hello
> 

9. Fermer la fenêtre du pipeline ouverte auparavant. Dans "PROGRAM LIST", sélectionner le programme créé auparavant ("PIPEONE") et supprimer-le avec "REMOVE PROGRAM".

10. Créer et sauvegarder dans "CPU INSTRUCTIONS IN MEMORY" le programme qui suit. Avant de l’exécuter, examiner-le et essayer de déduire la valeur de R03 (sachant que R03 est le registre destination).
```
MOV #3, R01  
MOV #10, R03  
MUL R01, R03  
HLT  
```
> hello
>
> hello
> 
11. Cliquer sur "SHOW PIPELINE" pour ouvrir la fenêtre du pipeline. Cocher le checkbox "DO no insert bubbles", cliquer sur "FLUSH" et fermer la fenêtre du pipeline.

12. Réinitialiser le contenu des registres avec "RESET ALL", sélectionner la première instruction du programme et lancer l’exécution du programme avec "RUN". Quelle est votre observation par rapport au contenu du registre R03 ? Donner une explication.

> hello
>
> hello
> 

13. Cliquer sur "SHOW PIPELINE" pour ouvrir la fenêtre du pipeline. Décocher le checkbox "Do no insert bubbles", cliquer sur "FLUSH" et fermer la fenêtre du pipeline.

14. Réinitialiser le contenu des registres avec "RESET ALL", sélectionner la première instruction du programme et relancer son exécution avec "RUN". Quelle est votre observation par rapport au contenu du registre R03 ? Donner une explication basée sur le contenu de la fenêtre du pipeline.

> hello
>
> hello
> 
