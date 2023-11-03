CREATE DATABASE IF NOT EXISTS caloriemate;
USE caloriemate;

CREATE TABLE UserCM(
username VARCHAR(45) NOT NULL,
nama VARCHAR(45) NOT NULL,
email VARCHAR(64) NOT NULL,
userPassword VARCHAR(45) NOT NULL,
beratBadan FLOAT NOT NULL,
tinggiBadan FLOAT NOT NULL,
umur INT NOT NULL,
gender ENUM("Pria", "Wanita") NOT NULL,
PRIMARY KEY (username)
);
CREATE TABLE Data_BMI(
idData_BMI INT NOT NULL,
username VARCHAR(45) NOT NULL,
targetUser FLOAT NOT NULL,
skorBMI FLOAT,
levelBMI ENUM("Very Severely Underweight", "Severely Underweight",
"Underweight", "Normal", "Overweight", "Obese Class I",
"Obese Class II", "Obese Class III"),
PRIMARY KEY (idData_BMI),
FOREIGN KEY (username) REFERENCES UserCM(username)
);
CREATE TABLE Asupan(
idAsupan INT NOT NULL,
username VARCHAR(45),
namaAsupan VARCHAR(45) NOT NULL,
tipeMakMin ENUM("Makanan","Minuman") NOT NULL,
kalori FLOAT NOT NULL,
lemak FLOAT NOT NULL,
protein FLOAT NOT NULL,
karbohidrat FLOAT NOT NULL,
PRIMARY KEY (idAsupan),
FOREIGN KEY (username) REFERENCES UserCM(username)
);
CREATE TABLE  Asupan_harian(
idAsupanHarian INT NOT NULL,
username VARCHAR(45) NOT NULL,
limitHarian FLOAT,
PRIMARY KEY (idAsupanHarian),
FOREIGN KEY (username) REFERENCES userCM(username)
);
CREATE TABLE List_Asupan(
idAsupanHarian INT NOT NULL,
idAsupan INT NOT NULL,
waktu DATETIME NOT NULL,
FOREIGN KEY (idAsupan) REFERENCES Asupan(idAsupan),
FOREIGN KEY (idAsupanHarian) REFERENCES Asupan_harian(idAsupanHarian)
);
