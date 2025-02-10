-- Loo klientide tabel
CREATE TABLE client (
                        client_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'UNSIGNED INT on valitud, kuna ID ei saa olla negatiivne ja INT võimaldab salvestada kuni 4 294 967 295 kirjet.',
                        name VARCHAR(100) NOT NULL COMMENT 'VARCHAR(100) on valitud, kuna kliendi nimed on tavaliselt lühikesed ega ületa 100 tähemärki.',
                        email VARCHAR(100) UNIQUE NOT NULL COMMENT 'VARCHAR(100) on piisav, kuna e-posti aadressid jäävad üldjuhul alla 100 tähemärgi. UNIQUE tagab, et e-posti aadress oleks kordumatu.',
                        phone VARCHAR(15) DEFAULT NULL COMMENT 'VARCHAR(15) toetab rahvusvahelisi telefoninumbreid, mis sisaldavad kuni 15 tähemärki.',
                        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'TIMESTAMP salvestab automaatselt kirje loomise kuupäeva ja kellaaja ning on täpne sekundini.'
);

-- Loo sihtkohtade tabel
CREATE TABLE destination (
                             destination_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'UNSIGNED INT on valitud, kuna ID ei saa olla negatiivne ja INT toetab suurt arvu kirjeid.',
                             name VARCHAR(100) NOT NULL COMMENT 'VARCHAR(100) on piisav, kuna sihtkoha nimi on tavaliselt lühike.',
                             country VARCHAR(100) DEFAULT NULL COMMENT 'VARCHAR(100) on valitud, kuna riigi nimi ei ole kunagi liiga pikk.',
                             description TEXT DEFAULT NULL COMMENT 'TEXT võimaldab salvestada muutuva pikkusega kirjelduse, mis võib olla pikem kui VARCHAR-i limiit.',
                             created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'TIMESTAMP on valitud, kuna see salvestab täpse loomise kuupäeva ja aja automaatselt.'
);

-- Loo broneeringute tabel
CREATE TABLE booking (
                         booking_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'UNSIGNED INT on valitud, kuna ID ei saa olla negatiivne.',
                         client_id INT UNSIGNED NOT NULL COMMENT 'UNSIGNED INT viitab kliendi ID-le. Peab olema sama andmetüüp nagu client tabelis.',
                         type ENUM('flight', 'hotel', 'trip') NOT NULL COMMENT 'ENUM on valitud, kuna broneeringutüübid on fikseeritud ja neid on vähe.',
                         details TEXT DEFAULT NULL COMMENT 'TEXT on valitud, kuna lisainfo võib olla väga varieeruva pikkusega.',
                         created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'TIMESTAMP salvestab automaatselt kirje loomise aja.'
);

-- Loo lennureiside tabel
CREATE TABLE flight (
                        flight_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'UNSIGNED INT on valitud, kuna ID ei saa olla negatiivne.',
                        client_id INT UNSIGNED NOT NULL COMMENT 'Viide kliendile. Kasutame UNSIGNED INT, kuna see vastab client tabeli ID andmetüübile.',
                        airline VARCHAR(100) DEFAULT NULL COMMENT 'VARCHAR(100) on piisav, kuna lennufirma nimi on tavaliselt lühike.',
                        flight_number VARCHAR(50) DEFAULT NULL COMMENT 'VARCHAR(50) on valitud, kuna lennu numbrid on tavaliselt alla 50 tähemärgi.',
                        departure_time DATETIME DEFAULT NULL COMMENT 'DATETIME võimaldab salvestada nii kuupäeva kui ka kellaaja täpsusega minutisse.',
                        arrival_time DATETIME DEFAULT NULL COMMENT 'DATETIME võimaldab salvestada nii kuupäeva kui ka kellaaja täpsusega minutisse.',
                        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'TIMESTAMP salvestab automaatselt kirje loomise aja.'
);

-- Loo hotellibroneeringute tabel
CREATE TABLE hotel (
                       hotel_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'UNSIGNED INT on valitud, kuna ID ei saa olla negatiivne.',
                       client_id INT UNSIGNED NOT NULL COMMENT 'Viide kliendile. Peab olema sama andmetüüp nagu client tabeli ID.',
                       name VARCHAR(100) NOT NULL COMMENT 'VARCHAR(100) on piisav hotelli nime jaoks.',
                       address TEXT DEFAULT NULL COMMENT 'TEXT on valitud, kuna aadress võib olla muutuva pikkusega.',
                       check_in DATE NOT NULL COMMENT 'DATE on valitud, kuna salvestame ainult kuupäeva, ilma kellaajata.',
                       check_out DATE NOT NULL COMMENT 'DATE on valitud, kuna salvestame ainult kuupäeva, ilma kellaajata.',
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'TIMESTAMP salvestab automaatselt kirje loomise kuupäeva ja aja.'
);

-- Loo reiside tabel
CREATE TABLE trip (
                      trip_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'UNSIGNED INT on valitud, kuna ID ei saa olla negatiivne.',
                      client_id INT UNSIGNED NOT NULL COMMENT 'Viide kliendile. Peab olema sama andmetüüp nagu client tabeli ID.',
                      name VARCHAR(100) NOT NULL COMMENT 'VARCHAR(100) on piisav reisi nime jaoks.',
                      description TEXT DEFAULT NULL COMMENT 'TEXT on valitud, kuna reisi kirjeldus võib olla väga pikk.',
                      date DATE NOT NULL COMMENT 'DATE on valitud, kuna salvestame ainult reisi toimumise kuupäeva.',
                      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'TIMESTAMP salvestab automaatselt kirje loomise kuupäeva ja aja.'
);
