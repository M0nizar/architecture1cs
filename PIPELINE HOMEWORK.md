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
> - SF (Speed Factor) dans les statistiques représente l’accélération.

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

> - runtime in cpu0 : 00:00:05.853. 
> - we are observing sequetial execution.
> - thats how we confirm from statistics that the execution was sequetial and without pipeline :
>     - speed factor (0.99) close to 1 that means there is no accelaration that the pipeline gives to the execution.
>     - high number of clock cycles (436): every stage takes one cycle.
>     - number of instructions matches the expected number 86.

6. Dans la fenêtre du pipeline ("SHOW PIPELINE") ouverte auparavant, décocher le checkbox "No instruction pipeline", cliquer sur FLUSH et fermer la fenêtre du pipeline.

7. Sélectionner la première instruction du code et relancer l’exécution du programme avec "RUN" en veillant à ce que la vitesse d’exécution soit à son maximum (avec "FAST").

8. Ouvrir la fenêtre du pipeline en cliquant sur "SHOW PIPELINE". Comment s’est déroulée l’exécution du programme ? Quels sont les paramètres (dans "Statistics") qui confirment votre observation ?

> - runtime in cpu0 : 00:00:03.835 , execution time is less then the one with disabled pipeline.
> - we are observing overlapped execution of the instructions.
> - thats how we confirm from statistics that the execution was with pipeline : 
>    - speed factor (2.56)>1 that means there is an acceleration.
>    - fewer number of clock cycles (168): overlapping stages reduces the number of cycles.
>    - busy stages : the appear of it means that the pipeline logic is working.
9. Fermer la fenêtre du pipeline ouverte auparavant. Dans "PROGRAM LIST", sélectionner le programme créé auparavant ("PIPEONE") et supprimer-le avec "REMOVE PROGRAM".

10. Créer et sauvegarder dans "CPU INSTRUCTIONS IN MEMORY" le programme qui suit. Avant de l’exécuter, examiner-le et essayer de déduire la valeur de R03 (sachant que R03 est le registre destination).
```
MOV #3, R01  
MOV #10, R03  
MUL R01, R03  
HLT  
```
> - expected value :
>    - mov #3 , R01  =>  R01 := 3
>    - MOV #10, R03  =>  R03 := 10
>    - MUL R01, R03  =>  R03 : = 3*10 = 30
11. Cliquer sur "SHOW PIPELINE" pour ouvrir la fenêtre du pipeline. Cocher le checkbox "DO no insert bubbles", cliquer sur "FLUSH" et fermer la fenêtre du pipeline.

12. Réinitialiser le contenu des registres avec "RESET ALL", sélectionner la première instruction du programme et lancer l’exécution du programme avec "RUN". Quelle est votre observation par rapport au contenu du registre R03 ? Donner une explication.

> - the value of R03 is not as expected, the execution show 0.
> - explication :
>    - inserts bubbles to avoid problems like data loss or data hazards, it gives some time for instructions to finish before the next one starts execution.
>    - When checking "No Insert Bubbles", the cpu does not do the delay of the stages thats why the next instruction may execute before the previous one give a result.
>    - thats why the multiplication did multiply 3 with 0 because the instuction of "MOV #10, R03" didnt finish execution and write its result in the register.

13. Cliquer sur "SHOW PIPELINE" pour ouvrir la fenêtre du pipeline. Décocher le checkbox "Do no insert bubbles", cliquer sur "FLUSH" et fermer la fenêtre du pipeline.

14. Réinitialiser le contenu des registres avec "RESET ALL", sélectionner la première instruction du programme et relancer son exécution avec "RUN". Quelle est votre observation par rapport au contenu du registre R03 ? Donner une explication basée sur le contenu de la fenêtre du pipeline.

> - the value of R03 is as we expected to be, the execution show 30.
> - explication :
>    - According to the pipeline stages diagram in the software, we observe that when automatic bubble insertion is enabled, the CPU allows the instruction "MOV #10, R03" to enter a new stage for reading the operand ? 
>     simultaneously while the previous instruction is still writing its result.
>    - However, when we check the option "Do not insert bubbles", the CPU does not wait, and the next instruction begins executing before the previous instruction has written its result. This causes the next 
>      instruction to use an incorrect value.
