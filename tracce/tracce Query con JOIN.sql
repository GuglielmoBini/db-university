-- -------------------------------------------- QUERY CON JOIN

-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT `students`.`name`, `students`.`surname`, `students`.`degree_id`, `degrees`.`name`
FROM `students` 
JOIN `degrees` 
ON `degrees`.`id` = `students`.`degree_id` 
WHERE `degrees`.`name` = 'Corso di Laurea in Economia';

-- 2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
SELECT `degrees`.`id`, `degrees`.`name`, `degrees`.`level`, `degrees`.`department_id` 
FROM `degrees` 
JOIN `departments` 
ON `departments`.`id` = `degrees`.`department_id` 
WHERE `departments`.`name` = 'Dipartimento di Neuroscienze';

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT `teachers`.`name`, `teachers`.`surname`, `courses`.`name`, `courses`.`id` 
FROM `teachers` 
JOIN `course_teacher` 
ON `course_teacher`.`teacher_id` = `teachers`.`id` 
JOIN `courses` 
ON `courses`.`id` = `course_teacher`.`course_id` 
WHERE `teachers`.`id` = 44;

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT `students`.`id`, `students`.`name`, `students`.`surname`, `degrees`.`name` AS 'corso di laurea', `departments`.`name` AS 'dipartimento' 
FROM `students` 
JOIN `degrees` 
ON `degrees`.`id` = `students`.`degree_id` 
JOIN `departments` 
ON `departments`.`id` = `degrees`.`department_id` 
ORDER BY `students`.`surname` ASC;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT `degrees`.`id` AS 'id corso di laurea', `degrees`.`name` AS 'nome corso di laurea', `courses`.`id` AS 'id corso', `courses`.`name` AS 'nome corso', `teachers`.`id` AS ' id prof', `teachers`.`name` AS 'nome prof', `teachers`.`surname` AS 'cognome prof' 
FROM `degrees` 
JOIN `courses` 
ON `degrees`.`id` = `courses`.`degree_id` 
JOIN `course_teacher` 
ON `courses`.`id` = `course_teacher`.`course_id` 
JOIN `teachers` 
ON `course_teacher`.`teacher_id` = `teachers`.`id` 
ORDER BY `id corso di laurea` ASC

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)


-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami