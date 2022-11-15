
CREATE TABLE `grades` (
  `id` int UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  'cursada' int UNSIGNED NOT NULL,
  'final' int UNSIGNED,
  `id_student` int UNSIGNED NOT NULL,
  `id_subject` int UNSIGNED NOT NULL,
  CONSTRAINT fk_student_subject
  FOREIGN KEY (id_student) 
  REFERENCES students(id_student),
  CONSTRAINT fk_subject_subject
  FOREIGN KEY (id_subject) 
  REFERENCES subjects(id_subject)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `administrators` (
  `id_administrator` int UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` char(50) NOT NULL,
  `lastname` char(50) NOT NULL,
  `email` char(50) NOT NULL UNIQUE,
  `password` char(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `correlatives` (
  `id` int UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `id_subject_a` int UNSIGNED NOT NULL,
  `id_subject_b` int UNSIGNED,
  CONSTRAINT fk_correlative_a
  FOREIGN KEY (id_subject_a) 
  REFERENCES subjects(id_subject),
  CONSTRAINT fk_correlative_b
  FOREIGN KEY (id_subject_b) 
  REFERENCES subjects(id_subject)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `careers` (
  `id_career` int UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` char(50) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `students` (
  `id_student` int UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `id_career` int UNSIGNED NOT NULL,
  `identifier` int UNSIGNED NOT NULL UNIQUE,
  `name` char(50) NOT NULL,
  `lastname` char(50) NOT NULL,
  `email` char(50) NOT NULL UNIQUE,
  `password` char(64) NOT NULL,
  CONSTRAINT fk_student_career
    FOREIGN KEY (id_career) 
        REFERENCES careers(id_career)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `subjects` (
  `id_subject` int UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` char(80) NOT NULL UNIQUE,
  `teacher` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `students_subjects` (
  `id` int UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `id_student` int UNSIGNED NOT NULL,
  `id_subject` int UNSIGNED NOT NULL,
  `status` char(20) NOT NULL,
  CONSTRAINT fk_student_subject
    FOREIGN KEY (id_student) 
        REFERENCES students(id_student),
  CONSTRAINT fk_subject_subject
    FOREIGN KEY (id_subject) 
      REFERENCES subjects(id_subject)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `subjects_careers` (
  `id` int UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `id_subject` int UNSIGNED NOT NULL,
  `id_career` int UNSIGNED NOT NULL,
  CONSTRAINT fk_subject_career
    FOREIGN KEY (id_subject) 
        REFERENCES subjects(id_subject),
  CONSTRAINT fk_career_career
    FOREIGN KEY (id_career) 
        REFERENCES careers(id_career)     
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

COMMIT;
